%% ############################################################################
% LAB 2A
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Plot various trigonometric functions; learn the use of
% plot()
% Due date: 2020/01/24
%
% Author: Devon Burnham
% Input: None
% Output: A plot of all three functions on a single figure.
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Sawatsky Burnham_______
%############################################################################
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

x=linspace(xMin, xMax, resolution);

% Ensures functions do not overwrite each other
hold on;

% Plots all three functions with different colours
f1=plot(x, function1(x), 'r', 'LineWidth', 1.2)
f2=plot(x, function2(x), 'g', 'LineWidth', 1.2)
f3=plot(x, function3(x), 'b', 'LineWidth', 1.2)

% Releases hold
hold off;

% Labels the axes
xlabel("Angles (radian)")
ylabel("Voltage (V)")

% Sets limits for the x and y axes
xlim([xMin, xMax]);
ylim([yMin, yMax]);

% Creates a legend
legend("Function a)", "Function b)", "Function c)")


%% Calculating Functions
% All mathematical formulas taken from lab instructions
% and modified (e.g. "^" -> ".^") for MATLAB

function [return1] = function1(x)
    return1 = cos(tan(x)) - tan(cos(x));
end

function [return2] = function2(x)
    return2 = exp(-0.2.*x)+(1-cos(2.*x))./(x+tan(x.^2).^2);
end

function [return3] = function3(x)
    return3 = (1+x./(x-0.5))./(1+(3.1.*x.*exp(-x+2))./(sin(x)-cos(x.^3).^2));
end