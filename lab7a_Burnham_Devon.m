%############################################################################
% <Lab 7A>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Interpolating from data with 1-4th order polynomials
% Due date: 2020/04/13
%
% Author: Devon Burnham
% Input: None
% Output: Interpolated graphs, along with actual data
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################

%% Defining variables and constants
volume = 1:6;
pressureAt300K = [2494 1247 831 623 499 416];

interval = 0.2;
x = 1:interval:6;

%% Graphing points and regressions
figure;
scatter(volume, pressureAt300K); % Plotting real data points
hold on;

coeffMatrix = {1:4}; % Preallocating 4 cells in a cell array
for n=1:4
    coeffMatrix{n} = polyfit(volume, pressureAt300K, n); 
    % Coefficients of an n-order polynomial regression
   
    plot(x, polyval(coeffMatrix{n}, x))
end

hold off;

%% Formatting graph
title('Pressure vs Volume at 300K in a Piston-Cylinder Device');
xlabel('Volume (m^3)')
ylabel('Pressure (kPa)')
legend( ...
    'Raw Data', ...
    '1st order polynomial interpolation', ...
    '2nd order polynomial interpolation', ...
    '3rd order polynomial interpolation', ...
    '4th order polynomial interpolation'  ...
    )

%% Reporting results
disp('The fourth order polynomial appears to do the best job.');
disp('Compared to the others, it follows the curve of the data better.');
