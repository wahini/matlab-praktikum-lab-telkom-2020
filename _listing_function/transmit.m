function [chnlout] = transmit(b,lc,npsd,bw)
%if nargin < 4 error('Give more input please') end
%if nargin > 4 error('Too many inputs') end
if (nargin == 4)
global Fd Fs;
 Nsamp=Fs/Fd;
 s = modul(b,lower(lc));
 ls = length(s);
 ff = [1:ls];
 fco = floor(bw/Fs*ls); % cutoff freq
 flp = (ff<=fco|ff>=(ls-fco+2)); % low pass filter
 Sf = fftshift(s);
 Sfbl = Sf .* flp;
 sbl = real(ifft(Sfbl));
 chnlout = sbl + sqrt(npsd)*randn(1,ls);
end
