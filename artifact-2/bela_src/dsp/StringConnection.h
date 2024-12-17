#pragma once
#include "DynamicStiffString.h"

class StringConnection
{
public:
    
    StringConnection(DynamicStiffString& scheme1, DynamicStiffString& scheme2 ,bool bidirectional = true, float feedbackSchemeWeight = 1.0) : scheme1(scheme1), scheme2(scheme2), feedbackSchemeWeight(feedbackSchemeWeight), bidirectional(bidirectional) { };
    
    void prepareToPlay(double sampleRate) 
    {
	    this->sampleRate = sampleRate;
	    scheme1Idx = floor(0.213 * scheme1.getN());
	    scheme2Idx = floor(0.43 * scheme2.getN());
	}

    void updateConnectionPoint()
    {
	    double next = scheme1.getState(scheme1Idx, 0) - scheme2.getState(scheme2Idx, 0);
	    double cur = scheme1.getState(scheme1Idx, 1) - scheme2.getState(scheme2Idx, 1);
	    double prev = scheme1.getState(scheme1Idx, 2) - scheme2.getState(scheme2Idx, 2);
	
	    
	    double rPlus = 0.5 * K1 + 0.5 * K3 * cur * cur + 0.5 * sampleRate * R;
	    double rMin = 0.5 * K1 + 0.5 * K3 * cur * cur - 0.5 * sampleRate * R;
	    
	    double force = (next + rMin / rPlus * prev) / (1.0 / rPlus + scheme1.getConnectionCoefficient() + scheme2.getConnectionCoefficient());
	    
	    if (bidirectional)
	    {
	        scheme1.applyForceAt(scheme1Idx, 0, force2 * -force * scheme1.getConnectionCoefficient());
	    }
	    scheme2.applyForceAt(scheme2Idx, 0, force1 * force * scheme2.getConnectionCoefficient() * feedbackSchemeWeight);
	}
	
    void setFeedbackSchemeWeight(float weight) { feedbackSchemeWeight = weight; };
    float getScheme1ConnectionPointOutput() { return scheme1.getState(scheme1Idx, 0); };
    void setForce1(float force1) { this->force1 = force1; };
    void setForce2(float force2) { this->force2 = force2; };
    void setResistance(double res) { this->R = res; };
    void setK1(double k1) { this->K1 = k1; };
    
    DynamicStiffString& scheme1;
    DynamicStiffString& scheme2;
    
    double sampleRate;
    
    int scheme1Idx, scheme2Idx;
    float feedbackSchemeWeight;
    bool bidirectional;
    float force1, force2 = 1.0;
	double K1 = 1e8;
    double K3 = 0.0;
    double R = 0.1;

};
