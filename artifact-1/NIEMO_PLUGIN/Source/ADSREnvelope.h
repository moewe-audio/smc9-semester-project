/*
  ==============================================================================

    ADSREnvelope.h
    Created: 25 Sep 2024 7:04:50pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>
#include "Utils.h"

class ADSREnvelope
{
public:
    ADSREnvelope(juce::AudioProcessorValueTreeState& apvts): apvts(apvts)
    { }

    void prepareToPlay (double sampleRate, int samplesPerBlock)
    {
        bufferSize = samplesPerBlock;
        buffer.clearQuick();
        buffer.resize(samplesPerBlock);
        buffer.fill(0);
        envelope.setSampleRate(sampleRate);
    }
    
    void processBlock(juce::MidiBuffer& midiBuffer)
    {
        for (const juce::MidiMessageMetadata metadata : midiBuffer)
        {
            const auto msg = metadata.getMessage();
            int noteNumber = msg.getNoteNumber();
            
            if (msg.isNoteOn())
            {
                if (currentNote != -1)
                {
//                    release();
                    trigger();
                }
                currentNote = noteNumber;
                trigger();
            }
            else if (msg.isNoteOff())
            {
                if (currentNote == noteNumber)
                {
                    release();
                    currentNote = -1;
                }
            }
        }
        updateParameters();
        for ( int i = 0; i < bufferSize; ++i)
        {
            buffer.set(i, envelope.getNextSample() );
        }
        
    }

    void trigger()
    {
        releaseState = false;
        envelope.noteOn();
    }

    void release()
    {
        releaseState = true;
        envelope.noteOff();
    }

    void reset()
    {
        releaseState = false;
        envelope.reset();
    }

    void updateParameters()
    {
        float attack = apvts.getRawParameterValue(ParameterIDs::ADSR_ATTACK)->load();
        const float decay = apvts.getRawParameterValue(ParameterIDs::ADSR_DECAY)->load();
        const float sustain = apvts.getRawParameterValue(ParameterIDs::ADSR_SUSTAIN)->load();
        const float release = apvts.getRawParameterValue(ParameterIDs::ADSR_RELEASE)->load();
        envelope.setParameters({
            attack,
            decay,
            sustain,
            release
        });
    }
    
    juce::Array<float>& getBuffer() { return buffer; };

    float getDamping() 
    {
        if (releaseState) return 10.0 - envelope.getParameters().release;
        return 0.0;
    };
    
    bool releaseState = false;
private:
    juce::AudioProcessorValueTreeState& apvts;
    juce::ADSR envelope;
    juce::Array<float> buffer;
    int bufferSize;
    int currentNote = -1;
};
