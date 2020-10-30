%% set new
close all;
clear all;

global Fd Fs;
Fs = 10000;
Fd = 1000;
T = 1/Fd;
%% set data
b = [1 0 1 0 0 0 1 1 1 1];

s0 = modul(b, 'unipolar_nrz', Fd, Fs);
s1 = modul(b, 'bipolar_nrz', Fd, Fs);
s2 = modul(b, 'bipolar_rz', Fd, Fs);
s3 = modul(b, 'manchester', Fd, Fs);
s4 = modul(b, 'ami', Fd, Fs);
s5 = modul(b, 'bipolar_nyquist', Fd, Fs);
%% Figure 1. Pengkodean Kanal
figure('Name','P 1.1. Pengkodean Kanal','NumberTitle','off')

subplot(3,2,1)
scope(s0, 'one-shot', 10*T);
title('Unipolar NRZ')

subplot(3,2,2)
scope(s1, 'one-shot', 10*T);
title('Bipolar NRZ')

subplot(3,2,3)
scope(s2, 'one-shot', 10*T);
title('Bipolar RZ')

subplot(3,2,4)
scope(s3, 'one-shot', 10*T);
title('AMI')

subplot(3,2,5)
scope(s4, 'one-shot', 10*T);
title('Manchester')

subplot(3,2,6)
scope(s5(100:298), 'one-shot', 10*T);
title('Bipolar Nyquist')