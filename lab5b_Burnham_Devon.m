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
% Function is known as the name of the file, not this title.
function addAndMultiplyTwoMatrices(A,B)
    
    % Check if matrices can be added
    if (size(A) == size(B))
        disp('A + B is:')
        disp(A + B)
    else
        disp('Matrices could not be added due to incompatible sizes.')
    end
    
    % Line break
    disp(' ')
    
    %% Tries to multiply the matrices
    try
        disp('A multiplied by B is:')
        disp(A*B)
        
    catch % This block is run when an error occurs in the try block.
          % In this case, that is usually when the matrices are not the
          % right size.
        disp('Not a valid operation!')
        disp('Are your matrices of the right size?')
    end
