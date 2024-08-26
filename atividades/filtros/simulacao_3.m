clc
 clear all
 close all
 disp(Processando...')
 %------------------------------------------
 %Especificações filtro
 %------------------------------------------
 fs=1800; % frequência de Amostragem
 fp=100; % largura banda de passagem
 fr=300; % banda de rejeição
 Ap=0.5; % Ganho banda de passagem
 Ar=20; % Atenuação banda de rejeição
 %------------------------------------------
 %Sinal a ser filtrado
 %------------------------------------------
 f1=50; % frequência dentro da banda de passagem
 f2=800; % frequência dentro da banda de rejeição (ruído)
 t=0:1:1000;
 x =6*sin((2*pi*f1*t/fs))+2*sin((2*pi*f2*t/fs))+0.5*sin((2*pi*600*t/fs))+3*sin((2*pi*700*t/fs)); % Sinal de entrada com ruido.
 %------------------------------------------
 %Plota sinal de entrada com ruído
 %------------------------------------------
 figure
 plot(x) % Plota sinal de entrada com ruído
 title('Sinal de entrada com Ruído')
 %------------------------------------------
 %Plota espectro de frequência para o sinal de entrada
 %------------------------------------------
 figure
 n= max(size(t)); % Composição do eixo da frequência..
 F = fs*(-n/2:(n/2)-1)/n; % Composição do eixo da freqüência..
 J=abs(fftshift(fft(x))); %FFT
 %stem(F,J,'k','.');
 stem(F,J);
 xlabel('Frequência Hz')
 title('Espectro de Frequência')
