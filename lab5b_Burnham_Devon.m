%############################################################################
% <Lab 5B>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Adds and multiplies two matrices, then prints the output
% Due date: 2020/02/29
%
% Author: Devon Sawatsky Burnham
% Input: Two matrices
% Output: The result of matrix addition
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: Devon Sawatsky Burnham
%############################################################################

%% Begin Function


function addAndMultiplyTwoMatrices(A,B)
    if (size(A) == size(B))
        disp('A + B is:')
        disp(A + B)
    else
        disp('Matrices could not be added due to incompatible sizes.')
    end
    
    try
        disp('A multiplied by B is:')
        disp(A*B)
    catch
        disp('Not a valid operation!')
        disp('Are your matrices of the right size?')
    end