function [mfilt] = matched(pulsa,rs,Fs)
if nargin > 0
s = modul(1,pulsa);
mfilt = flipud(s);
end
