clc; clear all; close all;
disp('Processando...');
n = 0:32;
% Sinal Original
x = cos(0.125*pi*n);
subplot(2,2,1);
stem(x,'g','filled');
title('Original Sequence x(n)');
ylabel('Amplitude');
xlabel('n');
% Fator 3/2: M = 3 e L= 2
M = 3; L = 2;
y1 = resample(x,M,L);
subplot(2,2,2);
stem(y1,'g','filled');
title('Fator 3/2');
ylabel('Amplitude');
xlabel('n');
% Fator 3/4: M=3 L=4
M = 3; L = 4;
y2 = resample(x,M,L);
subplot(2,2,3);
stem(y2,'b','filled');
title('Fator 3/4');
ylabel('Amplitude');
xlabel('n');
% Fator 5/8: M= 5, L = 8
M = 5; L = 8;
y3 = resample(x,M,L);
subplot(2,2,4);
stem(y3,'b','filled');
title('Fator 5/8');
ylabel('Amplitude');
xlabel('n');
disp('Fim');
