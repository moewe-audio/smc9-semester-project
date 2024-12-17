#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <numeric>

namespace fractal {

	int rmsWindowSize = 128;
	int symbolSequenceSize = 64;
	std::vector<float> buffer = std::vector<float>(rmsWindowSize, 0.0);
	std::vector<float> symbolSequence = std::vector<float>();
	int currentIndex = 0;
	double etcValue = 0;
	AuxiliaryTask calcTask;
	
	float getValue()
	{
		return etcValue;
	}
	
	static double calc(const std::vector<float>& sequence) {
	  if (sequence.empty()) {
	    throw std::invalid_argument("Input sequence must not be empty");
	  }
	
	  // Scale sequence to the range [0, 1]
	  std::vector<float> sequence_scaled(sequence.size());
	  float min_val = *std::min_element(sequence.begin(), sequence.end());
	  float max_val = *std::max_element(sequence.begin(), sequence.end());
	  if (max_val - min_val == 0) {
	    return 0;
	  }
	  for (size_t i = 0; i < sequence.size(); ++i) {
	    sequence_scaled[i] = (sequence[i] - min_val) / (max_val - min_val);
	  }
	
	  // Compute first-order differences (y)
	  std::vector<double> y(sequence_scaled.size() - 1);
	  for (size_t i = 1; i < sequence_scaled.size(); ++i) {
	    y[i - 1] = sequence_scaled[i] - sequence_scaled[i - 1];
	  }
	
	  // Compute Euclidean distances for each segment
	  double x = 1.0 / (sequence_scaled.size() - 1);
	  double x_squared = x * x;
	  for (size_t i = 0; i < y.size(); ++i) {
	    y[i] = std::sqrt(y[i] * y[i] + x_squared);
	  }
	
	  // Sum up all segment lengths
	  double L = std::accumulate(y.begin(), y.end(), 0.0);
	
	  // Calculate the Sevcik Fractal Dimension (SFD)
	  double sfd = 1 + (std::log(L) / std::log(2.0 * y.size()));
	  if (std::isnan(sfd)) return 0;
	  return sfd - 1.0;
	}
	
	
	static void executeCalcTask(void* arg) {
	   etcValue = fractal::calc(symbolSequence);
	}

	void init(int rmsSize) 
	{
		rmsWindowSize = rmsSize;
		buffer = std::vector<float>(rmsSize, 0.0);
		calcTask = Bela_createAuxiliaryTask(executeCalcTask, 90, "calcTask");
	}
	
	void updateSlidingBuffer(float sample)
	{
	    buffer[currentIndex] = sample;
	    currentIndex = (currentIndex + 1) % rmsWindowSize;
	}
	
	void updateSymbolSequence(float symbol)
	{
	    symbolSequence.push_back(symbol);
	    if (symbolSequence.size() > symbolSequenceSize)
	    {
	        symbolSequence.erase(symbolSequence.begin());
	    }
	}
	
	float calculateRMS()
	{
	    float sumOfSquares = 0.0f;
	    for (float sample : buffer)
	    {
	        sumOfSquares += sample * sample;
	    }
	    return std::sqrt(sumOfSquares / rmsWindowSize);
	}
	
	void process(float sample)
	{
	    updateSlidingBuffer(sample);
	    if (currentIndex == 0)
	    {
	        float rmsValue = calculateRMS();
	        // int symbol = discretizeRMS(rmsValue, 1000);
	        updateSymbolSequence(rmsValue);
	        if (symbolSequence.size() >= symbolSequenceSize)
	        {
	            // Bela_scheduleAuxiliaryTask(calcTask);
	            etcValue = calc(symbolSequence);
	        }
	    }
}
};