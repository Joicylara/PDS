clc
clear all
close all
pkg load signal
disp('Executando...');
%====================================
fs = 44100; %frequência de amostragem
nbits = 16;
nchannel = 1;
# leitura de um arquivo *.wav ----
arquivo = 'teste_voz.wav';
info = audioinfo(arquivo);
disp(info);
[audio_mix, fs_can] = audioread(arquivo);
audio_mix = audio_mix(:,1)'; # canal
# escutando o som -----------------
soundsc(audio_mix,fs, nbits);
# plotar o audio ------------------
tfinal = length(audio_mix)*1/fs;
t = linspace(0,tfinal, length(audio_mix));
figure
plot(t,audio_mix,'.b');
grid on
title('Sinal de Áudio'); xlabel('t(s)'); ylabel('sinal');
%==========================
% Subamostragem
M = 30;
audio_sub = downsample(audio_mix,M); %Subamostragem
fs1 = fs/M;
tfinal1 = length(audio_sub)*1/fs1;
t1 = linspace(0,tfinal1, length(audio_sub));
figure
plot(t1,audio_sub,'.r');
%hold on
%plot(t,audio_mix,'.b');
grid on
%hold off
title('Sinal de Áudio Subamostrado'); xlabel('t(s)'); ylabel('sinal');
soundsc(audio_sub,fs1, nbits);
figure
subplot(2,1,1);
plot(audio_mix,'.b');
subplot(2,1,2);
plot(audio_sub,'.r');
disp('Finalizado.');
