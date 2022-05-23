%% Descriptive Analysis
% Import data
data = readtable("W3/W3_Running_Shoes_v2.xlsx");
data_matrix = table2array(data(1:100, 3:5));

% Histrograms
histogram(data_matrix(:, 1));
histfit(data_matrix(:, 1));
title("New Shoe");

figure

histogram(data_matrix(:, 2));
histfit(data_matrix(:, 2));
title("Benchmark 01");

figure

histogram(data_matrix(:, 3));
histfit(data_matrix(:, 3));
title("Benchmark 02");

figure

% Boxplots
boxplot(data_matrix, "labels", ["New Shoe" "Benchmark 01" "Benchmark 02"])
hold on
plot(mean(data_matrix), "dg")

%% Inferential Analysis
% Statistical significance

% Create table with variable names
t = table(data_matrix(:,1), data_matrix(:,2), data_matrix(:,3),'VariableNames', {'design','benchmark1', 'benchmark2'})

% Create the RM (Repeated Measures) model
rm = fitrm(t, "design,benchmark1, benchmark2~1")

% Run the repeated-measures ANOVA
[TBL] = ranova(rm)

% Post-hoc test (repeated t tests)
[H,P,CI,STATS] = ttest(data_matrix(:,1), data_matrix(:,2))
[H,P,CI,STATS] = ttest(data_matrix(:,1), data_matrix(:,3))
[H,P,CI,STATS] = ttest(data_matrix(:,2), data_matrix(:,3)) 
