function [isi] = computeisi(s,ts,ori)
global Fd Fs;
if (nargin<3)
 return
elseif (nargin==3)
 Nsamp = Fs/Fd;
 orinum = round((ori+1)*Nsamp)+1;
 tsnum = round(ts*Nsamp);
 ysamp = s(orinum+tsnum:Nsamp:length(s));
 isi = sum(ysamp.^2)/length(ysamp);
end