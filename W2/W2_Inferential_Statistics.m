%%%%
%% Dataset one
%%%%

% data import
data = readtable("W2_Running_Shoes_v1.xlsx");
m = table2array(data(1:50,[2 4]));

% Descriptive Analysis
histogram(m(:, 1))
histfit(m(:, 1))

figure

histogram(m(:, 2))
histfit(m(:, 2))

% Independent samples t test
[~,~,CI,~] = ttest2(m(:,1),m(:,2));

%%%%
%% Dataset two
%%%%

m2 = table2array(data(1:50,[8 10]));

% Descriptive Analysis
histogram(m2(:, 1))
histfit(m2(:, 1))

figure

histogram(m2(:, 2))
histfit(m2(:, 2))

% Mann-Whitney U test
[P,H,STATS] = ranksum(m2(:,1),m2(:,2))





