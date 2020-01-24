%% ############################################################################
% LAB 2B
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Perform statistical analysis on a givevn array.
% Due date: 2020/01/24
%
% Author: Devon Burnham
% Input: Array of numbers
% Output: Various statistical values of the array
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Sawatsky Burnham_______
%############################################################################

%% Vector of floating point numbers to be analyzed
array = [3.1 5.8 6.3 2.6 2.1 7.0 5.0 8.2 4.2];

%% Finds various values from function, prints them to the console.
% Functions' purpose is self-explanatory

% size() returns a row vector in the form [rows, columns].
% Since we are given a row vector to begin with, the size of the vector
% is the 2nd entry in sz.
sz = size(array);
szArray = sz(2)

minValue = min(array)
maxValue = max(array)
meanValue = mean(array)
standardDeviation = std(array)
sortedArray = sort(array)
% Sorted low -> high.
