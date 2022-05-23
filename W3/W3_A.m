%% Descriptive Analysis
% Import data
data = readtable("W3/W3_Running_Shoes_v1.xlsx");
data_matrix = table2array(data(1:50, [2 4 6]))

% Histrograms
histogram(data_matrix(:, 1));
histfit(data_matrix(:, 1));
title("New Shoe")

figure

histogram(data_matrix(:, 2));
histfit(data_matrix(:, 2));
title("Benchmark 01")

figure

histogram(data_matrix(:, 3));
histfit(data_matrix(:, 3));
title("Benchmark 02")

% Boxplots
boxplot(data_matrix, "labels", ["New Shoe" "Benchmark 01" "Benchmark 02"])
hold on
plot(mean(data_matrix), "dg")

%% Inferential Analysis
% One-way ANOVA
[P,ANOVATAB,STATS] = anova1(data_matrix)

% Tukey post-hoc analysis
[COMPARISON,MEANS,H,GNAMES] = multcompare(STATS)