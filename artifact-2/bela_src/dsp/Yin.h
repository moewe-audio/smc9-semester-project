// adapted from: https://github.com/ashokfernandez/Yin-Pitch-Tracking

#ifndef Yin_h
#define Yin_h

class Yin {
	
public: 
	Yin();	
	Yin(float sampleRate,int bufferSize);
	void initialize(float sampleRate,int bufferSize);
	float getPitch(const float* buffer);
	float getProbability();
	
private: 
	float parabolicInterpolation(int tauEstimate);
	int absoluteThreshold();
	void cumulativeMeanNormalizedDifference();
	void difference(const float* buffer);
	double threshold;
	int bufferSize;
	int halfBufferSize;
	float sampleRate;
	float* yinBuffer;
	float probability;
};

#endif