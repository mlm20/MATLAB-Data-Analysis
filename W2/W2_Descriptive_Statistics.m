% read data
m = csvread("W2_Running_Shoes.csv");

% calculate mean, median and standard deviation
mean_design = mean(m(:, 1))
median_design = median(m(:, 1))
std_design = std(m(:, 1))

mean_benchmark = mean(m(:, 2))
median_benchmark = median(m(:, 2))
std_benchmark = std(m(:, 2))

% plot a histogram
histogram(m(:, 1))
histfit(m(:, 1))

figure

histogram(m(:, 2))
histfit(m(:, 2))

% plot a boxplot
boxplot(m, "labels", ["Design" "Benchmark"])
hold on
plot(mean(m), "dg")