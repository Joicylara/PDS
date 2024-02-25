%Por exemplo, seja um sinal 𝑥𝑐 𝑡 = 0,5𝑠𝑒𝑛 200𝜋𝑡 + 0,1𝑠𝑒𝑛(500𝜋𝑡) qual é o valor de Ω𝑠 mínimo?


clc;
clear all;
close all;
disp('Processando...');

%Sinal
fs = 1000;
t = -2*pi:1/fs:2*pi;
x = 0.5*sin(2*pi*100*t)+0.1*sin(2*pi*250*t);

%FFT
N =length(x);
T =N/fs; %periodo
freq = linspace(0,N,N)/T;
fc = ceil(N/2);
X = fft(x)/N;
X = X(1:fc);
figure;
plot(t,x);
title('Sinal de entrada');
axis([-0.5 0.5 -1 1])

figure
plot(freq(1:fc),abs(X));
ylabel('|X|');
title('Analise do sinal');
xlabel('freq(Hz)');
grid on;

disp('Fim');


