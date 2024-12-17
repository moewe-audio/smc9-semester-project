/*
  ==============================================================================

    MathUtils.h
    Created: 1 Sep 2024 2:35:08pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <vector>
#include <cmath>
#include <algorithm>
#include <iostream>
#include <unordered_map>
#include <cmath>
#include "JuceHeader.h"

using namespace std;

struct shannonEntropy 
{
    
    typedef unordered_map<int, int> histoMap;

    static shannonEntropy::histoMap calcHistogram(const juce::Array<int> &seq)
    {
        shannonEntropy::histoMap histo;
        for (const int v: seq)
        {
            histo[v]++;
        }
        return histo;
    }
    
    static double calcProbability(const shannonEntropy::histoMap &histo, const juce::Array<int> &seq)
    {
        if (seq.size() < 1) return 0.0;
        double scale = 1.0 / seq.size();
        double H = 0;
        for (const auto &v: histo)
        {
            double prob = v.second * scale;
            if (prob > 0)
            {
                H -= (prob * log2(prob));
            }
        }
        return H;
    }
    
    static double calc(const juce::Array<int> &seq)
    {
        shannonEntropy::histoMap histo = shannonEntropy::calcHistogram(seq);
        return shannonEntropy::calcProbability(histo, seq);
    }
};
