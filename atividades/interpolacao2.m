clc; clear all; close all
disp('Processando...')
n = 0:32;
% Sinal Original
x = cos(0.125*pi*n);
subplot(2,2,1);
stem(x,'g','filled');
title('X[n] Original');
xlabel('n');
% Interpolador L = 2
L = 2;
y1 = interp(x,L);
subplot(2,2,2);
stem(y1,'b','filled');
title('Interpolação L = 2');
xlabel('n');
% Interpolador L = 4
L = 4;
y2 = interp(x,L);
subplot(2,2,3);
stem(y2,'b','filled');
title('Interpolação L = 4');
xlabel('n');
% Interpolador L = 8
L = 8;
y3 = interp(x,L);
subplot(2,2,4);
stem(y3,'b','filled');
title('Interpolação L = 8');
xlabel('n');
disp('Fim');
