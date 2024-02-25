
%Comentando p/ consegiur entender o código depois

% Limpa a janela de comando
clc;

% Cria um vetor de tempo t que varia de 0 a 2 segundos com incremento de 0.0001 segundos
t = 0:0.0001:2;

% Calcula um sinal analógico x, que é uma senoide com frequência de 5 Hz variando com o tempo t
x = sin(2*pi*5*t); % sinal analógico

% Cria uma nova figura
figure

% Divide a figura em 2 linhas e 1 coluna e seleciona o primeiro subplot
subplot(2, 1, 1);

% Plota o sinal x em função do tempo t no primeiro subplot
plot(t, x);

% Define a frequência de amostragem como 20 amostras por segundo
fs = 20;

% Cria um vetor de tempo ts que varia de 0 a 2 segundos com uma frequência de amostragem de 20 Hz
ts = 0:1/fs:2;

% Calcula um sinal discreto xs, que é uma senoide com frequência de 5 Hz amostrada em ts
xs = sin(2*pi*5*ts);

% Seleciona o segundo subplot para o próximo gráfico
subplot(2, 1, 2);

% Plota o sinal xs em função do tempo ts no segundo subplot
% ro- significa que os pontos de dados são marcados como círculos vermelhos e são conectados por linhas
plot(ts, xs, 'ro-');


