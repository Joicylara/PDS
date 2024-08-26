pkg load signal
pkg load control

clc
s = "seis.wav";
fs = 44100;
Ts = 1/fs;
[sinal, fs] = audioread(s);
t=0:length(sinal)-1;
subplot(3,1,1);
plot(t,sinal);
title('Sinal de Voz'); ylabel('Amplitude');
xlabel('t');
grid on;
X = fft(sinal);
N=length(sinal);
Fbin = 0:1:N-1;

subplot(3,1,2);
plot((fs/N).*Fbin, abs(X));
title('Espectro em Frequência do Sinal');
ylabel('Amplitude'); xlabel('Hz'); xlim([0 fs/3]);
grid on;
%filtro PB FIR
fp = 1000; % freq passagem
fc = 1500; % freq de corte
% frequência normalizada
wp = (fp/(fs/2))*pi;
wc = (fc/(fs/2))*pi;
wt = wc - wp; % freq de transição
wt = (wc+wp)/2; % freq de corte intermediaria
% filtro PB ideal
M = ceil(6.6*pi/wt)+1; % comprimento do filtro
alpha = (M-1)/2;
n = [0:M-1];
m = n - alpha + eps;
hd = sin(wc*m)./(pi*m); % função sinc

w_harm = hamming(M)';
h = hd.*w_harm;
s1_filtrado = conv(h, sinal);
Y = fft(s1_filtrado);
N = length(s1_filtrado);
Fbin = 0:1:N-1;
subplot(3,1,3);
plot((fs/N).*Fbin, abs(Y));
title('Espectro em Frequência do Sinal Filtrado');
ylabel('Amplitude'); xlabel('Hz'); xlim([0 fs/3]);
grid on;
