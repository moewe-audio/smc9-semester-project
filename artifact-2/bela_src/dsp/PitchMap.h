#pragma once

#include <iostream>

class PitchMapper
{
public:
	void setF0EmptyString(float f0)
	{
       if (calibrationCounter < 16)
        {
            double d = 0.0002286; // diameter in m
            double rho = 7850; 
            double A = M_PI * pow(d / 2.0, 2); // in m^2
            mu = rho * A; // in kg / m
            
            f0Sum += f0;
            T += pow(2.0 * L0 * f0, 2) * mu;
            calibrationCounter++;
            
            std::cout << "Accumulated f0: " << f0Sum << " | Accumulated T: " << T << std::endl;
            return;
        }
        
        if (calibrationCounter == 16)
        {
            f0EmptyString = f0Sum / calibrationCounter;
            T = T / calibrationCounter;
            calibrationCounter++;
            std::cout << "Final f0EmptyString: " << f0EmptyString << " Hz | Final T: " << T << " N\n";
        }
	}
	
    float mapPitch(float f0)
    {
    	float newF = -1;
    	if (calibrationCounter > 16)
    	{
			float L = (L0 * (f0EmptyString / f0));
		
		    float semitones = maxSemitones - ((L0 - L) / stepLength);
		    float nearestSemitone = std::round(semitones);
			// float blendFactor = 0.434f;
			float blendFactor = 0.45f;
			float adjustedSemitones = semitones * (1.0f - blendFactor) + nearestSemitone * blendFactor;
		    // double newF = f0 * pow(2.0, semitones / 12.0);
		    newF = fRef * pow(2, (adjustedSemitones - nRef) / 12);
    	}
		return newF;
    }
private:
    float f0EmptyString = 0.0;
    float f0Sum = 0.0;
    float L0 = 0.336;
    float stepLength = 0.01;
    float mu = 0.0;
    float T = 0.0;
    float fRef = 247; // B3 note
    float nRef = 0;
    int maxSemitones = 13;
    int calibrationCounter = 0;
	
};