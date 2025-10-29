#include "AudioDecoder.h"


// using system ffmpeg header files, idk until what point is it a good idea to do this
//given that some other things might change but it depends if maintain the project or nah
extern "C"{
    #include <libavformat/avformat.h>
    #include <libavcodec/avcodec.h>
    #include <libavutil/avutil.h>
    #include <libswresample/swresample.h>
}

typedef unsigned int uint;
AudioDecoder::AudioDecoder() : formatCtx(nullptr), codecCtx(nullptr), swrCtx(nullptr), 
track_frame(nullptr), track_packet(nullptr), audio_stream_index(-1),
track_target_sample_rate(48000), track_target_channels(2), 
track_time_base(0.0), track_last_position(0.0)
{
    track_frame = av_frame_alloc();
    track_packet = av_packet_alloc();
}

AudioDecoder::~AudioDecoder(){
    close();
    av_packet_free(&track_packet);
    av_frame_free(&track_frame);
}

void AudioDecoder::close(){
    if(swrCtx) {
        swr_free(&swrCtx); swrCtx = nullptr;
    }
    
    if(codecCtx){ 
        avcodec_free_context(&codecCtx);
        codecCtx = nullptr;
    }

    if(formatCtx) {
        avformat_close_input(&formatCtx);
        formatCtx = nullptr;
    }

    audio_stream_index = -1;

}

// bool AudioDecoder::open(const std::string& url){
//     getContext(url);

// }

bool AudioDecoder::getContext(const std::string& url){
    close(); //clear everything just to be safe
    
    int ret = avformat_open_input(&formatCtx, url.c_str(),nullptr, nullptr);
    if(ret<0){
        fprintf(stderr, "Failed to read the file's header");
        return false;
    }

    ret = avformat_find_stream_info(formatCtx, nullptr);
    if(ret<0){
        fprintf(stderr, "Failed to find streams in the file, is it an audio-video file??");
        return false;
    }
    
    const AVCodec* codec{nullptr};
    AVCodecParameters* codecParams{nullptr};

    for(uint i=0; i< formatCtx->nb_streams;i++){
        AVCodecParameters* indexCodecPar = formatCtx->streams[i]->codecpar;

        if(indexCodecPar->codec_type == AVMEDIA_TYPE_AUDIO){
            audio_stream_index = i;
            codecParams = formatCtx->streams[i]->codecpar;
            codec = avcodec_find_decoder(codecParams->codec_id);
            if(codec) break; //if theres a suitable codec then atleast we can do something
        }
    }

    //Once we've found our audio codec we can find the decoder
    if(audio_stream_index == -1 || !codec){
        fprintf(stderr, "No audio-streams in the file or no codec available for processing");
        return false;
    }

    codecCtx = avcodec_alloc_context3(codec);
     
    ret = avcodec_parameters_to_context(codecCtx, codecParams);
    if(!codecCtx || ret < 0){
        fprintf(stderr, "failed to allocate context or to input the params");
        return false;
    }

    ret = avcodec_open2(codecCtx, codec, nullptr);

    if(ret< 0){
        return false;
    }
    track_time_base = av_q2d(formatCtx->streams[audio_stream_index]->time_base);

    AVChannelLayout out_ch_layout;
    av_channel_layout_from_mask(&out_ch_layout, AV_CH_LAYOUT_STEREO);

    AVChannelLayout in_ch_layout =  codecCtx->ch_layout;

    if(in_ch_layout.nb_channels == 0){
        av_channel_layout_default(&in_ch_layout, codecCtx->ch_layout.nb_channels);
    }
    
    swrCtx = swr_alloc();
    if(!swrCtx){
        fprintf(stderr, "failed to allocate context for the resampler");
        return false;
    }

    ret = swr_alloc_set_opts2(&swrCtx,
                                 &out_ch_layout,
                                AV_SAMPLE_FMT_FLT,// changing from s16
                                track_target_sample_rate,
                                &(codecCtx->ch_layout),
                                codecCtx->sample_fmt,
                                codecCtx->sample_rate,
                                0,
                                nullptr);
    
    if(ret < 0){
        fprintf(stderr, "failed to set the params for the resampler");
        return false;
    }
    ret = swr_init(swrCtx);
    if(ret<0){
        fprintf(stderr, "Failed to init the resampler");
        return false;
    }

    return true;

}

bool AudioDecoder::readAudioFrame(AudioFrame& audio_frame){
    while(true){
        int ret = avcodec_receive_frame(codecCtx, track_frame);

        if(ret == 0){
            track_last_position = track_frame->pts * track_time_base;
            audio_frame.pts = track_last_position;
            
            long long output_sample_count = av_rescale_rnd(
                                            track_frame->nb_samples,
                                            track_target_sample_rate,
                                            codecCtx->sample_rate,
                                            AV_ROUND_UP
                                        );
            
            int output_buffer_size = av_samples_get_buffer_size(NULL, 
                                            track_target_channels,
                                            (int) output_sample_count,
                                            AV_SAMPLE_FMT_FLT,
                                            1);
            audio_frame.data.resize(output_buffer_size);

            u_int8_t* resampled_data_ptr = audio_frame.data.data();

            int converted_samples = swr_convert(swrCtx,
                                                &resampled_data_ptr,
                                                (int) output_sample_count,
                                                (const u_int8_t**)track_frame->data,
                                                track_frame->nb_samples );
            audio_frame.size = converted_samples*track_target_channels*av_get_bytes_per_sample(AV_SAMPLE_FMT_FLT);

            audio_frame.data.resize(audio_frame.size);

            av_frame_unref(track_frame);
            return true;
        }
        
        if(ret == AVERROR_EOF || ret == AVERROR(EAGAIN)){
            av_packet_unref(track_packet);

            ret = av_read_frame(formatCtx, track_packet);

            if(ret<0) return false; //eof or read err

            if(track_packet->stream_index == audio_stream_index){
                ret = avcodec_send_packet(codecCtx, track_packet);
                if(ret<0){
                    av_packet_unref(track_packet);
                    //fprintf(stderr, "failed to send packet to decoder")
                    return false;
                }
            }
            av_packet_unref(track_packet);

            continue;
        }else{
            //another type of error occurred
            char err[AV_ERROR_MAX_STRING_SIZE] = {0};
            av_strerror(ret,err, AV_ERROR_MAX_STRING_SIZE);
            fprintf(stderr, err);

            av_frame_unref(track_frame);
            av_packet_unref(track_packet);
        }
    }
}


void AudioDecoder::seek(double seconds){
    if(!formatCtx || track_time_base == 0.0 ) return;

    int64_t timestamp = static_cast<int64_t>(seconds/track_time_base);
    av_seek_frame(formatCtx, audio_stream_index, timestamp, AVSEEK_FLAG_BACKWARD);
    
    avcodec_flush_buffers(codecCtx);
}

double AudioDecoder::getDuration() const{
    if(!formatCtx) return 0.0;

    return (double) formatCtx->duration /AV_TIME_BASE;
}

bool AudioDecoder::isOpen() const{
    return formatCtx != nullptr;
}

double AudioDecoder::getCurrentTime() const{
    return track_last_position;
}

int AudioDecoder::getSampleRate() const{
    return track_target_sample_rate;
}

int AudioDecoder::getChannels() const{
    return track_target_channels;
}
