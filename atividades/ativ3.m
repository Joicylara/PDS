% Carrega o pacote de controle para Octave
pkg load control;

% Fecha todas as janelas de gráfico abertas, se houver
close all;

% Limpa todas as variáveis da área de trabalho
clear all;

% Definição da frequência do sinal de entrada
sigfreq = 10;
tau = 1/sigfreq; % Período do sinal

% Frequência de amostragem
sampfreq = 1000;
Ts = 1/sampfreq; % Período de amostragem

% Duração do sinal
Tf = 1;

% Gera um sinal senoidal
[u, t] = gensig('sin', tau, Tf, Ts);

% Plota o sinal senoidal
figure;
plot(t, u, 'b');
% Cria o título para o gráfico
tt = sprintf(['Senóide de frequência %dHz, durante de %ds e amostrada a %dkHz'], sigfreq, Tf, sampfreq/1000);
title(tt);

% Gera um sinal quadrado e um sinal de pulso periódico
[u1, t] = gensig('square', tau, Tf, Ts);
[u2, t] = gensig('pulse', tau, Tf, Ts);

% Plota o sinal quadrado e o sinal de pulso periódico em subplots
figure;
subplot(2, 1, 1);
plot(t, u1);
% Cria o título para o subplot do sinal quadrado
tt = sprintf(['Onda quadrada de frequência %dHz, duração de %ds e amostrada a %dkHz'], sigfreq, Tf, sampfreq/1000);
title(tt);

subplot(2, 1, 2);
plot(t, u2);
% Cria o título para o subplot do sinal de pulso periódico
tt = sprintf(['Pulso periódico de frequência %dHz, duração de %ds e amostrada a %dkHz'], sigfreq, Tf, sampfreq/1000);
title(tt);

