%############################################################################
% <Lab 5A>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Performs various matrix operations and prints the output
% Due date: 2020/02/29
%
% Author: Devon Sawatsky Burnham
% Input: Three matrices (pre-set)
% Output: Result of various matrix operations
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: Devon Sawatsky Burnham
%############################################################################

%% Declaring and assigning given matrices to variables

A = [4 3 1; 3 7 -1; 1 -1 9];
B = [10 8 7; 3 -3 0; 14 1 7];
C = [1 -1; 4 7; 9 5];

%% Performing matrix operations and printing results

% Question a)
disp('A + B is:')
disp(A + B)

% Question b)
disp ('A - 2B is:')
disp(A - 2*B)

% Question c)
disp('AC is:')
disp(A * C)

% Question d)
disp('The transpose of A is:')
disp(A')

% Question e)
disp('A multiplied by its transpose is:')
disp(A * A')

% Question f)
disp('C multiplied by its transpose is:')
disp(C * C')

% Question g)
disp("A's inverse times B's inverse is:")
disp(inv(A) * inv(B));

% Question h)
disp('The rank of A is:')
disp(rank(A))
disp('The rank of C is:')
disp(rank(C))

% Question i)
disp('The determinant of A is:')
disp(det(A))

% Question j)
disp('The solution of the equation system Ax = C is')
disp(A \ C)
