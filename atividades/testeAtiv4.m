clc;
clear all;
close all;
disp('Processando...');
%------------------------------------------
% Sinal
fs = 1000;
t = -2*pi:1/fs:2*pi;
x = 0.5*sin(2*pi*100*t) + 0.1*sin(2*pi*250*t);
%------------------------------------------
% FFT
N = length(x);
T = N/fs; % período

fc = ceil(N/2); % para ajustar os dados do vetor
freq = linspace(0, fs/2, fc);
X = fft(x)/N;
X = X(1:fc);
figure;
plot(t,x);
title('Sinal de Entrada');
axis([-0.5 0.5 -1 1])
%------------------------------------------
figure;
plot(freq(1:fc), abs(X));
ylabel('|X|');
title('Análise do Sinal');
xlabel('freq (Hz)');
grid on;
%------------------------------------------
disp('Fim');
