#ifndef AUDIOFRAME_H
#define AUDIOFRAME_H

#include <vector>
#include <cstdint>

struct AudioFrame{

    std::vector<uint8_t> data; //stores the raw decoded data received from the decoder
    int size = 0;
    double pts = 0.0; 

};
#endif