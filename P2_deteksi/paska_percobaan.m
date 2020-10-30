%% P2 Paska Percobaan
clear all;
close all;
 
global Fd Fs;
Fd = 1000; Fs = 100000; T = 1/Fd;
%% Soal No. 1
b = [1 0 1 1 0]
s = modul(b, 'unipolar_nrz');
mf = matched('unipolar_nrz')

%plot
figure('Name','Paska:1 Unipolar NRZ [1 0 1 1 0]','NumberTitle','off');
subplot(211); scope(s, 'one-shot', 5*T);
xlabel('Waktu (detik)'); ylabel('Amplitudo')
title({'Sinyal Unipolar NRZ','[1 0 1 1 0]'});

subplot(212), scope(afilter(s,mf), 'one-shot', 5*T);
xlabel('Waktu (detik)'); ylabel('Amplitudo')
title('Matched filter')

%% Soal No. 3
syms x
fplot(erfc(x),[-5 5])
title('Plot ERFC')
grid on