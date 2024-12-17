#include <vector>

namespace Window {

const int gBufferSize = 512;
std::vector<float> gInputBuffer(gBufferSize, 0.0f);
int gHopSize = 256;
int gInputBufferPointer = 0;
int gHopCounter = 0;
volatile int gCachedInputBufferPointer = 0;

bool addSample(float in)
{
    gInputBuffer[gInputBufferPointer++] = in;

    if (gInputBufferPointer >= gBufferSize) {
        gInputBufferPointer = 0;
    }
    if (++gHopCounter >= gHopSize) {
        gHopCounter = 0;
        gCachedInputBufferPointer = gInputBufferPointer;
        return true;
    }

    return false;
}

std::vector<float> getWindowBuffer()
{
    int cachedPointer = gCachedInputBufferPointer;
    std::vector<float> orderedBuffer(gBufferSize);
    for (int i = 0; i < gBufferSize; ++i) {
        orderedBuffer[i] = gInputBuffer[(cachedPointer + i) % gBufferSize];
    }
    return orderedBuffer;
}

}
