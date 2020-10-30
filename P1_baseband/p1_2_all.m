%% set new
close all;
clear all;

global Fd Fs;
Fs = 10000;
Fd = 1000;
T = 1/Fd;

%% Percobaan 2.1.
% set data 2.1.
b = [0 1 0 0 1 0 0 1 1 0];
s = modul(b, 'bipolar_nrz');
[Ss,f] = psd(modul(b, 'bipolar_nrz'), 10000, Fs,'mean');

% Figure 2.1. Bipolar NRZ - Nilai bandwidth yang diperlukan 1000 Hz
figure('Name','P1 2.1. Bipolar NRZ','NumberTitle','off')
plot(f, 10*log10(Ss));
title('Bipolar NRZ - Nilai bandwidth yang diperlukan 1000 Hz');

% Jawab: bandwidth transmisi 10 kHz

%% Percobaan 2.2. 
% Figure 2.2. Efek AWGN
figure('Name','P1 2.2. Efek AWGN','NumberTitle','off')
x = bbchannel(s,1,0.01,4900);
subplot(2,1,1), scope(s,'one-shot',0.01); title('Sinyal dikirim');
subplot(2,1,2), scope(x,'one-shot',0.01); title('Terkena AWGN');

% Jawab: ya, masih dapat terlihat secara visual meski terkena noise

%% Percobaan 2.3.
% Figure 2.3.1. Efek Daya Derau
figure('Name','P1 2.3.1. Efek Daya Derau','NumberTitle','off')
subplot(3,2,1); 
scope(s,'one-shot',0.01);title('Sinyal asli');

subplot(3,2,2);
scope(bbchannel(s,1,0.1,4900),'one-shot',0.01);title('daya derau = 0.1 W');

subplot(3,2,3);
scope(bbchannel(s,1,0.5,4900),'one-shot',0.01);title('daya derau = 0.5 W');

subplot(3,2,4);
scope(bbchannel(s,1,1,4900),'one-shot',0.01);title('daya derau = 1 W');

subplot(3,2,5);
scope(bbchannel(s,1,2,4900),'one-shot',0.01);title('daya derau = 2 W');

subplot(3,2,6);
scope(bbchannel(s,1,5,4900),'one-shot',0.01);title('daya derau = 5 W');

% Jawab: pada level daya derau 5 W output kanal tidak bisa dibedakan terhadap derau

% set data
b = round(rand(1,1000));
s = modul(b,'bipolar_nrz');

% Figure 2.3.2. PSD dari setiap Efek Daya Derau
figure('Name','P1 2.3.2. PSD dari setiap Efek Daya Derau','NumberTitle','off')
[Ss,f] = psd(s,length(s),Fs,'mean'); clf, subplot(221), plot(f,Ss), a = axis;title('PSD dari sinyal asli');
[Sx,f] = psd(bbchannel(s,1,0.01,4900),length(s),Fs,'mean');
subplot(222), plot(f,Sx); axis(a);title('PSD dari sinyal terima; daya derau =0.01 W');
[Sx,f] = psd(bbchannel(s,1,1,4900),length(s),Fs,'mean');
subplot(223), plot(f,Sx); axis(a);title('PSD dari sinyal terima; daya derau =1 W');
[Sx,f] = psd(bbchannel(s,1,5,4900),length(s),Fs,'mean');
subplot(224), plot(f,Sx); axis(a);title('PSD dari sinyal terima; daya derau =5 W');

%% Percobaan 2.4.
% set data
b = [0 1 0 0 1 0 0 1 1 0];
s = modul(b, 'bipolar_nrz');

% Figure 2.5. Low-pass ideal
figure('Name','P1 2.4. Low-pass ideal','NumberTitle','off');
subplot(611), scope(s,'one-shot', 10*T); title('Sinyal asli');
subplot(612), scope(bbchannel(s,1,0,4900),'one-shot',10*T);
title('Bandwidth 4900');
subplot(613), scope(bbchannel(s,1,0,3000),'one-shot',10*T);
title('Bandwidth 3000');
subplot(614), scope(bbchannel(s,1,0,2000),'one-shot',10*T);
title('Bandwidth 2000');
subplot(615), scope(bbchannel(s,1,0,1000),'one-shot',10*T);
title('Bandwidth 1000');
subplot(616), scope(bbchannel(s,1,0,500),'one-shot',10*T);
title('Bandwidth 500');
