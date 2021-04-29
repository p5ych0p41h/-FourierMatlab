clc;
close all force;
clear variables;

a = 0.01;
b = 0.15;
t = [20:-0.1:-20.4];

IM = a*exp(b*(-t(1:length(t)))).*sin((-t(1:length(t))));
RE = a*exp(b*(-t(1:length(t)))).*cos((-t(1:length(t))));
maxX = max(RE)+0.2;
maxY = max(t)+0.5;
maxZ = max(IM)+0.2;
minX = min(RE)-0.2;
minY = min(t)-0.5;
minZ = min(IM)-0.2;

set(0, 'DefaultAxesFontName', 'Times New Roman');
figure('Position', [1 1 1920 1080]);

v = VideoWriter('FM11_6_v1.avi');
open(v);

w = [0: 0.1: 50];

for i = 1:1:length(w)
    t = [20:-0.001:-20.4];
    IM = a*exp(b*(-t(1:length(t)))).*sin(w(i)*(-t(1:length(t))));
    RE = a*exp(b*(-t(1:length(t)))).*cos(w(i)*(-t(1:length(t))));
    im = IM;
    re = RE;
    xyz=[re;t;im];
    fnplt(cscvn(xyz(:,[1:end ])),'r',2);
    view(270, 0);
    line([minX, maxX],[maxY, maxY],[0,0]);
    line([0, 0],[minY, maxY],[0,0]);
    line([0, 0],[maxY, maxY],[minZ, maxZ]);
    text(maxX, maxY, 0,'\it Re\{z(t)\}', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, maxY, maxZ,'\it Im\{z(t)\}', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, minY, 0,'\it t', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    axis off;
    axis([minX maxX minY maxY minZ maxZ]);
    title(['\it z(t) = ae^b^te^-^i^\omega^t' char(10) '\omega = ' num2str(w(i))], 'FontSize', 40, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    M(i) = getframe(gcf);
end

for az = 270:-1:-135
    view(az, 0);
    pause(0.01);
    M(length(w)+abs(az-270)) = getframe(gcf);
end

pause(2);

for j = 1:1:length(w)
    t = [20:-0.001:-20.4];
    IM = a*exp(b*(-t(1:length(t)))).*sin(w(j)*(-t(1:length(t))));
    RE = a*exp(b*(-t(1:length(t)))).*cos(w(j)*(-t(1:length(t))));
    im = IM;
    re = RE;
    xyz=[re;t;im];
    fnplt(cscvn(xyz(:,[1:end ])),'r',2);
    view(az, -30);
    line([minX, maxX],[maxY, maxY],[0,0]);
    line([0, 0],[minY, maxY],[0,0]);
    line([0, 0],[maxY, maxY],[minZ, maxZ]);
    text(maxX, maxY, 0,'\it Re\{z(t)\}', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, maxY, maxZ,'\it Im\{z(t)\}', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    text(0, minY, 0,'\it t', 'FontSize', 30, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    axis off;
    axis([minX maxX minY maxY minZ maxZ]);
    title(['\it z(t) = ae^b^te^-^i^\omega^t' char(10) '\omega = ' num2str(w(j))], 'FontSize', 40, 'Fontname','Times New Roman', 'fontWeight', 'Bold');
    M(j+length(w)+405) = getframe(gcf);
end

movie(M, 1, 60);
writeVideo(v, M);
close(v);