clc;
clear all;
close all;
disp('Processando...');
fs=10000; % frequência de Amostragem
f1=500; % frequência dentro da banda de passagem – sinal de entrada
t=0:1:1000;
x = 0.5*sin((2*pi*f1*t/fs));
figure
plot(x); % Plota sinal de entrada com ruído
title('Sinal de Entrada com Ruído');
figure
n= max(size(t)); % Composição do eixo da frequência.
F = fs*(-n/2:(n/2)-1)/n; % Composição do eixo da frequência.
J=abs(fftshift(fft(x))); %FFT
stem(F,J,".");
xlabel('Frequência Hz');
title('Espectro de Frequência');
disp('Fim');
