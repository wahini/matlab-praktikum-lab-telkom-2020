%% P2. 3. Unjuk kerja dari penerima optimal terhadap ISI
clear all;
close all;

global Fd Fs;
Fd = 1000; Fs = 100000; T = 1/Fd;
b = round(rand(1,10000));
%% P2.3.1.

y = transmit(b, 'bipolar_nrz', 0, 550); %bw=550 Hz
ber = detect(y, 0, T, b, 1)

%% P2.3.2.
% y = transmit(b,'raised cosine',0,550,<roll_off>);
% ber = detect(y,<threshold>,<sampling_time>,b,20)

%% P2.3.3.