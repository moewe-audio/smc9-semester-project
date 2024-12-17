#pragma once

#include <vector>
#include <unordered_map>
#include <cmath>
#include <algorithm>
#include <iostream>

struct shannonEntropy 
{
    using histoMap = std::unordered_map<int, int>;

    static shannonEntropy::histoMap calcHistogram(const std::vector<int>& seq)
    {
        shannonEntropy::histoMap histo;
        for (const int v : seq)
        {
            histo[v]++;
        }
        return histo;
    }
    
    static double calcProbability(const shannonEntropy::histoMap& histo, const std::vector<int>& seq)
    {
        if (seq.empty()) return 0.0;

        double scale = 1.0 / seq.size();
        double H = 0.0;
        for (const auto& v : histo)
        {
            double prob = v.second * scale;
            if (prob > 0)
            {
                H -= prob * std::log2(prob);
            }
        }
        return H;
    }
    
    static double calc(const std::vector<int>& seq)
    {
        shannonEntropy::histoMap histo = shannonEntropy::calcHistogram(seq);
        return shannonEntropy::calcProbability(histo, seq);
    }
    
    static float clamp (float value, float low, float high)
    {
    	if (value < low)
    	{
    		return low;
    	}
    	if (value > high)
    	{
    		return high;
    	}
    	return value;
    }
};
