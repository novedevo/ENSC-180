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
[eigVecs,eigVals] = eig(A);  % Eigenvalues of A
rootNum = 0;     % Counter for approximation function

% linspace divisions: 1e6 works quickly, anything above 1e7 slows down
% For reference, on my computer 1e7 takes 1.6s, whereas 1e8 takes 14.4s.
% 1e7 is already accurate within 7 figures.
precision = 1e7; 

% Eigenvectors as determined from outside of MATLAB; see other documents
eigVecsByHand = [[-4.3670; 2.7537;  1]...
                 [1.1647;  1.484;   1]...
                 [-0.1311; -0.5710; 1]];

%% Approximating script
% As we were informed in class on Friday, we can use MATLAB to approximate
% the roots as long as we don't use roots() or equivalent functions.
% This uses a naive method of approximation, it would be more efficient to
% use Newton's method or similar.

for ii = linspace(1,10, precision)
     % 1 and 10 were chosen arbitrarily at
     % first, but work well for this cubic.
                           
                                  
    % Uncomment this block to enable significantly faster approximation
    % However, this only works when you already know roughly what the roots
    % are going to be. As such, it is left disabled by default.
    %if ii<1.8 || (ii>=1.9 && ii<=8.6) || (ii>=8.7 && ii<=9.4)
    %    continue
    %end
    
    % Skips some of the calculation if the function is not close to zero.
    if abs(cub(ii))>= 1e3/precision
        continue
    end
    
    if rootNum >= 3
        disp('Max roots for a cubic found!');
        disp(' ');
        break    % Cubics only have 3 roots
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
        rootNum = rootNum + 1; % increment
        fprintf('Root %d found! The approximate value is %f\n',...
            rootNum, ii+5/precision);
        fprintf('This compares to the MATLAB-found eigenvalue of %f\n\n',...
            eigVals(rootNum,rootNum));
    end
end

%% Scaling eigenvectors
% Preallocating space for greater speed
eigVecsScaled = zeros(3);
for ii = 1:3
    eigVecsScaled(:,ii) = eigVecs(:,ii) / eigVecs(3,ii);
    % This normalizes the eigenvectors found by MATLAB to match the
    % formatting of the vectors found by hand, without changing their value.
    % An eigenvector multiplied by a scalar is the same eigenvector.
end

%% Comparing eigenvectors
disp('Eigenvectors as found by row reduction, one eigenvector per column')
disp(eigVecsByHand);
disp('Eigenvectors as found by MATLAB, after scalar multiplication')
disp(eigVecsScaled);

%% Function corresponding to the determinant of [A]-?[I] as found by hand
function [y] = cub(alpha)
    y = (-alpha.^3 + 20*alpha.^2 - 116*alpha + 154);
end
