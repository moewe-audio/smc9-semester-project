#pragma once

#include <iostream>
#include <vector>
#include <cmath>
#include <algorithm>
#include <random>
#include <numeric>

struct RPC {

    // Generates a projection matrix
    static std::vector<std::vector<double>> createProjectionMatrix(size_t windowSize, size_t nDimensions) {
        std::mt19937_64 rng(42);
        std::normal_distribution<double> dist(0, std::sqrt(1.0 / nDimensions));

        std::vector<std::vector<double>> projectionMatrix(nDimensions, std::vector<double>(windowSize));
        for (size_t i = 0; i < nDimensions; i++) {
            for (size_t j = 0; j < windowSize; j++) {
                projectionMatrix[i][j] = dist(rng);
            }
        }
        return projectionMatrix;
    }

    // Applies the projection matrix to the input data
    static std::vector<std::vector<double>> calcProjection(
        const std::vector<std::vector<double>>& projectionMatrix,
        const std::vector<double>& data,
        double hop = 0.5
    ) {
        size_t hopSize = std::max<size_t>(1, static_cast<size_t>(projectionMatrix[0].size() * hop));
        size_t nHops = (data.size() - projectionMatrix[0].size()) / hopSize + 1;

        std::vector<std::vector<double>> projections(projectionMatrix.size(), std::vector<double>(nHops, 0));

        for (size_t i = 0; i < nHops; i++) {
            std::vector<double> dataWindow(projectionMatrix[0].size());
            std::copy(data.begin() + i * hopSize, data.begin() + i * hopSize + projectionMatrix[0].size(), dataWindow.begin());

            for (size_t row = 0; row < projectionMatrix.size(); row++) {
                projections[row][i] = std::inner_product(projectionMatrix[row].begin(), projectionMatrix[row].end(), dataWindow.begin(), 0.0);
            }
        }

        return projections;
    }

    // Converts a tuple of indexes to a flat array index
    static size_t calcXdFlatArrayIndex(const std::vector<size_t>& indexTuple, size_t bound) {
        size_t index = indexTuple[0];
        for (size_t i = 1; i < indexTuple.size(); i++) {
            index *= bound;
            index += indexTuple[i];
        }
        return index;
    }

    // Calculates the area of projections
    static double calculateProjectionArea(std::vector<std::vector<double>>& projections, size_t resolution) {
        size_t dims = projections.size();
        for (size_t row = 0; row < projections.size(); row++) {
            double minVal = *std::min_element(projections[row].begin(), projections[row].end());
            for (double& val : projections[row]) {
                val -= minVal;
            }

            double maxVal = *std::max_element(projections[row].begin(), projections[row].end());
            if (maxVal > 0) {
                for (double& val : projections[row]) {
                    val /= (maxVal * 1.000001);
                }
            }

            for (double& val : projections[row]) {
                val *= resolution;
                val = std::floor(val);
            }
        }

        std::vector<size_t> indexes(projections[0].size());
        for (size_t i = 0; i < projections[0].size(); i++) {
            std::vector<size_t> indexTuple(dims);
            for (size_t j = 0; j < dims; j++) {
                indexTuple[j] = static_cast<size_t>(projections[j][i]);
            }
            indexes[i] = calcXdFlatArrayIndex(indexTuple, resolution);
        }

        std::sort(indexes.begin(), indexes.end());
        auto last = std::unique(indexes.begin(), indexes.end());
        indexes.erase(last, indexes.end());
        return static_cast<double>(indexes.size());
    }

    static double calc(
        const std::vector<std::vector<double>>& projectionMatrix,
        const std::vector<double>& data,
        size_t resolution,
        double hop = 0.5
    ) {
        auto projections = calcProjection(projectionMatrix, data, hop);
        return calculateProjectionArea(projections, resolution);
    }
};
