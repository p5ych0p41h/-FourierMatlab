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

v = VideoWriter('FM11_7_v1.avi');
open(v);

h = plot(t(1), RE(1), 'ro', 'MarkerSize', 10);

for i = 1:1:length(t)
    tt = t(1:i);
    re(i) = a*exp(b*t(i)).*cos(t(i));
    plot(tt, re, 'r', 'LineWidth', 5);
    if (int16(t(i)) >= -10) && (int16(t(i)) <= 10)
        ttt = t(199:i);
        ret = a*exp(b*ttt).*cos(ttt);
        area(ttt, ret, 'FaceColor', 'g');
    end
    hold on
    delete(h);
    h = plot(tt(i), re(i), 'ro', 'MarkerSize', 10);
    line([minX, maxX],[0, 0], 'LineWidth', 2);
    line([0, 0],[minY, maxY], 'LineWidth', 2);
    text(maxX, 0,'\it t', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, maxY-0.005,'\it Re\{z(t)\}', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(-10-0.5, 0-0.01,'\it -10', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(-10, 0+0.01,'\it a', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(10-0.5, 0-0.01,'\it 10', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(10, 0+0.01,'\it b', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    axis off;
    axis([minX maxX minY maxY]);
    title(['\it Re\{ae^b^te^-^i^\omega^t\}' char(10) 't = ' num2str(int16(t(i)))], 'FontSize', 70, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    M(i) = getframe(gcf);
end

movie(M, 1, 60);
writeVideo(v, M);
close(v);