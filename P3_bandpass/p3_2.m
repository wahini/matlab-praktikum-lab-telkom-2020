%% P3.2. Deteksi Koheren dari Sinyal Digital Termodulasi Bandpass
clear all;
close all;

%% 3.2.1. ASK
global Fd Fs;
Fd = 1000; 
Fs = 50000;
T = 1/Fd;
b=[1 0 1 0 0 1 round(rand(1,994))];

s = modul(b,'unipolar_nrz');
sa = mix_lo(s,5000,0);

xa=mix_lo(sa,5000,0);

figure('Name','P3-2.1. Grafik 4','NumberTitle','off');
subplot(211), scope(xa,'one-shot',0.006);
title('Grafik 4-a: Sinyal tambahan LO');
[Sxa,f]=psd(xa,2500,Fs,'mean');
subplot(212), plot(f(1:750),Sxa(1:750));
title('Grafik 4-b: PSD dari Sinyal tambahan LO');

ya=afilter(xa,matched('unipolar_nrz'));
subplot(212), scope(ya,'one-shot',0.006);
title('Grafik 4-b: matched filter unipolar NRZ');

%% 3.2.2. Kinerja dari deteksi koheren terhadap pengaruh derau
global MATLAB_SE; MATLAB_SE = 1;
Fs=20000;
b=round(rand(1,10000));
s0=mix_lo(modul(b,'unipolar_nrz'),5000,0);
s1=mix_lo(modul(b,'bipolar_nrz'),5000,0);

% ASK
x0=bbchannel(s0,1,0.5,8000);
x1=bbchannel(s0,1,1,8000);
x2=bbchannel(s0,1,2,8000);
x3=bbchannel(s0,1,3,8000);
y0=afilter(mix_lo(x0,5000,0),matched('unipolar_nrz'));
y1=afilter(mix_lo(x1,5000,0),matched('unipolar_nrz'));
y2=afilter(mix_lo(x2,5000,0),matched('unipolar_nrz'));
y3=afilter(mix_lo(x3,5000,0),matched('unipolar_nrz'));

% PSK
x00=bbchannel(s1,1,0.5,8000);
x01=bbchannel(s1,1,1,8000);
x02=bbchannel(s1,1,2,8000);
x03=bbchannel(s1,1,3,8000);
y00=afilter(mix_lo(x00,5000,0),matched('bipolar_nrz'));
y01=afilter(mix_lo(x01,5000,0),matched('bipolar_nrz'));
y02=afilter(mix_lo(x02,5000,0),matched('bipolar_nrz'));
y03=afilter(mix_lo(x03,5000,0),matched('bipolar_nrz'));

figure('Name','P3-2.2. Grafik 5-a ASK','NumberTitle','off');
subplot(221), scope(y0(1:4000),'continuous',0.002);
subplot(222), scope(y1(1:4000),'continuous',0.002);
subplot(223), scope(y2(1:4000),'continuous',0.002);
subplot(224), scope(y3(1:4000),'continuous',0.002);
detect(y0,0.000475,1e-3,b)
detect(y1,0.000475,1e-3,b)
detect(y2,0.000475,1e-3,b)
detect(y3,0.000475,1e-3,b)

figure('Name','P3-2.2. Grafik 5-b PSK','NumberTitle','off');
subplot(221), scope(y00(1:4000),'continuous',0.002);
subplot(222), scope(y01(1:4000),'continuous',0.002);
subplot(223), scope(y02(1:4000),'continuous',0.002);
subplot(224), scope(y03(1:4000),'continuous',0.002);
detect(y00,0.000475,1e-3,b)
detect(y01,0.000475,1e-3,b)
detect(y02,0.000475,1e-3,b)
detect(y03,0.000475,1e-3,b)

%% 3.2.3. Kesalahan Fase (phase error)
% y=afilter(mix_lo(s,5000,0), matched('bipolar_nrz'));
% b=round(rand(1,500)); 
% s=mix_lo(modul(b,'bipolar_nrz'),5000,0); %ASK
% 
% y40=afilter(mix_lo(s,5000,0),matched('bipolar_nrz'));
% y41=afilter(mix_lo(s,5000,5),matched('bipolar_nrz'))
% y42=afilter(mix_lo(s,5000,10),matched('bipolar_nrz'))
% y43=afilter(mix_lo(s,5000,25),matched('bipolar_nrz'))
% y44=afilter(mix_lo(s,5000,50),matched('bipolar_nrz'))
% y45=afilter(mix_lo(s,5000,75),matched('bipolar_nrz'))
% 
% detect(y40,0.000475,1e-3,b)
% detect(y41,0.000475,1e-3,b)
% detect(y42,0.000475,1e-3,b)
% detect(y43,0.000475,1e-3,b)
% detect(y44,0.000475,1e-3,b)
% detect(y45,0.000475,1e-3,b)
%% 3.2.4. Frekuensi drift
b=round(rand(1,500));
s=mix_lo(modul(b,'unipolar_nrz'),5000,0);

y=afilter(mix_lo(s,5000,0),matched('unipolar_nrz'));
yd=afilter(mix_lo(s,4975,0),matched('unipolar_nrz'));

figure('Name','P3-2.4. Frekuensi drift','NumberTitle','off')
subplot(211), scope(y,'one-shot',0.05);
title('Grafik 5-a: Frekuensi drift');
subplot(212), scope(yd,'one-shot',0.05);
title('Grafik 5-b: Frekuensi drift');



