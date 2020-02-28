%############################################################################
% <Lab 5D>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Solves the linear equation system Ax=b with Gauss-Jordan
% elimination
% 
% Due date: 2020/02/29
%
% Author: Devon Sawatsky Burnham
% Input: Two matrices (defaults to the same matrices as lab 5a)
% Output: Solved linear system
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: Devon Sawatsky Burnham
%############################################################################

% Begin function
% Takes exactly zero or two matrices as arguments
function solveLinSystem(varargin)

    %% Control logic to verify argument number and assign variables as needed
    if ~nargin
        % defining default matrices if no input is given
        A = [4 3 1; 3 7 -1; 1 -1 9];
        b = [1 -1; 4 7; 9 5];
    elseif nargin==2
        % If two arguments are given
        A=varargin{1};
        b=varargin{2};
    else
        disp('Invalid number of arguments. Exiting...')
        return
    end
    
    % Find the row-reduced echelon form of A (superfluous)
    R = rref(A);

    %% Main operations
    if rank(A) < size(A)
        disp("Zero rows exist, thus no unique solution exists. Quitting...")
    else
        disp("No zero rows exist, thus a unique solution exists")
        x = A\b;    % Built-in MATLAB operator to solve linear systems robustly
        disp('Unique solution: {x} =')
        disp(x);
    end
end
