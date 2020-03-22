%############################################################################
% <Lab 7B>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Interpolating from data with three different methods
% Due date: 2020/04/13
%
% Author: Devon Burnham
% Input: None
% Output: Interpolated graphs and values at o(27)
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################

%% Declaring and defining variables and constants
temperature =  [0 8 16 24 32 40];
oxy = [14.621 11.843 9.870 8.418 7.305 6.413];

x = 0:40;

%% Creating interpolated vectors
y1 = interp1(temperature, oxy, x); % Defaults to linear
y2 = polyval(polyfit(temperature, oxy, 5), x); % polyfit() returns coefficients, 
                                               % polyval() evaluates from coefficients
y3 = spline(temperature, oxy, x); % pchip() or makima() would also work well here

%% Creating and formatting 3 separate graphs
figure;
plot(x,y1)
title('Piecewise Linear Interpolation')
xlabel('Temperature (degrees C)')
ylabel('Concentration of dissolved oxygen (mg/L)')

figure;
plot(x,y2)
title('Fifth-Order Polynomial')
xlabel('Temperature (degrees C)')
ylabel('Concentration of dissolved oxygen (mg/L)')

figure;
plot(x,y3)
title('Spline')
xlabel('Temperature (degrees C)')
ylabel('Concentration of dissolved oxygen (mg/L)')

%% Displaying values
disp('The values for o(27) are displayed below.')
fprintf('The piecewise linear interpolation produced a value of: %f.\n', y1(27))
fprintf('The fifth-order polynomial produced a value of:         %f.\n', y2(27))
fprintf('The spline produced a value of:                         %f.\n', y3(27))
