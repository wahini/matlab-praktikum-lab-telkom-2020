%% set new
close all;
clear all;

global Fd Fs;
Fs = 10000;
Fd = 1000;
T = 1/Fd;
%% set data
b = round(rand(1,1000));
[Ss0,f] = psd(modul(b, 'bipolar_nrz'), 10000, Fs, 'mean');
[Ss1,f] = psd(modul(b, 'bipolar_nrz'), 10000, Fs, 'mean');
[Ss2,f] = psd(modul(b, 'bipolar_rz'), 10000, Fs, 'mean');
[Ss3,f] = psd(modul(b, 'manchester'), 10000, Fs, 'mean');
[Ss4,f] = psd(modul(b, 'ami'), 10000, Fs, 'mean');
[Ss5,f] = psd(modul(b, 'bipolar_nyquist'), 10000, Fs, 'mean');
%% Plot
% Figure 1. PSD Unipolar NRZ
figure('Name','PSD Unipolar NRZ')
subplot(2,1,1); plot(f,Ss0); title('PSD Unipolar NRZ');
subplot(2,1,2); plot(f,10*log10(Ss0)); title('PSD Logaritmik Unipolar NRZ');

% Figure 2. PSD Bipolar NRZ
figure('Name','PSD Bipolar NRZ')
subplot(2,1,1); plot(f,Ss1); title('PSD Bipolar NRZ')
subplot(2,1,2); plot(f,10*log10(Ss1));title('PSD Logaritmik Bipolar NRZ');

% Figure 3. PSD Bipolar RZ
figure('Name','PSD Bipolar RZ')
subplot(2,1,1); plot(f,Ss2); title('PSD Bipolar RZ')
subplot(2,1,2); plot(f,10*log10(Ss2));title('PSD Logaritmik Bipolar RZ');

% Figure 4. PSD Manchester
figure('Name','PSD Manchester')
subplot(2,1,1); plot(f,Ss3); title('PSD Manchester')
subplot(2,1,2); plot(f,10*log10(Ss3));title('PSD Logaritmik Manchester');

% Figure 5. PSD AMI
figure('Name','PSD AMI')
subplot(2,1,1); plot(f,Ss4); title('PSD AMI')
subplot(2,1,2); plot(f,10*log10(Ss4));title('PSD Logaritmik AMI');

% Figure 6. PSD Bipolar Nyquist
figure('Name','PSD Bipolar Nyquist')
plot(f,Ss5); title('PSD Bipolar Nyquist')

%% Figure 7. Plot Manchester
figure('Name','Plot PSD Manchester')
subplot(3,1,1)
[Ss,f] = psd(modul(b,'manchester',250), 10000*Fs/250,Fs,'mean');
plot(f,Ss);
title('PSD Manchester Data Rate 250')

subplot(3,1,2)
[Ss,f] = psd(modul(b,'manchester',500), 10000*Fs/500,Fs,'mean');
plot(f,Ss);
title('PSD Manchester Data Rate 500')

subplot(3,1,3)
[Ss,f] = psd(modul(b,'manchester',1000), 10000*Fs/1000,Fs,'mean'); 
plot(f,Ss);
title('PSD Manchester Data Rate 1000')
