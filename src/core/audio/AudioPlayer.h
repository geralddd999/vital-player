#ifndef AUDIOPLAYER_H
#define AUDIOPLAYER_H

#include <SDL2/SDL.h>
#include <vector>
#include <string>
#include <mutex>

#include "AudioDecoder.h"
#include "AudioFrame.h"

class AudioPlayer{
    private:
        static void audioCallback(void* userdata, Uint8* stream, int len);
        void fillBuffer(Uint8* stream, int len);

        AudioDecoder media_decoder;

        enum class PlaybackState {Stopped, Playing, Paused};
        PlaybackState player_playback_state;
        
        std::vector<std::string> tracklist;
        size_t current_track_index;

        std::vector<uint8_t> audio_buffer;
        size_t buffer_position;

        SDL_AudioDeviceID audio_device;
        SDL_AudioSpec audio_spec;

        mutable std::mutex media_mutex;
    public:
        AudioPlayer();
        ~AudioPlayer();

        bool init();
        void setTrackList(const std::vector<std::string>& tracks);
        bool loadTrack(size_t index);
        
        void play();
        void pause();
        void seek(double seconds);
        void nextTrack();
        void prevTrack();
        
        double getDuration() const;
        double getCurrentTime() const;

        bool isPlaying() const;
        std::string getCurrentTrackPath() const;
};
#endif