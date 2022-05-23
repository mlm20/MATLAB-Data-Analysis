% Matlab intro tutorial
% Prepared by Michel-Alexandre Cardin
% Latest update: 3 May 2022

% Go to the folder where the file you want to import is located
% Delete all previous data, figures, and file
clear all; close all;

% Open data file
table = readtable('W1_Running_Shoes.xlsx','Range','E8:H58');

% Convert table to data array and keep only data columns
data = table2array(table);
data = data(:,[2,4])

% Show some data
data(1,1) % row 1, column 1 (topleft)
data(end,end) % last row, last column (bottom right)
data(:,1) % show column 1 only
data(1,:) % show row 1 only
data(:,:) % or just 'data', show matrix

% Calculate useful statistics
mean = mean(data)
median = median(data)
std = std(data)

% Draw histograms and plot estimated distribution curve
figure;
hist_design = histfit(data(:,1));
title('Design');
figure;
hist_bench = histfit(data(:,2));
title('Benchmark')

% Draw boxplot
figure
boxplot(data,'notch','on','labels',{'Design','Benchmark'})
title('Boxplots')