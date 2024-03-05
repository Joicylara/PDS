 clc
clear all
close all
disp('Processando...')
n = 0:2048; k1 = 256; k2 = k1+32; m = 0:(k2-k1);
Hf1 = figure('units','inches','position',[1,1,6,4],...
'paperunits','inches','paperposition',[0,0,6,4]);
% (a) Sinal Original
x = cos(0.125*pi*n); subplot(2,2,1);
Ha = stem(m,x(m+k1+1),'g','filled'); axis([-1,33,-1.1,1.1]);
set(Ha,'markersize',2); ylabel('Amplitude');
title('Sequência Original x[n]');
set(gca,'xtick',[0,16,32]); set(gca,'ytick',[-1,0,1]);
% (b) Taxa de Conversão 3/2: L= 3, M = 2
L = 3; M = 2; y = resample(x,L,M); subplot(2,2,2);
Hb = stem(m,y(m+k1*L/M+1),'c','filled'); axis([-1,33,-1.1,1.1]);
set(Hb,'markersize',2); ylabel('Amplitude');
title('Amostragem L/M: L = 3,M= 2');
set(gca,'xtick',[0,16,32]); set(gca,'ytick',[-1,0,1]);
% (c) Conversão 3/4: L= 3, M = 4
L = 3; M = 4; y = resample(x,L,M); subplot(2,2,3);
Hc = stem(m,y(m+k1*L/M+1),'r','filled'); axis([-1,33,-1.1,1.1]);
set(Hc,'markersize',2); ylabel('Amplitude');
title('Amostragem L/M: L = 3,M= 4');
set(gca,'xtick',[0,16,32]); set(gca,'ytick',[-1,0,1]);
%xlabel('n', 'fontsize',LF);
% (M) Conversão 5/8: L= 5, M = 8
L = 8; M = 8; y = resample(x,L,M); subplot(2,2,4);
Hd = stem(m,y(m+k1*L/M+1),'m','filled'); axis([-1,33,-1.1,1.1]);
set(Hd,'markersize',2); ylabel('Amplitude');
title('Amostragem L/M: L = 5,M= 8');
set(gca,'xtick',[0,16,32]); set(gca,'ytick',[-1,0,1]);
%xlabel('n', 'fontsize',LF);
disp('Finalizado.')
