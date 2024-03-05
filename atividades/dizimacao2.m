clc
clear all
close all
disp('Processando...')
n = 0:32;
% (a) Sinal Original
x = cos(0.125*pi*n);
subplot(2,2,1);
stem(x,'g','filled');
ylabel('Amplitude');
title('Sequência Original x[n]');
% (b) Dizimação M=2
M = 2; y = decimate(x,M);
subplot(2,2,2);
stem(y,'c','filled');
ylabel('Amplitude');
title('Dizimação M = 2');
% (c) Dizimação M=4
M = 4; y = decimate(x,M);
subplot(2,2,3);
stem(y,'r','filled');
ylabel('Amplitude');
title('Dizimação M = 4');
xlabel('n');
% M=8
M = 8; y = decimate(x,M);
subplot(2,2,4);
stem(y,'m','filled');
ylabel('Amplitude');
title('Dizimado por M = 8');
xlabel('n');
disp('Fim');
