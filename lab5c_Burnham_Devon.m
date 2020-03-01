%############################################################################
% <Lab 5C>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Approximates the roots of a specific cubic function
% Due date: 2020/02/29
%
% Author: Devon Sawatsky Burnham
% Input: Given cubic, so <none>
% Output: Approximate roots
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: Devon Sawatsky Burnham
%############################################################################

%% Defining variables
A = [4 3 1; 3 7 -1; 1 -1 9]; % Same as in lab 5A
eigs = eig(A);  % Eigenvalues of A
rootNum = 0;    % Counter for approximation
precision = 1e6;% % linspace divisions

%% Approximating script
% As we were informed in class on Friday, we can use MATLAB to approximate
% the roots as long as we don't use roots() or equivalent functions

for ii = linspace(1,10, precision)
                                  % 1 and 10 were chosen arbitrarily at
                                  % first, but work well for this cubic.
    if rootNum >= 3
        return    % Cubics only have 3 roots
    end
    
    rootFound = false;  % Reset trigger variable
    
    % If two consecutive values are on the opposite side of the x-axis, 
    % the root must be between / equal to them.
    if cub(ii)<=0 && cub(ii+10/precision)>=0
        rootFound = true;
    elseif cub(ii)>=0 && cub(ii+10/precision)<=0
        rootFound = true;
    end
    
    if rootFound
        rootNum = rootNum + 1;
        disp('Root found! The approximate value is: ')
        disp(ii+5/precision);     % halfway between the two values
        disp('This compares to the MATLAB-found eigenvalue of:');
        disp(eigs(rootNum));
    end
end

%% Function corresponding to the determinant of [A]-?[I]
function [y] = cub(alpha)
    y = (-alpha.^3 + 20*alpha.^2 - 116*alpha + 154);
end
