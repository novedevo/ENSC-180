%############################################################################
% <Lab 3>
%
% Course: ENSC 180 Introduction to Engineering Analysis
% Instructor: Dr. Herbert H. Tsang
% Description: Reads, writes, and plots various stock data.
% Due date: 2020/01/31
%
% Author: Devon Burnham
% Input: CSV file with stock data
% Output: 5 graphs of various columns, AAPL-new.csv containing the Average
% column along with the original data.
% I pledge that I have completed the programming assignment independently.
% I have not copied the code from a student or any source.
% I have not given my code to any student.
%
% Sign here: ___Devon Burnham_______
%##########################################################################

%% Setup
filePath = 'AAPL.csv';
stockData=readtable(filePath, 'PreserveVariableNames', 1);
% The table datatype simplifies later code.
% The additional argument ensures that spaces are not stripped from
% variable names.

%% Plotting various data types
    
    % Open
    figure; % seperates the different graphs
    plot(stockData.Date, stockData.Open);
    xlim([stockData{1,1}, stockData{height(stockData), 1}]);
    % Sets limits of the x axis to the first and last datapoints
    ylim([0, 350]);
    % Sets limits of the y axis to reasonable values considering the data
    title('Apple Stock Opening Price')
    xlabel('Time (Years)');
    ylabel('Stock Price (USD)');
    legend('Stock Price (USD)');
    
    % Repeated comments are stripped for brevity
    
    % High
    figure;
    plot(stockData.Date, stockData.High);
    xlim([stockData{1,1}, stockData{height(stockData), 1}]);
    ylim([0, 350]);
    title('Apple Stock High Price')
    xlabel('Time (Years)');
    ylabel('Stock Price (USD)');
    legend('Stock Price (USD)');
    
    % Low
    figure;
    plot(stockData.Date, stockData.Low);
    xlim([stockData{1,1}, stockData{height(stockData), 1}]);
    ylim([0, 350]);
    title('Apple Stock Low Price')
    xlabel('Time (Years)');
    ylabel('Stock Price (USD)');
    legend('Stock Price (USD)');

    % Close
    figure;
    plot(stockData.Date, stockData.Close);
    xlim([stockData{1,1}, stockData{height(stockData), 1}]);
    ylim([0, 350]);
    title('Apple Stock Closing Price')
    xlabel('Time (Years)');
    ylabel('Stock Price (USD)');
    legend('Stock Price (USD)');
    
    % OHLC
    figure;
    candle(table2timetable(stockData)); 
    % Table must be converted to timetable for x-axis autolabelling to work
    % properly
    xlim([stockData{1,1}, stockData{height(stockData), 1}]);
    ylim([0, 350]);
    title('Apple Stock Candlestick (OHLC) Plot')
    xlabel('Time (Years)');
    ylabel('Stock Price (USD)');
    legend('Stock Price (USD)');
    % Uses the Financial Toolbox
    % Generates OHLC Candle plot
    
%% Calculating daily average, converts to table for concatenation
Average = array2table(((stockData.Open+stockData.Close)/2),...
    'VariableNames', {'Average'});

writetable([stockData Average], 'AAPL-new.csv');
% Concatenates the original data with the new Average column
