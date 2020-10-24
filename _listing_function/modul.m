function [s]=modul(b,pulsa,rolloff,delay)
%[s] = modul(binary_sequence,'line_code')
global Fd Fs;
Nsamp=Fs/Fd;
if (nargin == 0)
return;
elseif (nargin == 1)
elseif (nargin > 1)
switch lower(pulsa)
 case {'unipolar_nrz'}
 s=rectpulse(b,Nsamp);
 case {'bipolar_nrz'}
 s=rectpulse(b,Nsamp);
 s=s*2-1;
 case {'bipolar_rz'}
 bpolar = 2*b-1;
 if (Nsamp==floor(Nsamp/2)*2)
 bpolarup = upsample(bpolar,2);
 s = rectpulse(bpolarup,Nsamp/2);
 else
 shalf = kron(bpolar,ones(ceil(Nsamp/2),1));
 sfull = [shalf; zeros(floor(Nsamp/2),length(b))];
 s = sfull(:)';
 end
 case {'ami'}
 % ami nrz
 sum_mat = tril(ones(length(b)));
 power_factor = sum_mat * b' + 1;
 bami = (-b).^(power_factor');
 s = rectpulse(bami,Nsamp);
 case {'manchester'}
 b1 = (b == 1);
 b0 = (b == 0);
 if (Nsamp==floor(Nsamp/2)*2)
 if length(b)==1
 b1up = double(upsample(b1,2)');
 b0up_ = upsample(b0,2)';
 else
 b1up = double(upsample(b1,2));
 b0up_ = upsample(b0,2);
 end
 b0up = [0 b0up_(1:length(b0up_)-1)];
 s1 = rectpulse(b1up,Nsamp/2);
 s0 = rectpulse(b0up,Nsamp/2);
 s = 2*(s1 + s0) - 1;
 else
 s1half = kron(b1,ones(ceil(Nsamp/2),1));
 s1full = [s1half; zeros(floor(Nsamp/2),length(b))];
 s1 = s1full(:)';
 s0half = kron(b0,ones(ceil(Nsamp/2),1));
 s0full = [zeros(floor(Nsamp/2),length(b)); s0half];
 s0 = s0full(:)';
 s = 2*(s1 + s0) - 1;
 end
 case {'unipolar_nyquist'}
 t = -10*Nsamp+1:10*Nsamp-1;
 sincfull = sinc(t);
 bup = upsample(b,Nsamp);
 snoncausal = conv(sincfull,bup);
 s = snoncausal;
 %s = snoncausal(Nsamp*10+1:length(snoncausal));
 case {'bipolar_nyquist'}
 bpolar = 2*b - 1;
 t = -10*Nsamp+1:Nsamp*10-1;
 sincfull = sinc(t);
 bpolarup = upsample(bpolar,Nsamp);
 snoncausal = conv(sincfull,bpolarup);
 s = snoncausal;
 %s = snoncausal(Nsamp*10+1:length(snoncausal));
 case {'duobinary'}
 t = -11*Nsamp+1:Nsamp*11-1;
 sincfull = sinc(t);
 duopulse = sincfull(Nsamp+1:Nsamp*21-1)+sincfull(1:Nsamp-1);
 bup = upsample(b,Nsamp);
 snoncausal = conv(duopulse,bup);
 s = snoncausal;
 %s = snoncausal(Nsamp*10+1:length(snoncausal));
end
elseif (nargin == 3)
 if (lower(pulsa) == 'raised_cosine')
 s = rcosflt(b,Fd,Fs,'sqrt',rolloff,delay);
 end
end
