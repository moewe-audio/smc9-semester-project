/*
  ==============================================================================

    ExcitationConnection.cpp
    Created: 9 Oct 2024 7:40:53pm
    Author:  Levin

  ==============================================================================
*/

#include "ExcitationConnection.h"

void ExcitationConnection::prepareToPlay(double sampleRate, DynamicStiffString& scheme)
{
    this->sampleRate = sampleRate;
    this->scheme = &scheme;
    excitationIdx = loc;
    setExcitationParameters(1e6, 0.001);
}

void ExcitationConnection::applyExcitation(float excitationForce)
{
    double prevState = scheme->getState(excitationIdx, 1);
    double appliedForce = excitationForce - damping * prevState;
    scheme->applyForceAt(excitationIdx, 0, appliedForce);
}

void ExcitationConnection::setExcitationParameters(double stiffness, double damping)
{
    this->stiffness = stiffness;
    this->damping = damping;
}
