function scope(s,os,pj)
global Fd Fs;
Nsamp = Fs/Fd;
switch lower(os)
case {'one-shot'}
 T=1/Fd;
 jmlbit=pj/T;
 ss=s;
 m=length(ss);
 n=0:m-1;nn=n*pj/(Nsamp*jmlbit);
 plot(nn,ss); xi=min(ss); xa=max(ss);
 axis([0 pj xi-abs(xi/10) xa+abs(xa/10)]);
case {'continuous'}
 T=1/Fd;
 MM=pj/T;
 jmlbit=length(s)/(MM*Nsamp);
 ss=s;ss=reshape(ss,(MM*Nsamp),jmlbit);
 n=0:(MM*Nsamp)-1;n=(n/Nsamp)*T;
 plot(n,ss,'b');xi=min(s);
 xa=max(s);
 axis([0 pj xi-abs(xi/10) xa+(xa/10)]);
end