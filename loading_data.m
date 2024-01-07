clear; clc;

file_path = '/MATLAB Drive/TSLA.csv';
data = readtable(file_path);
fprintf('Number of data points: %d\n', numel(data));
fprintf('Sample data:\n');
disp(data(1:10, :));

fprintf('Example stock prices:\n');
disp(data.Prices(1:10));

max(data.Prices);
