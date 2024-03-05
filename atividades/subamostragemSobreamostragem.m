clc
clear all
close all
disp('Processando...');
subplot(2,2,1);
x=[-3 2 4 6 7 9 -2 3 5 -1 6 7 -4 6 8 -2 10 4 6 2 -3 3 4 5 4];
stem(x);
title('Sinal original');
subplot(2,2,2);
M = 2;
y = downsample(x,M); %Subamostragem
stem(y);
title('Sinal Subamostrado por 2');
subplot(2,2,3);
M = 4;
y = downsample(x,M); %Subamostragem
stem(y);
title('Sinal Subamostrado por 4');
subplot(2,2,4);
L = 2;
k = upsample(x,L); %Sobreamostragem
stem(k);
title('Sinal Sobreamostrado por 2');
disp('Fim');
