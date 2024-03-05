
%Comentando p/ consegiur entender o código depois

% Limpa todas as variáveis, figuras e a janela de comando
clear all;
close all;
clc;

%dados do sinal
f = 10000; % Frequência de entrada: 10Hz
fs = 50000; % Frequência de amostragem

% Gerar sinal contínuo T=10 - período do sinal
tempo = [0:1/(100*f):10/f];

% Geração da onda senoidal
sinal = sin(2*pi*f*tempo);

% Plotar sinal contínuo
plot(tempo, sinal);
hold; % Mantém o gráfico atual para sobrepor o próximo gráfico

% Sinal amostrado
Ts = 1/fs; % Período de amostragem
N = length(tempo); % Número de amostras
n = [0:1:N-1]; % Vetor de índices de amostra
t_sample = [0:Ts:n(N)*Ts]; % Vetor de tempo para amostras
freq_amostra = 2*pi*f/fs; % Frequência de amostragem relativa
sinal_sample = sin(freq_amostra.*n); % Amostragem do sinal

% Plotar sinal amostrado
plot(t_sample, sinal_sample, 'o'); % Os pontos de amostra são marcados como 'o'
axis([0 10/f -1.5 1.5]); % Define os limites dos eixos x e y do gráfico
set(gca, 'FontSize',16); % Define o tamanho da fonte do eixo atual
xlabel('t'); % Rótulo do eixo x
ylabel('x(t) e x[nT_s]'); % Rótulo do eixo y
hold off; % Termina a sobreposição dos gráficos

