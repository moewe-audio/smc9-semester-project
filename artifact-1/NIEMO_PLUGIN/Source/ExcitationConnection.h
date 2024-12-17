/*
  ==============================================================================

    ExcitationConnection.h
    Created: 9 Oct 2024 7:40:53pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include "DynamicStiffString.h"

class ExcitationConnection
{
public:
    void prepareToPlay(double sampleRate, DynamicStiffString& scheme);
    void applyExcitation(float excitationForce);
    void setExcitationParameters(double stiffness, double damping);

private:
    DynamicStiffString* scheme;
    int excitationIdx;
    double sampleRate;
    double stiffness;
    double damping;
    int loc = 40;
};
