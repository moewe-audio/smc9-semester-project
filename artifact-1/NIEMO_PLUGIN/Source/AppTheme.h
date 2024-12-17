/*
  ==============================================================================

    AppTheme.h
    Created: 25 Sep 2024 10:16:53am
    Author:  Levin

  ==============================================================================
*/

#pragma once

#include <JuceHeader.h>

namespace ThemeGlobals
{
    static const int MARGIN = 10;
static const juce::Colour CHANNEL_COLOR = juce::Colour::fromString("FF575fcf");
}

class AppTheme : public juce::LookAndFeel_V4
{
public:
    AppTheme()
    {
        setColour(juce::TextButton::buttonColourId, juce::Colour::fromString("FF1e272e"));
        setColour(juce::TextButton::textColourOnId, juce::Colour::fromString("FFd2dae2"));
        setColour(juce::TextButton::textColourOffId, juce::Colour::fromString("FFd2dae2"));
        setColour(juce::Slider::thumbColourId, juce::Colour::fromString("FFffd32a"));
        setColour(juce::Slider::trackColourId, juce::Colour::fromString("FFffdd59"));
        setColour(juce::Slider::backgroundColourId, juce::Colour::fromString("FF485460"));
        setColour(juce::Slider::rotarySliderFillColourId, juce::Colour::fromString("FFffdd59"));
        setColour(juce::Slider::textBoxOutlineColourId, juce::Colour::fromString("FF1e272e"));
        setColour(juce::Slider::textBoxHighlightColourId, juce::Colour::fromString("FF1e272e"));
        setColour(juce::Slider::textBoxTextColourId, juce::Colour::fromString("FFd2dae2"));
        setColour(juce::Label::textColourId, juce::Colour::fromString("FFd2dae2"));
    }
    
};
