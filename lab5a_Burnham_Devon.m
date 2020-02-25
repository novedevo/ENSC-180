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

%% Performing matrix operations

results{01} = A + B;
results{02} = A - 2*B;
results{03} = A * C;
results{04} = A';
results{05} = A * A';
results{06} = C * C';
results{07} = inv(A) * inv(B);
results{08} = {'Rank of A:', 'Rank of C:'; rank(A), rank(C)};
results{09} = det(A);
results{10} = A \ C;

%% Printing results

for ii = 1:10
    fprintf('The result of operation %d is: \n', ii)
    disp(results{ii})
end