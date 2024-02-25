clear all;close all;clc;
%dados do sinal
f = 10000; %freq de entrada 10Hz
fs = 50000; %freq de amostragem
%gerar sinal continuo T=10 - periodo do sinal
tempo = [0:1/(100*f):10/f];
%geração onda senoidal
sinal = sin(2*pi*f*tempo);
%plotar sinal
plot(tempo, sinal);
hold;
%sinal amostrado
Ts = 1/fs;
N = length(tempo);
n = [0:1:N-1];
t_sample = [0:Ts:n(N)*Ts];
freq_amostra = 2*pi*f/fs;
sinal_sample = sin(freq_amostra.*n);
%plotar sina amostrado
plot(t_sample, sinal_sample,'o');
axis([0 10/f -1.5 1.5]);
set(gca, 'FintSize',16);
set(gca, 'FintSize',16);
xlabel('t');
ylabel('x(t) e x[nT_s]');
hold off;
