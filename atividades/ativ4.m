% Limpa a janela de comando
clc;

% Limpa todas as variáveis da área de trabalho
clear all;

% Fecha todas as janelas de figuras abertas
close all;

% Exibe a mensagem "Processando..." na janela de comando
disp('Processando...');

%Sinal
fs = 1000; % Taxa de amostragem (Hz)
t = -2*pi:1/fs:2*pi; % Vetor de tempo variando de -2π a 2π
x = 0.5*sin(2*pi*100*t) + 0.1*sin(2*pi*250*t); % Sinal composto por duas senoides

%FFT
N = length(x); % Número de amostras no sinal
T = N/fs; % Período total do sinal
freq = linspace(0, N, N) / T; % Vetor de frequência para a FFT
fc = ceil(N/2); % Índice para ajustar os dados do vetor
X = fft(x) / N; % FFT do sinal, normalizada pelo número de amostras
X = X(1:fc); % Ajuste da FFT considerando apenas metade do espectro de frequência

% Gráfico do sinal de entrada
figure;
plot(t, x);
title('Sinal de entrada');
axis([-0.5 0.5 -1 1]); % Define os limites dos eixos x e y do gráfico

% Gráfico da análise do sinal no domínio da frequência
figure;
plot(freq(1:fc), abs(X)); % Plota a magnitude da FFT em função da frequência
ylabel('|X|');
title('Análise do sinal');
xlabel('Freq (Hz)');
grid on; % Ativa a grade no gráfico

% Exibe a mensagem "Fim" na janela de comando
disp('Fim');

