global Fd Fs;
Fs = 10000;
Fd = 1000;
T = 1/Fd;

%% Percobaan 4.1.
% set data
b = [1 zeros(1,20)];
s1 = modul(b,'unipolar_nrz');
x1 = isichannel(s1,1,0,1500,0.2);

% di run manual
p41a=computeisi(s1,0.6,0)
p41b=computeisi(x1,0.7,0)

%% Percobaan 4.2.
% set data
s2 = modul(b,'unipolar_nyquist');
x2 = isichannel(s2,1,0,1500,0.2);
p42a=computeisi(s2,0.6,10)
p42b=computeisi(x2,0.7,10)
p42c=(p42b-p42a)/p42a