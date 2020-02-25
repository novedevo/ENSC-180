%############################################################################
% <Lab 4a>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Calculates some values about complex numbers and prints them
% Due date: 2020/02/07
%
% Author: Devon Burnham
% Input: Components of a complex number
% Output: Values of said complex number
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################

%% Get user input
rl=input("Enter the real part of a complex number: ");
comp=input("Enter the imaginary part of a complex number: ");

%% Create complex number from user-given input
z=rl+comp*1i;l1

%% Print below data to screen, showing the magnitude and phase.
fprintf("The magnitude and phase of %d + %di is\n", real(z), imag(z))
fprintf("Magnitude = %.4f Phase angle = %.4f degrees\n", abs(z), angle(z)*180/pi)
