clc;
close all force;
clear variables;

a = 0.01;
b = 0.15;
t = [-20.4:0.05:20];

IM = a*exp(b*(-t(1:length(t)))).*sin((-t(1:length(t))));
RE = a*exp(b*(-t(1:length(t)))).*cos((-t(1:length(t))));
maxX = max(RE);
maxY = max(t);
maxZ = max(IM);
minX = min(RE);
minY = min(t);
minZ = min(IM);

set(0, 'DefaultAxesFontName', 'Times New Roman');
figure('Position', [1 1 1920 1080]);

xyz=[RE;t;IM];
xy=[RE;t;IM.*0];
yz=[RE.*0;t;IM];
xz=[RE;(t.*0+1).*maxY;IM];
fnplt(cscvn(xyz(:,[1:end ])), 'r', 4);
hold on
fnplt(cscvn(xy(:,[1:end ])), 'b', 4);
hold on
fnplt(cscvn(yz(:,[1:end ])), 'g', 4);
hold on
fnplt(cscvn(xz(:,[1:end ])), 'black', 4);
line([minX, maxX], [maxY, maxY], [0,0], 'LineWidth', 1.5);
line([0, 0], [minY, maxY], [0,0], 'LineWidth', 1.5);
line([0, 0], [maxY, maxY], [minZ, maxZ], 'LineWidth', 1.5);
text(maxX, maxY, 0,'\it Re\{z(t)\}', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
text(0, maxY, maxZ,'\it Im\{z(t)\}', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
text(0, minY, 0, '\it t', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
axis off;
axis([minX maxX minY maxY minZ maxZ]);
title(['\it z(t) = ae^b^te^-^i^\omega^t'], 'FontSize', 70, 'Fontname','Times New Roman', 'fontWeight', 'Bold');