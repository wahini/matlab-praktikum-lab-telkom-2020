function sf=vco(s,fc)
mm=length(s);
fc=fc/1000;
t=0:mm-1;
fm=(s+1).*sin(((2*(fc+2))/50)*pi*t)+(s-1).*-sin(((2*(fc-2))/50)*pi*t);
fm=fm/2;
sf=fm;