%% P2.2. Deteksi sinyal
clear all;
close all;

global Fd Fs;
Fd = 1000; Fs = 100000; T = 1/Fd;
%% P2.2.1. 
b = round(rand(1, 10));
s = modul(b, 'bipolar_nrz');

figure('Name','P2 2.1. Bipolar NRZ Matched Filter','NumberTitle','off')
x = bbchannel(s, 1, 2e-4, 4900); %PSD No/2 = 2e-4; bw = 4900 Hz

subplot(311), scope(s, 'one-shot', 10*T);
title('Gelombang asli')

subplot(312), scope(x, 'one-shot', 10*T);
title('Sinyal dikirim')

y = afilter(x, matched('bipolar_nrz'));
subplot(313), scope(y, 'one-shot', 10*T);
title('Matched filter')



%% P2.2.2.
Fs = 10000;
b = round(rand(1,10000));
s = modul(b, 'bipolar_nrz');

x = bbchannel(s, 1, 0.0e-4, 4900); %kanal
y = afilter(x, matched('bipolar_nrz')); 

figure('Name','P2 2.2. Plot Matched Filter','NumberTitle','off')
scope(y(1:300*Fs/Fd), 'continuous', 2*T);
title('Plot Matched Filter Bipolar NRZ 300 bit pertama');

% untuk tabel
y = transmit(b, 'bipolar_nrz', 0.5*1e-4, 4900); %0.5 1 1.5 2
ber20 = detect(y, 0, T, b); %treshold = 0
y = transmit(b, 'bipolar_nrz', 1*1e-4, 4900); %0.5 1 1.5 2
ber21 = detect(y, 0, T, b);
y = transmit(b, 'bipolar_nrz', 1.5*1e-4, 4900); %0.5 1 1.5 2
ber22 = detect(y, 0, T, b);
y = transmit(b, 'bipolar_nrz', 2*1e-4, 4900); %0.5 1 1.5 2
ber23 = detect(y, 0, T, b);

%% P2.2.3.
y = transmit(b, 'bipolar_nrz', 0.5e-4, 4900);
st = 1e-4:1/Fs:1/Fd;
pe = zeros(1,length(st));
for i = 1:length(st)
    pe(i) = detect(y, 0, st(i), b); %treshold = 0
 end;

figure('Name','P2 2.3. Plot BER vs waktu sampling','NumberTitle','off')
plot(st, pe);
xlabel('waktu sampling');
ylabel('Bit error rate (BER)');
title('BER vs waktu sampling');

%% P2.2.4
y = transmit(b, 'bipolar_nrz', 0.5*1e-4, 1500); %bw=1500 1000 500 350
ber40 = detect(y, 0, T, b);
y = transmit(b, 'bipolar_nrz', 0.5*1e-4, 1000); %bw=1500 1000 500 3500
ber41 = detect(y, 0, T, b);
y = transmit(b, 'bipolar_nrz', 0.5*1e-4, 500); %bw=1500 1000 500 350
ber42 = detect(y, 0, T, b);
y = transmit(b, 'bipolar_nrz', 0.5*1e-4, 350); %bw=1500 1000 500 350
ber43 = detect(y, 0, T, b);

