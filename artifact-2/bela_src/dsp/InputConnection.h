#pragma once
#include "DynamicStiffString.h"

class InputConnection
{
public:
    
    InputConnection(DynamicStiffString& scheme1) : scheme1(scheme1) { };
    
    void prepareToPlay(double sampleRate) 
    {
	    this->sampleRate = sampleRate;
	    scheme1Idx = floor(0.213 * scheme1.getN());
	}

    void updateConnectionPoint(float in)
    {
	    double next = scheme1.getState(scheme1Idx, 0) - in;
	    double cur = scheme1.getState(scheme1Idx, 1) - in_1;
	    double prev = scheme1.getState(scheme1Idx, 2) - in_2;
	
		in_2 = in_1;
		in_1 = in;
	    
	    double rPlus = 0.5 * K1 + 0.5 * K3 * cur * cur + 0.5 * sampleRate * R;
	    double rMin = 0.5 * K1 + 0.5 * K3 * cur * cur - 0.5 * sampleRate * R;
	    
	    double force = (next + rMin / rPlus * prev) / (1.0 / rPlus + scheme1.getConnectionCoefficient());

        scheme1.applyForceAt(scheme1Idx, 0, force1 * -force * scheme1.getConnectionCoefficient());
	}
	
    float getScheme1ConnectionPointOutput() { return scheme1.getState(scheme1Idx, 0); };
    void setForce1(float force1) { this->force1 = force1; };
    void setResistance(double res) { this->R = res; };
    void setK1(double k1) { this->K1 = k1; };
    
    DynamicStiffString& scheme1;
    
    double sampleRate;
    
    int scheme1Idx;
    float force1 = 1.0f;
	double K1 = 1e8;
    double K3 = 0.0;
    double R = 0.1;
	float in_1 = 0.f;
	float in_2 = 0.f;
};
