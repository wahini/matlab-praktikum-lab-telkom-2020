close all;
clear all;

global Fd Fs;
Fs = 10000;
Fd = 1000;
T = 1/Fd;
%%
b = [1 0 0 1 0 1 1 0 0 1];
s = modul(b,'bipolar_nrz'); %ideal tidak terdistorsi

%% Figure Latihan
figure('Name','Contoh Eye Pattern');
subplot(221), scope(s,'one-shot',10*T); title('Sinyal asli');
subplot(223), scope(s,'continuous',2*T); title('Sinyal asli');%eyepattern
x = bbchannel(s,1,0.02,4000); %melewati kanal
subplot(222), scope(x,'one-shot',10*T); title('Sinyal terdistorsi');
subplot(224), scope(x,'continuous',2*T); title('Sinyal terdistorsi');

%% Figure Eye Pattern Bipolar NRZ
figure('Name','Eye Pattern Bipolar NRZ');
x = bbchannel(s,1,0.01,3000); %melewati kanal
subplot(321), scope(x,'continuous',2*T); title('np=0.01W BW=3000 Hz');
x = bbchannel(s,1,0.01,2000); %melewati kanal
subplot(322), scope(x,'continuous',2*T); title('np=0.01W BW=2000 Hz');
x = bbchannel(s,1,0.01,1000); %melewati kanal
subplot(323), scope(x,'continuous',2*T); title('np=0.01W BW=1000 Hz');
x = bbchannel(s,1,0.02,4000); %melewati kanal
subplot(324), scope(x,'continuous',2*T); title('np=0.02W BW=4000 Hz');
x = bbchannel(s,1,0.08,4000); %melewati kanal
subplot(325), scope(x,'continuous',2*T); title('np=0.08W BW=4000 Hz');
x = bbchannel(s,1,0.1,4000); %melewati kanal
subplot(326), scope(x,'continuous',2*T); title('np=0.10W BW=4000 Hz');
%% Figure Eye Pattern Manchester
s = modul(b,'manchester'); %ideal tidak terdistorsi

figure('Name','Eye Pattern Manchester');
x = bbchannel(s,1,0.01,3000); %melewati kanal
subplot(321), scope(x,'continuous',2*T); title('np=0.01W BW=3000 Hz');
x = bbchannel(s,1,0.01,2000); %melewati kanal
subplot(322), scope(x,'continuous',2*T); title('np=0.01W BW=2000 Hz');
x = bbchannel(s,1,0.01,1000); %melewati kanal
subplot(323), scope(x,'continuous',2*T); title('np=0.01W BW=1000 Hz');
x = bbchannel(s,1,0.02,4000); %melewati kanal
subplot(324), scope(x,'continuous',2*T); title('np=0.02W BW=4000 Hz');
x = bbchannel(s,1,0.08,4000); %melewati kanal
subplot(325), scope(x,'continuous',2*T); title('np=0.08W BW=4000 Hz');
x = bbchannel(s,1,0.1,4000); %melewati kanal
subplot(326), scope(x,'continuous',2*T); title('np=0.10W BW=4000 Hz');