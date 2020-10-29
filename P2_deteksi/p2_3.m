%% P2. 3. Unjuk kerja dari penerima optimal terhadap ISI
clear all;
close all;

global Fd Fs;
Fd = 1000; Fs = 100000; T = 1/Fd;
b = round(rand(1,10000));
%% P2.3.1.
y = transmit(b, 'bipolar_nrz', 0, 550); %bw=550 Hz
ber = detect(y, 0, T, b)

%% P2.3.2.
% y = transmit(b,'raised cosine',0,550,0.2);
% ber = detect(y,<threshold>,<sampling_time>,b,20)

npsd = 0 %noise;
rolloff = 0.2;
delay = 21;
bw = 550;
samptime = 0.001;
th = 0;
% 
%raised Cosine
s = rcosflt(b,Fd,Fs,'sqrt',rolloff,delay);
ls = length(s);
ff = [1:ls];
fco = floor(bw/Fs*ls); % cutoff freq
flp = (ff<=fco|ff>=(ls-fco+2)); % low pass filter
Sf = fftshift(s);
Sfbl = Sf'.*flp;
sbl = real(ifft(Sfbl));
chnlout = sbl + sqrt(npsd)*randn(1,ls);
y = chnlout;

plot(y)

MM=length(b)*(Fs/Fd);
sT=round(Fs*samptime);
ysamp=y(sT:Fs/Fd:sT+Fs/Fd*(length(b)-1));
yshifted = delayseq(ysamp,21,100);
%y=y(1:MM);
%ymat=reshape(y,(length(y))/length(b),length(b));
%yy=ymat(sT,:);
ydet=sign(ysamp-th);
%ya=sign(ya);
ya1=0.5*(ydet+1);
berall=biterr(b,ya1);
ber=berall/length(b)
% y = transmit(b,'raised cosine',0,550,1);

%% P2.3.3.
