/*
  ==============================================================================

    ADSREditor.h
    Created: 6 Oct 2024 3:10:18pm
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>

//==============================================================================
/*
*/
#pragma once

#include <JuceHeader.h>
#include "Utils.h"
#include "LabeledSlider.h"

class ADSREditor : public juce::Component, juce::Timer
{
public:
    ADSREditor(juce::AudioProcessorValueTreeState& apvts)
        : apvts(apvts), attackSlider(ParameterIDs::ADSR_ATTACK, "Attack", apvts), decaySlider(ParameterIDs::ADSR_DECAY, "Decay", apvts), sustainSlider(ParameterIDs::ADSR_SUSTAIN, "Sustain", apvts), releaseSlider(ParameterIDs::ADSR_RELEASE, "Release", apvts)
    {
        startTimerHz(15);
        addAndMakeVisible(attackSlider);
        addAndMakeVisible(decaySlider);
        addAndMakeVisible(sustainSlider);
        addAndMakeVisible(releaseSlider);
    }

    ~ADSREditor() override = default;

    void paint(juce::Graphics& g) override
    {
        g.setColour(juce::Colour::fromString("FF161d23"));
        g.fillRoundedRectangle(getLocalBounds().toFloat(), 15.f);
        g.setColour(juce::Colour::fromString("FF485460"));
        g.drawRoundedRectangle(getLocalBounds().toFloat(), 15.f, 3.f);
        g.setColour(juce::Colour::fromString("FF485460"));
        g.drawRoundedRectangle(adsrArea.toFloat(), 2, 1.4);
        int rectSize = 20;
        juce::Rectangle<float> channelIcon(8, 5, 27, rectSize);
        g.setColour(juce::Colour::fromString("FFef5777"));
        g.fillRoundedRectangle(channelIcon, 5.f);
        g.setColour(juce::Colours::white);
        g.setFont(juce::FontOptions(13.0f, juce::Font::bold));
        g.drawText("ENV", channelIcon, juce::Justification::centred, true);
        drawGraph(g, adsrArea.reduced(4));
    }

    void resized() override
    {
        juce::Rectangle<int> area = getLocalBounds().reduced(20);
        auto sliderArea = area.removeFromBottom(75);
        attackSlider.setBounds(sliderArea.removeFromLeft(sliderArea.getWidth() / 4).reduced(2));
        decaySlider.setBounds(sliderArea.removeFromLeft(sliderArea.getWidth() / 3).reduced(2));
        sustainSlider.setBounds(sliderArea.removeFromLeft(sliderArea.getWidth() / 2).reduced(2));
        releaseSlider.setBounds(sliderArea.reduced(2));
        adsrArea = area;
    }

    void timerCallback() override
    {
        this->repaint();
    }
    
private:
    juce::AudioProcessorValueTreeState& apvts;
    juce::Rectangle<int> adsrArea;
    LabeledSlider attackSlider, decaySlider, sustainSlider, releaseSlider;
    std::unique_ptr<juce::AudioProcessorValueTreeState::SliderAttachment> attackAttachment, decayAttachment, sustainAttachment, releaseAttachment;

    void drawGraph(juce::Graphics& g, juce::Rectangle<int> area)
    {
        g.setColour(juce::Colour::fromString("FFffa801"));
        g.strokePath(getEnvelopeGraphPath(area), juce::PathStrokeType(2.0f));
    }

    juce::Path getEnvelopeGraphPath(juce::Rectangle<int> area)
    {
        juce::Path path;
        float totalWidth = static_cast<float>(area.getWidth());
        float totalHeight = static_cast<float>(area.getHeight());

        float attack = attackSlider.slider.getValue();
        float decay = decaySlider.slider.getValue();
        float sustain = sustainSlider.slider.getValue();
        float release = releaseSlider.slider.getValue();

        float totalDuration = attack + decay + release;

        float attackX = (attack / totalDuration) * totalWidth;
        float decayX = (decay / totalDuration) * totalWidth;

        path.startNewSubPath(area.getX(), area.getBottom());
        path.lineTo(area.getX() + attackX, area.getY());                    // Attack
        path.lineTo(area.getX() + attackX + decayX, area.getY() + (1 - sustain) * totalHeight); // Decay/Sustain
        path.lineTo(area.getX() + totalWidth, area.getBottom());            // Release

        return path;
    }

    JUCE_DECLARE_NON_COPYABLE_WITH_LEAK_DETECTOR(ADSREditor)
};
