/*
  ==============================================================================

    RMS.h
    Created: 21 Sep 2024 1:43:41pm
    Author:  Levin
    Adapted from: https://github.com/chriskiefer/libcccrt

  ==============================================================================
*/

#pragma once

#include "JuceHeader.h"
#include <utility>
#include "MathUtils.h"

class ETC
{
public:
    ETC(int rmsWindowSize) : rmsWindowSize(rmsWindowSize), buffer(rmsWindowSize, 0.0f) {}
    
    void processBlock(juce::AudioBuffer<float>& buffer)
    {
        const int numChannels = buffer.getNumChannels();
        const int numSamples = buffer.getNumSamples();
        for (int i = 0; i < numSamples; ++i)
        {
            float value = 0.0f;
            for (int channel = 0; channel < numChannels; ++channel)
            {
                value += buffer.getReadPointer(channel)[i];
            }
            value /= numChannels;
            process(value);
        }
    }
    
    void process(float sample)
    {
        updateSlidingBuffer(sample);
        if (currentIndex == 0)
        {
            float rmsValue = calculateRMS();
            int symbol = discretizeRMS(rmsValue, 100);
            updateSymbolSequence(symbol);
            if (symbolSequence.size() >= symbolSequenceSize)
            {
                etcValue = calc(symbolSequence);
            }
        }
    }
    
    double getETCVal() { return etcValue; }
    
private:
    int rmsWindowSize;
    int symbolSequenceSize = 64;
    juce::Array<float> buffer;
    juce::Array<int> symbolSequence;
    int currentIndex = 0;
    double etcValue = 0;
    
    void updateSlidingBuffer(float sample)
    {
        buffer.set(currentIndex, sample);
        currentIndex = (currentIndex + 1) % rmsWindowSize;
    };
    
    float calculateRMS()
    {
        float sumOfSquares = 0.0f;
        for (float sample : buffer)
        {
            sumOfSquares += sample * sample;
        }
        return std::sqrt(sumOfSquares / rmsWindowSize);
    };
    
    int discretizeRMS(float rmsValue, int numBuckets)
    {
        rmsValue = juce::jlimit(0.0f, 2.0f, rmsValue);
        float bucketSize = 2.0f / numBuckets;
        int bucket = static_cast<int>(rmsValue / bucketSize);
        return juce::jmin(bucket, numBuckets - 1);
    }
    
    void updateSymbolSequence(int symbol)
    {
        symbolSequence.add(symbol);
        if (symbolSequence.size() > symbolSequenceSize)
        {
            symbolSequence.remove(0);
        }
    };
    
    std::pair<int, int> findMostFrequentPair(const juce::Array<int>& sequence)
    {
        std::map<std::pair<int, int>, int> pairFreqMap;
        int highScore = 0;
        int seqPos = 0;
        std::pair<int, int> winningPair;
        while (seqPos < sequence.size() - 1) {
            std::pair<int, int> pair = {sequence[seqPos], sequence[seqPos + 1]};
            std::map<std::pair<int, int>, int>::iterator it = pairFreqMap.find(pair);
            int score = 0;
            if (it == pairFreqMap.end()) {
                pairFreqMap[pair] = 1;
                score=1;
            } else {
                score = it->second + 1;
                it->second = score;
            }
            
            if (score > highScore)
            {
                highScore = score;
                winningPair = pair;
            }
            
            if (pair.first == pair.second)
            {
                if (seqPos < sequence.size() - 2)
                {
                    if (sequence[seqPos + 2] == sequence[seqPos])
                    {
                        seqPos++;
                    }
                }
            }
            
            seqPos++;
        }
        return winningPair;
    };

    auto substitute(const juce::Array<int>& seq, std::pair<int, int> pair)
    {
        int replacementSymbol = *std::max_element(seq.begin(), seq.end()) + 1;
        juce::Array<int> newSeq;
        newSeq.resize(seq.size());
        int src = 0, dest = 0;
        int replaceCount = 0;
        while (src < seq.size()) {
            if (src < seq.size() - 1) {
                if (seq[src] == pair.first && seq[src + 1] == pair.second) {
                    newSeq.set(dest, replacementSymbol);
                    src++;
                    replaceCount++;
                } else {
                    newSeq.set(dest, seq[src]);
                }
            } else {
                newSeq.set(dest, seq[src]);
            }
            src++;
            dest++;
        }
        newSeq.removeRange(dest, newSeq.size() - dest);
        return std::make_tuple(newSeq, replaceCount, replacementSymbol);
    }
    
    double calc(const juce::Array<int>& seq) {
        double N = 0;
        if (seq.size() > 1) {
            shannonEntropy::histoMap histo = shannonEntropy::calcHistogram(seq);
            double Hnew = shannonEntropy::calcProbability(histo, seq);

            juce::Array<int> newSeq = seq;
            
            while(Hnew >1e-6 && newSeq.size() > 1) {
//                DBG(newSeq.size());
                String str = "";
//                for (auto sym : newSeq) str += sym; str += " ";
//                DBG(str);
                std::pair<int,int> hfPair = findMostFrequentPair(newSeq);
                auto [newSeqRepl, replaceCount, replaceSym] = substitute(newSeq, hfPair);
//                DBG(newSeqRepl.size());
//                for (auto sym : newSeqRepl) DBG(sym);
                //reduce counts of replacement pair
                shannonEntropy::histoMap::iterator it = histo.find(hfPair.first);
                if (it != histo.end()) {
                    it->second -= replaceCount;
                    if (it->second == 0) {
                        histo.erase(it);
                    }
                }

                it = histo.find(hfPair.second);
                if (it != histo.end()) {  // Check if key exists
                    it->second -= replaceCount;
                    if (it->second == 0) {
                        histo.erase(it);  // Remove from the histogram if count is zero
                    }
                }
                auto histoEntry = make_pair(replaceSym, replaceCount);
                histo.insert(histoEntry);
                Hnew = shannonEntropy::calcProbability(histo, newSeqRepl);
                newSeq = newSeqRepl;
                N++;
            }
            N /= (seq.size() - 1.f);
        }
        return N;
    }
    
};
