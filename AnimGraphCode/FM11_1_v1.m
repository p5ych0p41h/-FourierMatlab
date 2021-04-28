clc;
close all force;
clear variables;

a = 0.01;
b = 0.15;
t = [-20.4:0.05:20];

e = a*exp(b*(t(1:length(t))));
minX = min(t);
maxX = max(t);
minY = -0.005;
maxY = max(e);

set(0, 'DefaultAxesFontName', 'Times New Roman');
figure('Position', [1 1 1920 1080]);

v = VideoWriter('FM11_1_v1.avi');
open(v);

h = plot(t(1), e(1), 'ro', 'MarkerSize', 10);

for i = 1:1:length(t)
    tt = t(1:i);
    ee(i) = a*exp(b*t(i));
    plot(tt, ee, 'r', 'LineWidth', 5);
    hold on
    delete(h);
    h = plot(tt(i), ee(i), 'ro', 'MarkerSize', 10);
    line([minX, maxX],[0, 0], 'LineWidth', 2);
    line([0, 0],[minY, maxY], 'LineWidth', 2);
    text(maxX, 0,'\it t', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, maxY-0.005,'\it f(t)', 'FontSize', 50, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    axis off;
    axis([minX maxX minY maxY]);
    title(['\it f(t) = ae^b^t' char(10) 't = ' num2str(int16(t(i)))], 'FontSize', 70, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    M(i) = getframe(gcf);
end

movie(M, 1, 60);
writeVideo(v, M);
close(v);