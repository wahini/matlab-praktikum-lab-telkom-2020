%% P2.1. Matched filter sebagai penerima optimal
clear all;
close all;

%% 2.1.1. 
global Fd Fs;
Fd = 1000; Fs = 100000; T = 1/Fd;
s = modul(1, 'unipolar_nrz');

mf = matched('unipolar_nrz');

figure('Name','1.1. Jawab 1*10^-3')
subplot(311), scope(s, 'one-shot', 2*T);
title('Pulsa asli')
subplot(312), scope(mf, 'one-shot', 2*T);
title('Filter')
subplot(313), scope(afilter(s,mf), 'one-shot', 2*T);
title('Output matched filter')
%% 2.1.2.
s = modul(1, 'manchester');
mf = matched('manchester');

figure('Name','1.2. a.1*10^-3  b.');
subplot(311), scope(s, 'one-shot', 2*T);
title('Pulsa asli')
subplot(312), scope(mf, 'one-shot', 2*T);
title('Filter')
subplot(313), scope(afilter(s,mf), 'one-shot', 2*T);
title('Output matched filter')

%% 2.1.3.
s = modul([1 0 0 1 0 1 1], 'bipolar_rz');

figure('Name','2.1.3.',)
clf, subplot(211), scope(s, 'one-shot', 7*T);
title('Sinyal RZ bipolar');

y = afilter(s, matched('bipolar_rz'));
subplot(212), scope(y, 'one_shot', 7*T);

t = 0:1/Fs:(7*T-1/Fs);
plotyy(t, s, t, y(1:length(t)));
title('Sinyal RZ bipolar dan output matched filter');

