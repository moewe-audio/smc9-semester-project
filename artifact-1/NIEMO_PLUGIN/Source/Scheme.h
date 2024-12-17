/*
  ==============================================================================

    Scheme.h
    Created: 8 Sep 2024 4:30:14pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include "JuceHeader.h"

class Scheme
{
public:
    virtual ~Scheme() = default;
    virtual void calculateScheme() = 0;
    virtual void forwardTimeStep() = 0;
    virtual std::vector<double*> state() = 0;
    virtual double getK() = 0;
    virtual double getRho() = 0;
    virtual double getA() = 0;
    virtual double getH() = 0;
    virtual double getN() = 0;
    virtual double getSig0() = 0;
};
