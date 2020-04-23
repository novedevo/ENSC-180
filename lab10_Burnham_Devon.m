%############################################################################
% <Lab 10>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Test various ways to blur and sharpen images
% Due date: 2020/04/03
%
% Author: Devon Burnham
% Input: 256x256x3 image
% Output: 16 figures showing the output of the various filters.
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%############################################################################



%% ------------- Task 1 -------------

% Load image
X = imread('4.1.04.tiff');

% Convert to double
X = double(X);

% Extend image by a pixel on each side
Y = wextend('2D', 'sym', X, [1,1]);

% Get dimensions
[r,c,p] = size(Y);

% Preallocate array
X1 = zeros(r,c,p);

% Iterate through all colour channels of each pixel in the original image
for k = 1:p
    for i = 2:r-1
        for j = 2:c-1
            % Array containing r,g,b channels of a 3x3 grid around selected
            % pixel
            neighbours = Y(i-1:i+1, j-1:j+1, k);
            
            % Averages across all neighbouring pixels
            X1(i, j, k) = mean2(neighbours);
        end
    end
end

% Trim pixels from the edges
X1 = X1(2:r-1, 2:c-1, :);

% Display results
figure
imshow(uint8(X))
figure
imshow(uint8(X1))


%% ------------- Task 2 -------------

% Extend image by two pixels on each side
Y = wextend('2D', 'sym', X, [2,2]);

% Get dimensions
[r,c,p] = size(Y);

% Preallocate array
X2 = zeros(r,c,p);

% Iterate through all colour channels of each pixel in the original image
for k = 1:p
    for i = 3:r-2
        for j = 3:c-2
            % Array containing r,g,b channels of a 3x3 grid around selected
            % pixel
            neighbours = Y(i-2:i+2, j-2:j+2, k);
            
            % Averages across all neighbouring pixels
            X2(i, j, k) = mean2(neighbours);
        end
    end
end

% Trim pixels from the edges
X2 = X2(3:r-2, 3:c-2, :);

% Display Results
figure
imshow(uint8(X2))


%% ------------- Task 3 -------------

% Create 3x3 averaging kernel
H = fspecial('average',[3 3]);
% Filter the image through with this kernel
X3_1 = imfilter(X, H, 'symmetric', 'same');

% Display results
figure
imshow(uint8(X3_1))


% Create 5x5 averaging kernel
H_2 = fspecial('average',[5 5]);
% Filter the image through with this kernel
X3_2 = imfilter(X, H_2, 'symmetric', 'same');

% Display results
figure
imshow(uint8(X3_2))


% Create 5x5 gaussian blur kernel
H_3 = fspecial('gaussian', [5 5], 2);
% Filter the image through with this kernel
X3_3 = imfilter(X, H_3, 'symmetric', 'same');

% Display results
figure
imshow(uint8(X3_3))


%% ------------- Task 4 -------------

% Parameters
C_MIN = 0.51;
C_MAX = 0.7;
NUM_OF_C_TESTS = 10;

% Filter blurred image X2 through the gaussian kernel created above
Xg = imfilter(X2, H_3, 'symmetric', 'same');

% Test different values of c between given values
for c = linspace(C_MIN, C_MAX, NUM_OF_C_TESTS)
    
    % Unsharp filtering algorithm
    X4 = (c./(2.*c-1)).*X2 - ((1-c)./(2.*c-1)).*Xg;
    
    % Display results
    figure
    imshow(uint8(X4))
end

% Values of c around 0.55 seem to produce the best results, sharp without
% being unnatural.

