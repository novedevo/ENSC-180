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
% Input: The same matrices as Lab 5A
% Output: Solved linear system
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: Devon Sawatsky Burnham
%############################################################################

A = [4 3 1;3 7 -1; 1 -1 9];
C = [1 -1; 4 7; 9 5];

solveLinSystem(A,C)

function solveLinSystem(A,b)
    
    % Find the row-reduced echelon form of A
    R = rref(A);

    if rank(A) < size(A)
        disp("Zero rows exist, thus no unique solution exists. Quitting...")
    else
        disp("No zero rows exist, thus a unique solution exists")
        x = A\b;
        disp('Unique solution: {x} =')
        disp(x);
    end
end


