%% Temperature Analyzer
% Temperature data analysis tool

clc;
clear;
close all;

%% 1. Read Excel data
data = readtable('my_temperature.xlsx');

time = data.Time;
temperature = data.Temperature;

%% 2. Calculate statistics
[maxTemp, maxIndex] = max(temperature);
[minTemp, minIndex] = min(temperature);
avgTemp = mean(temperature);

%% 3. Display results
fprintf('\n');
fprintf('=============================\n');
fprintf('      Temperature Analysis\n');
fprintf('=============================\n');
fprintf('Maximum temperature: %.2f °C\n', maxTemp);
fprintf('Minimum temperature: %.2f °C\n', minTemp);
fprintf('Average temperature: %.2f °C\n', avgTemp);
fprintf('Maximum time: %.2f s\n', time(maxIndex));
fprintf('Minimum time: %.2f s\n', time(minIndex));
fprintf('=============================\n');

%% 4. Plot temperature data
figure;

plot(time, temperature, 'r', ...
    'LineWidth', 2);

hold on;

%% 5. Mark maximum and minimum
plot(time(maxIndex), maxTemp, ...
    'ro', 'MarkerSize', 8, 'LineWidth', 2);

plot(time(minIndex), minTemp, ...
    'bo', 'MarkerSize', 8, 'LineWidth', 2);

%% 6. Add labels
text(time(maxIndex), maxTemp, ...
    '  Maximum');

text(time(minIndex), minTemp, ...
    '  Minimum');

xlabel('Time (seconds)');
ylabel('Temperature (°C)');
title('My Temperature Data');
grid on;

legend('Temperature', ...
    'Maximum', ...
    'Minimum', ...
    'Location', 'best');

hold off;