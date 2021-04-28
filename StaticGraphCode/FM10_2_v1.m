clc;
close all force;
clear variables;

a = 0.01;
b = 0.15;
t = [-20.4:0.05:20];

RE = a*exp(b*(t(1:length(t)))).*cos((t(1:length(t))));
minX = min(t);
maxX = max(t);
minY = min(RE);
maxY = max(RE);

set(0, 'DefaultAxesFontName', 'Times New Roman');
figure('Position', [1 1 1920 1080]);

plot(t, RE, 'r', 'LineWidth', 5);
line([minX, maxX],[0, 0], 'LineWidth', 2);
line([0, 0],[minY, maxY], 'LineWidth', 2);
text(maxX, 0,'\it t', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
text(0, maxY-0.005,'\it Re\{z(t)\}', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
axis off;
axis([minX maxX minY maxY]);
title(['\it Re\{ae^b^te^-^i^\omega^t\}'], 'FontSize', 70, 'Fontname','Times New Roman', 'fontWeight', 'Bold');