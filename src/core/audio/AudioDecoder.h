#ifndef AUDIODECODER_H
#define AUDIODECODER_H

#include <string>
#include "AudioFrame.h"

struct AVFormatContext;
struct AVCodecContext;
struct SwrContext;
struct SwrContetx;
struct AVFrame;
struct AVPacket;


class AudioDecoder{
    private:
        //ffmpeg related
        AVFormatContext* formatCtx;
        AVCodecContext* codecCtx;
        SwrContext* swrCtx;
        AVFrame* track_frame;
        AVPacket* track_packet;
        //track related stuff
        int audio_stream_index;
        int track_target_sample_rate;
        int track_target_channels;
        double track_time_base; double track_last_position; //more like last presentations but i like position ~bad convention.

    public:
        //Constructors and Deconstructors
        
        AudioDecoder();
        ~AudioDecoder();

        //Methods 

        //'open' the file and extract needed information as codecs, streams maybe metadata or should i do a different thing for  it?
        bool getContext(const std::string& url);
        // as the name says given a url(filepath) it will process the file and transform AVPackets to AVFrames using the codec extracted from the context of the file vro
        bool decoder();
        bool readAudioFrame(AudioFrame& audio_frame);
        void seek(double seconds);

        double getDuration() const;
        double getCurrentTime() const;
        bool isOpen() const;
        int getSampleRate() const;
        int getChannels() const;


        //Public interface so other classes can acces to it
        //bool open(const std::string &url);
        void close();
};

#endif