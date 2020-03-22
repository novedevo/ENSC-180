%############################################################################
% <Lab 8A>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Apply the bisection method to a function
% Due date: 2020/04/20

% Author: Devon Burnham
% Input: None
% Output: Results and errors from n iterations of the bisection method
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################
%% Defining variables and constants
iterations = 3;

a = 1; % initial lower bound
b = 3; % initial upper bound

c = 1:iterations+1; % vector to contain results
c(1) = (a + b) / 2; % initial value is the centre

%% Calculating roots of the polynomial
allRoots = roots([1 0 0 -4]);
realRoot = allRoots(~imag(allRoots));
% Only allows roots with no imaginary component

%% Performing bisection method
for ii = 1:iterations
    if (sign(g(a)) == sign(g(c(ii)))) % if both are on same side of x-axis
        a = c(ii);
    else
        b = c(ii);
    end
    
    c(ii+1) = (a+b) / 2;
end

%% Defining error vectors
errors = realRoot-c;
percentageErrors = errors./realRoot.*100;

%% Displaying results
for ii = 1:iterations+1
    fprintf("Iteration %d of bisection resulted in a value of %f\n", ii-1, c(ii))
    fprintf("Absolute error was %.3f, and percent error was %.3f%%\n\n", errors(ii), percentageErrors(ii))
end

%% Function definition
function y = g(x)
    y = x.^3-4;
end
