%############################################################################
% <Lab 4b>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Plots the final added phasor from PhasorAdd.m
% Due date: 2020/02/07
%
% Author: Devon Burnham
% Input: None
% Output: Plot of summed phasors
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################
XLIM = pi/400;
YLIM = 10.1;

[A3, phi3] = PhasorAdd(6, 60*pi/180, 8, -30*pi/180);
% Calculating phasor sum

x = linspace(-XLIM, XLIM, 1000);
% Chosen limits considering the frequency of the given functions

y = A3*cos(200*pi*x + phi3);
% Same frequency as the summed cosines.

% Graphs the resultant function
plot(x, y);
title("Sum of Phasors");

xlim([-XLIM, XLIM]);
ylim([-YLIM, YLIM]);

xlabel("Time");
ylabel("Amplitude");
