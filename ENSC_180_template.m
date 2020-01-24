%**********************************************************************
% Lab 1: <The Major Problem>
%
% Description:
% <This program solves the Major problem.
% A longer description should appear here (if necessary).>
%
% Author: <Student M. Me, me@twu.ca>
% Date: <January 29, 2015>
%
% Input: <none>
% Output: <only a log of what takes place>
%
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: <Student Name>
%*********************************************************************/

% See https://www.mathworks.com/matlabcentral/answers/380202-why-does-matlab-crash-when-plotting-with-intel-drivers?s_cid=pl_crsh_an
% matlab -softwareopenglmesa

%% Import data from text file.
clc
clear

% Create the signal
time = 0:.001:.25;
x = sin(2*pi*50*time);
y = x + 2*randn(size(time));

% Plot the signal
plot(x)
title('Noisy time domain signal')
xlabel('Frequency (Hz)')
ylabel('Magnitute')