function sa=mix_lo(s,fc,teta);
global Fd Fs;
ss=s;m=length(ss);
n=0:m-1;
sas=sin(2*(fc/Fs)*pi*n+pi*(teta/180));
sa=sas.*ss;