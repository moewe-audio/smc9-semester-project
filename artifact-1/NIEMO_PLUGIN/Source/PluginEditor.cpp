/*
  ==============================================================================

    This file contains the basic framework code for a JUCE plugin editor.

  ==============================================================================
*/

#include "PluginProcessor.h"
#include "PluginEditor.h"

//==============================================================================
NIEMO_PLUGINAudioProcessorEditor::NIEMO_PLUGINAudioProcessorEditor (NIEMO_PLUGINAudioProcessor& p)
    : AudioProcessorEditor (&p), audioProcessor (p), stiffStringEditor1(0, p.apvts), stiffStringEditor2(1, p.apvts), adsr(p.apvts)
{
    setSize (500, 780);
    addAndMakeVisible(header);
    addAndMakeVisible(stiffStringEditor1);
    addAndMakeVisible(stiffStringEditor2);
    addAndMakeVisible(adsr);
    juce::LookAndFeel::setDefaultLookAndFeel(&theme);

}

NIEMO_PLUGINAudioProcessorEditor::~NIEMO_PLUGINAudioProcessorEditor()
{
}

//==============================================================================
void NIEMO_PLUGINAudioProcessorEditor::paint (juce::Graphics& g)
{
    g.fillAll(juce::Colour::fromString("FF1e272e"));
}

void NIEMO_PLUGINAudioProcessorEditor::resized()
{
    auto area = getBounds();
    header.setBounds(area.removeFromTop(50));
    area = area.reduced(ThemeGlobals::MARGIN);
    area.removeFromBottom(40);
    auto channelArea = area.removeFromTop(470);
    stiffStringEditor1.setBounds(channelArea.removeFromLeft(170));
    channelArea.removeFromLeft(50);
    stiffStringEditor2.setBounds(channelArea.removeFromLeft(170));
    area.removeFromTop(15);
    adsr.setBounds(area.removeFromTop(170).removeFromLeft(250));

}
