%############################################################################
% <Lab 9>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Apply the Newton-Cotes method and MATLAB's integral
% calculator to a set of functions.
% Due date: 2020/03/27

% Author: Devon Burnham
% Input: None
% Output: Evaluated integration of the functions
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################


%% Defining variables and constants

% Defining cell array of function handles from .m files as described in instructions
funs = {@f1, @f2, @f3};

% Preallocating space for results
results = zeros(3,4);


%% Calculating results
for ii = 1:3
    % a,b,c,d are temporary variables. Directly calling int_calc to
    % results(ii, :) does not work as desired.
    [a,b,c,d] = int_calc(funs{ii});
    results(ii, :) = [a,b,c,d];
end


%% Displaying results
for ii = 1:3
    
    % Showing results
    fprintf('For function %d, the calculated result for the built-in integral ', ii);
    fprintf('calculator was %.8f, taking %f seconds.\n', results(ii,1), results(ii, 3));
    fprintf('The calculated result for the Newton-Cotes method was ');
    fprintf('%.8f, taking %f seconds.\n', results(ii, 2), results(ii, 4));
    
    % Clarifying which method was faster
    if results(ii, 3) > results(ii, 4)
        fprintf('The Newton-Cotes method produced a faster output by a factor of ');
        fprintf('%.3f.\n', results(ii, 3)/results(ii,4));
    elseif results(ii, 3) < results(ii, 4)
        fprintf('The built-in integral calculator produced a faster output by a factor of ');
        fprintf('%.3f.\n', results(ii, 4)/results(ii,3));
    else
        fprintf('The two methods took exactly the same amount of time.\n');
    end
    
    % Newline to separate functions from each other
    fprintf('\n')
end


% Note: On my machine, the 8-node Newton-Cotes method was faster every
% time, often by a significant margin. They also all produced the same
% results as the exact answer given in the instructions.


%% Integral calculator function
function [q1, q2, t1, t2] = int_calc(f)    
    % Using MATLAB built-in integral calculator
    tic
    q1 = integral(f,0,1);
    t1 = toc;

    % Using user-built Newton-Cotes integral calculator with 8 nodes
    tic
    q2 = cotes(f,0,1, 20, 8);
    t2 = toc;
end
