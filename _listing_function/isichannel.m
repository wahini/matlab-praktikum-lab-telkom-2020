function [chnlout] = isichannel(s,gain,npwr,bw,wno)
global Fs Fd;
N = length(s);
M=floor(N*(round(bw)/Fs));
nawgn=(sqrt(npwr))*rand(1,N);
x=gain*s + nawgn;
Xf=fft(x);
if N==2*floor(N/2)
 zbw=(N/2)-M-1;
else
 zbw=(N+1)/2-M-1;
end
bww=ones(1,M+1);
bwz=zeros(1,zbw);
sk=[bww bwz bwz bww];
Xflp=Xf.*sk; % bandlimited signal
wnoM = floor(wno*M);
if M==2*floor(M/2)
 if wnoM==2*floor(wnoM/2)
 Xflp(M/2-wnoM/2+1:M/2+wnoM/2) = zeros(1,wnoM);
 Xflp(N-(M/2+wnoM/2)+2:N-(M/2-wnoM/2+1)+2) = zeros(1,wnoM);
 else
 Xflp(M/2-(wnoM-1)/2+1:M/2+(wnoM-1)/2-1) = zeros(1,wnoM);
 Xflp(N-(M/2+(wnoM-1)/2-1)+2:N-(M/2-(wnoM-1)/2+1)+2) = zeros(1,wnoM);
 end
else
 if wnoM==2*floor(wnoM/2)
 Xflp((M+1)/2-wnoM/2+1:(M+1)/2+wnoM/2) = zeros(1,wnoM);
 Xflp(N-((M+1)/2+wnoM/2)+2:N-((M+1)/2-wnoM/2+1)+2) = zeros(1,wnoM);
 else
 Xflp((M+1)/2-(wnoM-1)/2+1:(M+1)/2+(wnoM-1)/2-1) = zeros(1,wnoM);
 Xflp(N-((M+1)/2+(wnoM-1)/2-1)+2:N-((M+1)/2-(wnoM-1)/2+1)+2) = zeros(1,wnoM);
 end
end
chnlout=real(ifft(Xflp));