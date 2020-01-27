%##########################################################################
% Lab 2: Plotting
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: This program plots trigonometric functions on a figure
% Due date: 2020/01/24
%
% Author: Devon Sawatsky Burnham, dburnham@sfu.ca
% Input: <none>
% Output: A figure is created with three trigonometric lines plotted on it.
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
%   Sign here: Devon Burnham
%##########################################################################

%% Main Script

% Reset workspace
clear
clc

% Correct limits as per instructions, 
xMin = -2 * pi;
xMax = 2 * pi;

% Relatively arbitrary
yMin = -15;
yMax = 15;

% specificity of 10000 to ensure fine details are resolved
resolution = 10000;

x = linspace(xMin, xMax, resolution);

% ensures functions do not overwrite each other
hold on;

% Plots the three functions on the same figure
line1 = plot(x , trig1(x));
line2 = plot(x , trig2(x));
line3 = plot(x , trig3(x));

%releases hold
hold off;

% Labels the axes
xlabel("Angles (radian)");
ylabel("Voltage (V)");

% Sets limits for the x and y axes
xlim([xMin, xMax]);
ylim([yMin, yMax]);

% Creates a legend
legend('Function 1','Function 2','Function 3');


%% Calculating Functions
% All mathematical formulas taken from lab instructions
% and modified (e.g. "^" -> ".^") for MATLAB

function [return1] = trig1(x)
    return1 = cos(tan(x)) - tan(cos(x));
end

function [return2] = trig2(x)
    return2 = exp(-0.7 .* x) + (1 - sin(2 .* x)) ./ (x + tan(x .^ 2) .^ 2);
end

function [return3] = trig3(x)
    return3 = 1 + x / (x - 0.5) ./ (1 + (3.1 .* x .* exp(-x) + 2) ./ (sin(x)-cos(x.^2).^2));
end