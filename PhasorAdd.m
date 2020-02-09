%############################################################################
% <Lab 4b>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Adds phasors
% Due date: 2020/02/07
%
% Author: Devon Burnham
% Input: Two phasors
% Output: Single phasor, formed from the sum of the other two
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################

%% Main function
function [A3,phi3] = PhasorAdd(A1,phi1,A2,phi2)
% Usage [A3,phi3] = PhasorAdd(A1,phi1,A2,phi2)
% Calculates the phasor for the sum of two phasors.
% A1, phi1 = magnitude and phase shift in radians of 1st sine wave (note 
% the 1st phase is "phi one")
% A2, phi2 = magnitude and phase shift in radians of 2nd sine wave.
% A3, phi3 = magnitude and phase shift of sum of sinusoids.

    % Create complex phasors from given amplitudes and phases
    Phasor1 = A1*exp(i*phi1);
    Phasor2 = A2*exp(i*phi2);
    
    % Calculate the phasor sum.
    Phasor3 = Phasor1+Phasor2;
    
    % Find the magnitude and phase angle of the phasor for the sum.
    A3 = abs(Phasor3);
    phi3 = angle(Phasor3);

    %% Below is the way that one would calculate it without complex numbers
    % A3 = sqrt((A1.*cos(phi1) + A2.*cos(phi2)).^2  +  (A1.*sin(phi1) + A2.*sin(phi2)).^2)
    % phi3 = atan((A1.*sin(phi1) + A2.*sin(phi2))  ./  (A1.*cos(phi1) + A2.*cos(phi2)))
    
    