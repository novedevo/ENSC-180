%############################################################################
% <Lab 8B>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Apply the Newton-Raphson method to an ill-suited function
% Due date: 2020/04/20

% Author: Devon Burnham
% Input: None
% Output: Plot containing the results of 3 iterations of the Newton-Raphson
% method
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################

%% Defining variables and constants
initialGuess = 3.2;
iterations = 3;
% Any iterations over 3 are irrelevant as it spikes to infinity, then NaN

% Preallocating array
attempts = 0:iterations;
attempts(1) = initialGuess;

%% Performing Newton's Method
for ii=1:iterations
    f0 = f(attempts(ii));
    f0Prime = fPrime(attempts(ii));
    attempts(ii+1) = attempts(ii) - f0 / f0Prime;
end

%% Plotting 3 graphs
figure;
hold on
scatter(0:iterations,attempts)  % to show points
yline(3);                       % to show correct root
plot(0:iterations,attempts)     % line connecting points for ease of viewing
hold off

%% Formatting graph
title('Results of Newton-Raphson Method with specified number of iterations')
xlabel('Iteration')
ylabel('Value')
legend('Calculated Value','True Root', 'Location', 'southwest')
% Legend is in the southwest because the northeast default blocks the yline

% Messy way of labelling the points in MATLAB
% As per instructions
for ii = 0:iterations
    text( ii, attempts(ii+1)-10, cellstr(num2str(attempts(ii+1))))
    text( ii, attempts(ii+1)+10, cellstr(strcat('Iteration\_', (num2str(ii)))))
end

%% Function definitions
function y = f(x)
    y=tanh(x.^2-9);
end

% Manually calculated derivative of f(x)
function yPrime = fPrime(x)
    yPrime = (sech(x.^2-9)).^2 .* 2*x;
end
