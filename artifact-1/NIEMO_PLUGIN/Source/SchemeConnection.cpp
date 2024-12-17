/*
  ==============================================================================

    SchemeConnection.cpp
    Created: 8 Sep 2024 1:01:25pm
    Author:  Levin

  ==============================================================================
*/

#include "SchemeConnection.h"

void SchemeConnection::prepareToPlay(double sampleRate)
{
    this->sampleRate = sampleRate;
    scheme1Idx = floor(0.213 * scheme1.getN());
    scheme2Idx = floor(0.43 * scheme2.getN());
}

void SchemeConnection::updateConnectionPoint()
{
    double K1 = 1e8;
    double K3 = 0.0;
    double R = 0.1;

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
