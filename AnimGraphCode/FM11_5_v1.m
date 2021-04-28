clc;
close all force;
clear variables;

a = 0.01;
b = 0.15;
t = [20:-0.05:-20];

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

v = VideoWriter('FM11_5_v1.avi');
open(v);

h = plot(RE(1), IM(1), 'ro', 'MarkerSize', 10);

for i = 1:1:length(t)
    tt = t(1:i);
    im(i) = a*exp(-b*t(i)).*sin(-t(i));
    re(i) = a*exp(-b*t(i)).*cos(-t(i));
    xyz=[re;tt;im];
    xy=[re;tt;im.*0];
    yz=[re.*0;tt;im];
    xz=[re;(tt.*0+1).*maxY;im];
    fnplt(cscvn(xyz(:,[1:end ])), 'r', 4);
    hold on
    fnplt(cscvn(xy(:,[1:end ])), 'b', 4);
    hold on
    fnplt(cscvn(yz(:,[1:end ])), 'g', 4);
    hold on
    fnplt(cscvn(xz(:,[1:end ])), 'black', 4);
    hold on
    delete(h);
    h = plot3(re(i), tt(i), im(i), 'ro', 'MarkerSize', 10);
    line([minX, maxX], [maxY, maxY], [0,0], 'LineWidth', 1.5);
    line([0, 0], [minY, maxY], [0,0], 'LineWidth', 1.5);
    line([0, 0], [maxY, maxY], [minZ, maxZ], 'LineWidth', 1.5);
    text(maxX, maxY, 0,'\it Re\{z(t)\}', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, maxY, maxZ,'\it Im\{z(t)\}', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, minY, 0, '\it t', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    axis off;
    axis([minX maxX minY maxY minZ maxZ]);
    title(['\it z(t) = ae^b^te^-^i^\omega^t' char(10) 't = ' num2str(int16(t(i)))], 'FontSize', 70, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    M(i) = getframe(gcf);
end

movie(M, 1, 60);
writeVideo(v, M);
close(v);