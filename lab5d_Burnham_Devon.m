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

%% Begin function
% Takes exactly zero or two matrices as arguments
% varargin, nargin, etc are defined by MATLAB documentation
% If given zero arguments, this solves Q1(j) as instructed.
% If given two matrices A and b, it solves the linear system Ax=b for x
function solveLinSys(varargin)

    %% Control logic to verify argument number and assign variables as needed
    if ~nargin
        % Defines default matrices if no input is given
        % These matrices are the same as in lab 5a, matrices A and C
        A = [4 3 1; 3 7 -1; 1 -1 9];
        b = [1 -1; 4 7; 9 5];
        
    elseif nargin==2
        % If two arguments are given
        A = varargin{1};
        b = varargin{2};
        
    else
        disp('Invalid number of arguments. Exiting...')
        return
        
    end    

    %% Main operations
    
    % rank() automatically calculates the rank of the matrix after Gaussian
    % elimination
    if rank(A) < size(A)
        disp("Zero rows exist, thus no unique solution exists. Quitting...")
        return
    else
        disp("No zero rows exist, thus a unique solution exists.")
        
        x1 = A\b;    % Built-in MATLAB operator to solve linear systems robustly
                     % Could also use linsolve or multiply by the inverse
        
        % Method 2: Gaussian elimination
        % Find the row-reduced echelon form of A | b by Gauss elimination
            % Note: I could also have written my own Gaussian row-reduction 
            % function, but I wouldn't be any more efficient than the 
            % MATLAB built-in function, visible with the command 'edit rref'
        R = rref([A b]);
        
        % Final columns of rref([A b])
        x2 = R(:, (rank(R)+1:end));
        
        disp('Solution from MATLAB built-in solver: {x} =')
        disp(x1)
        
        disp('Solution from Gaussian elimination: {x} =')
        disp(x2) 
    end
end
