#include "AudioPlayer.h"
#include <iostream>

AudioPlayer::AudioPlayer(): player_playback_state(PlaybackState::Stopped), current_track_index(0), buffer_position(0), audio_device(0) 
{

}

AudioPlayer::~AudioPlayer(){
    //just in case, make to ensure that the callback isnt using decoder whilst we close it

    std::lock_guard<std::mutex> lock(media_mutex);

    if(audio_device > 0){
        SDL_CloseAudioDevice(audio_device);
    }

    media_decoder.close();

    SDL_QuitSubSystem(SDL_INIT_AUDIO);
}

bool AudioPlayer::init(){
    int ret = SDL_Init(SDL_INIT_AUDIO);

    if(ret < 0){
        fprintf(stderr, "failed to init sdl");
        return false;
    }

    SDL_AudioSpec wantedSpec, haveSpec;
    
    SDL_zero(wantedSpec);

    wantedSpec.freq = 48000; //hardcoded might have to check a way to seek the capacities of the dacs/sound cards to be able to get the most out of them;
    wantedSpec.format = AUDIO_F32SYS;
    wantedSpec.channels = 2;
    wantedSpec.samples = 4096; //size of the buffer
    wantedSpec.callback = AudioPlayer::audioCallback;
    wantedSpec.userdata = this; 

    //openning the audio device
    audio_device = SDL_OpenAudioDevice(nullptr, 0, &wantedSpec, &haveSpec, 0);

    if(audio_device == 0){
        fprintf(stderr, "failed to open device");
        SDL_QuitSubSystem(SDL_INIT_AUDIO);
        return false;
    }

    audio_spec = haveSpec; //storing the spec we got from the openning part

    //starting the callback, start state is stopped, will just get silence
    SDL_PauseAudioDevice(audio_device,0);

    return true;
}

void AudioPlayer::setTrackList(const std::vector<std::string> &tracks){

    std::lock_guard<std::mutex> lock(media_mutex);
    tracklist = tracks;
    current_track_index = 0;
}

bool AudioPlayer::loadTrack(size_t index){
    std::lock_guard<std::mutex> lock(media_mutex);

    if(tracklist.empty() || index >= tracklist.size()) return false;


    //making sure to not have prev or trash values 
    player_playback_state = PlaybackState::Stopped;
    media_decoder.close();
    audio_buffer.clear();
    buffer_position = 0;

    current_track_index = index;
    bool did_open = media_decoder.getContext(tracklist[current_track_index]);

    if(!did_open){
        fprintf(stderr, "failed to open track");
    }

    return did_open;
}

void AudioPlayer::play(){
    std::lock_guard<std::mutex> lock(media_mutex);

    if(media_decoder.isOpen()){
        player_playback_state = PlaybackState::Playing;
    }
}

void AudioPlayer::pause(){
    std::lock_guard<std::mutex> lock(media_mutex);
    player_playback_state = PlaybackState::Paused;
}

void AudioPlayer::seek(double seconds){

    std::lock_guard<std::mutex> lock(media_mutex);
    if(media_decoder.isOpen()){
        media_decoder.seek(seconds);
        //clear the buffer because new position
        audio_buffer.clear();
        buffer_position = 0;
    }
}

void AudioPlayer::nextTrack(){
    if(tracklist.empty()) return;

    size_t nextIndex = (current_track_index+1) % tracklist.size(); // to change because this will repeat even if user doesnt want to

    if(loadTrack(nextIndex)){
        play();
    }
}

void AudioPlayer::prevTrack(){

    if(tracklist.empty()) return;

    size_t prevIndex = (current_track_index == 0) ? tracklist.size() -1 : current_track_index-1;

    if(loadTrack(prevIndex)) play();

}

double AudioPlayer::getDuration() const{
    std::lock_guard<std::mutex> lock(media_mutex);
    return media_decoder.getDuration();
}

double AudioPlayer::getCurrentTime() const{
    std::lock_guard<std::mutex> lock(media_mutex);
    return media_decoder.getCurrentTime();
}

bool AudioPlayer::isPlaying() const{
    std::lock_guard<std::mutex> lock(media_mutex);
    return player_playback_state == PlaybackState::Playing;
}

std::string AudioPlayer::getCurrentTrackPath() const{
    std::lock_guard<std::mutex> lock(media_mutex);

    if(!tracklist.empty() && current_track_index < tracklist.size()){
        return tracklist[current_track_index];
    }

    return "";
}

//sdl related
void AudioPlayer::audioCallback(void* userdata, Uint8* stream, int len){
    //cast to the current class instance
    AudioPlayer* player = static_cast<AudioPlayer*>(userdata);

    player->fillBuffer(stream,len);
}

void AudioPlayer::fillBuffer(Uint8* stream, int len){
    std::lock_guard<std::mutex> lock(media_mutex);

    Uint8* stream_pos = stream;
    int bytes_left = len;

    if(player_playback_state != PlaybackState::Playing){
        //filling silence
        SDL_memset(stream, 0 , len);
        return;
    }

    while(bytes_left > 0){
        //if internal buffer has no more data
        if(buffer_position >= audio_buffer.size()){
            AudioFrame frame;

            if(!media_decoder.readAudioFrame(frame)){
                // either EOF or error
                player_playback_state = PlaybackState::Stopped;

                //fill with silence
                SDL_memset(stream_pos, 0, bytes_left);
                break;
            }

            //we read something, lets move the data to the buffer
            audio_buffer = std::move(frame.data);
            buffer_position = 0;

            if(audio_buffer.empty()){
                player_playback_state = PlaybackState::Stopped;

                SDL_memset(stream_pos, 0, bytes_left);
                break;
            }
        }

        // the buffer still has data, cpy to stream

        size_t bytes_to_copy = std::min((size_t) bytes_left, audio_buffer.size() - buffer_position);

        memcpy(stream_pos, audio_buffer.data() + buffer_position, bytes_to_copy);

        buffer_position += bytes_to_copy;
        stream_pos += bytes_to_copy;
        bytes_left -= bytes_to_copy;
    }
}

