%% P3.1. Pembangkitan sinyal termodulasi bandpass
clear all;
close all;

%% 3.1.1. ASK
global Fd Fs;
Fd = 1000; 
Fs = 50000;
b=[1 0 1 0 0 1 round(rand(1,994))];

s = modul(b,'unipolar_nrz');
sa = mix_lo(s,5000,0);
figure('Name','P3-1.1. Plot ASK','NumberTitle','off');
subplot(211), scope(s,'one-shot',0.006);
title('sinyal informasi','1 0 1 0 0 1');
subplot(212), scope(sa,'one-shot',0.006);
title('ASK');

%% 3.1.2. PSD ASK
figure('Name','P3-1.2. Plot kerapatan spektral daya dari s dan sa antara 0 sampai 10 kHz','NumberTitle','off');
[Ss,f]=psd(s,2500,Fs,'mean');
clf, subplot(211), plot(f(1:500),Ss(1:500));
title('Grafik 1-a: PSD dari NRZ Unipolar');
[Ssa,f]=psd(sa,2500,Fs,'mean');
subplot(212), plot(f(1:500),Ssa(1:500));
title('Grafik 1-b: PSD dari ASK');

%% 3.1.3. PSK
s=modul(b,'bipolar_nrz');
sp=mix_lo(s,5000,0);

figure('Name','P3-1.3. Plot PSK','NumberTitle','off');
subplot(211), scope(s,'one-shot',0.006);
title('sinyal informasi','1 0 1 0 0 1');
subplot(212), scope(sp,'one-shot',0.006);
title('PSK');


%% 3.1.4. PSD PSK
figure('Name','P3-1.4. Plot kerapatan spektral daya dari s dan sp','NumberTitle','off');
[Ss,f]=psd(s,2500,Fs,'mean');
subplot(211), plot(f(1:500),Ss(1:500));
title('Grafik 1-c: PSD dari NRZ bipolar');
[Ssp,f]=psd(sp,2500,Fs,'mean');
subplot(212), plot(f(1:500),Ssp(1:500));
title('Grafik 1-d: PSD dari PSK');

%% 3.1.5. ASK vs PSK
figure('Name','P3-1.5. bandingkan spektrum daya dari ASK dan PSK','NumberTitle','off');
subplot(211), plot(f(1:500),Ssa(1:500));
title('Grafik 2-a: PSD dari ASK');
subplot(212), plot(f(1:500),Ssp(1:500));
title('Grafik 2-b: PSD dari PSK');

%% 3.1.6. FSK
sf=vco(s,5000);

% Tampilkan 6 mdtk pertama gelombang s dan sf:
subplot(211), scope(s,'one-shot',0.006);
subplot(212), scope(sf,'one-shot',0.006)

% Tampilkan kerapatan spektral daya dari sf:
figure('Name','P3-1.6. FSK kerapatan spektral daya dari sf','NumberTitle','off');
[Ssf,f]=psd(sf,2500,Fs,'mean');
plot(f(1:500),Ssf(1:500));
title('Grafik 3: PSD dari FSK');
