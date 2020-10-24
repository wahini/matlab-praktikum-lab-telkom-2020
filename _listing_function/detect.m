function [ber]=detect(y,th,samptime,b);
if (nargin == 0)
return;
elseif (nargin == 1)
return
elseif (nargin == 2)
return
elseif (nargin == 3)
return
elseif (nargin == 4)
global Fs Fd;
 MM=length(b)*(Fs/Fd);
 sT=round(Fs*samptime);
 ysamp=y(sT:Fs/Fd:sT+Fs/Fd*(length(b)-1));
 %y=y(1:MM);
 %ymat=reshape(y,(length(y))/length(b),length(b));
 %yy=ymat(sT,:);
 ydet=sign(ysamp-th);
 %ya=sign(ya);
 ya1=0.5*(ydet+1);
 berall=biterr(b,ya1);
 ber=berall/length(b);
end