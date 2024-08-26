clc;
clear;

nbits = 16; % Número de bits
fs = 44100; % Taxa de amostragem

% Carregar o arquivo de áudio
s = 'minha_voz.wav';
[y, fs] = audioread(s);

% Selecionar o primeiro canal (em caso de áudio estéreo)
y = y(:,1)';

% Reproduzir o áudio
soundsc(y, fs, nbits);

% FFT do sinal
Y = fft(y);

% Criar vetor de tempo
t = (0:length(y)-1)/fs;

% Criar vetor de frequências para a FFT (espectro completo)
f = (0:length(Y)-1)*fs/length(Y);

% Plot do sinal original
figure;
subplot(3,1,1);
plot(t, y);
title("Sinal Original");
xlabel("Tempo (s)");

% Plot da FFT (espectro completo)
subplot(3,1,2);
plot(f, abs(Y));
title("FFT do Sinal");
xlabel("Frequência (Hz)");
ylabel("Amplitude");

% Ajustar o eixo x para mostrar até a frequência máxima fs
xlim([0 fs]);

% Gerar o sinal de tom "Lá" (440 Hz)
freq_tom = 440; % Frequência do tom "Lá"
tom = 0.5 * sin(2*pi*freq_tom*t); % Tom de 440 Hz com amplitude reduzida

% Adicionar o tom ao áudio original
y_modificado = y + tom;

% FFT do sinal modificado
Y_modificado = fft(y_modificado);

% Reproduzir o áudio modificado
soundsc(y_modificado, fs, nbits);

% Plot do sinal modificado
figure;
subplot(3,1,1);
plot(t, y_modificado);
title("Sinal Modificado (com Tom de 440 Hz)");
xlabel("Tempo (s)");

% Plot da FFT do sinal modificado
subplot(3,1,2);
plot(f, abs(Y_modificado));
title("FFT do Sinal Modificado");
xlabel("Frequência (Hz)");
ylabel("Amplitude");

% Salvar o sinal modificado em um novo arquivo de áudio
audiowrite('minha_voz_e_LA.wav', y_modificado, fs);

% Parâmetros do filtro passa-baixas FIR
fp = 2300; % Frequência de passagem (Hz)
fc = 3800; % Frequência de corte (Hz)
wp = fp / (fs / 2); % Frequência de passagem normalizada
wc = fc / (fs / 2); % Frequência de corte normalizada

% Calcular a frequência de transição e a frequência de corte intermediária
wt = wc - wp; % Frequência de transição
wt = (wc + wp) / 2; % Frequência de corte intermediária

% Comprimento do filtro
M = ceil(6.6 / wt) + 1; % Comprimento do filtro
alpha = (M - 1) / 2;
n = 0:M-1;
m = n - alpha + eps;
hd = sin(wc * m) ./ (pi * m); % Função sinc
hd(alpha+1) = wc / pi; % Corrigir o valor para m = 0
w_harm = hamming(M)'; % Janela de Hamming
h = hd .* w_harm; % Coeficientes do filtro

% Filtrar o sinal
y_filtrado = conv(y, h, 'same');

% FFT do sinal filtrado
Y_filtrado = fft(y_filtrado);

figure;
subplot(3,1,2);
plot(t, y_filtrado);
title("Sinal Filtrado (sem Tom de 440 Hz)");
xlabel("Tempo (s)");

subplot(3,1,3);
plot(f, abs(Y_filtrado));
title("FFT do Sinal Filtrado");
xlabel("Frequência (Hz)");
ylabel("Amplitude");

% Reproduzir o áudio filtrado
soundsc(y_filtrado, fs, nbits);

% Salvar o sinal modificado com filtro em um novo arquivo de áudio
audiowrite('minha_voz_sem_LA_filtrado.wav', y_filtrado, fs);
