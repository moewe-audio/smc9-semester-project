/*
  ==============================================================================

    SchemeConnection.h
    Created: 8 Sep 2024 1:01:25pm
    Author:  Levin

  ==============================================================================
*/

#pragma once
#include "JuceHeader.h"
#include "DynamicStiffString.h"

class SchemeConnection
{
public:
    
    SchemeConnection(DynamicStiffString& scheme1, DynamicStiffString& scheme2 ,bool bidirectional = true, float feedbackSchemeWeight = 1.0) : scheme1(scheme1), scheme2(scheme2), feedbackSchemeWeight(feedbackSchemeWeight), bidirectional(bidirectional) { };
    
    void prepareToPlay(double sampleRate);
    void updateConnectionPoint();
    void setFeedbackSchemeWeight(float weight) { feedbackSchemeWeight = weight; };
    float getScheme1ConnectionPointOutput() { return scheme1.getState(scheme1Idx, 0); };
    void setForces(float force1, float force2) { this->force1 = force1; this->force2 = force2; };
    
private:

    
    DynamicStiffString& scheme1;
    DynamicStiffString& scheme2;
    
    double sampleRate;
    
    int scheme1Idx, scheme2Idx;
    float feedbackSchemeWeight;
    bool bidirectional;
    float force1, force2;
};
