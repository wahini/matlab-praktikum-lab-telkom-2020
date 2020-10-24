function [y]=bbchannel(s,att,npwr,bw)
global Fd Fs;
%ss=s;
%bw=bw;
N=length(s);
M=floor(N*(round(bw)/Fs));
nawgn=(sqrt(npwr))*rand(1,N);
x=att*s + nawgn;
Xf=fft(x);
if N==2*floor(N/2)
 zbw=(N/2)-M-1;
else
 zbw=(N+1)/2-M-1;
end
bww=ones(1,M+1);
bwz=zeros(1,zbw);
sk=[bww bwz bwz bww];
Xflp=Xf.*sk;
y=real(ifft(Xflp));
