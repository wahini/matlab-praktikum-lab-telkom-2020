%% P2. 3. Unjuk kerja dari penerima optimal terhadap ISI
clear all;
close all;


% 2.3.1.
y = transmit(b, 'bipolar_nrz', 0, 550);
detect(y, <threshold>, <sampling_time>, b, <delay>)

% 2.3.2.
y = transmit(b,'raised cosine',0,550,<roll_off>);
ber = detect(y,<threshold>,<sampling_time>,b,20)

% 2.3.3.