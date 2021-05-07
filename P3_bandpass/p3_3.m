%% P3.3. Deteksi Nonkoheren Sinyal Digital Termodulasi Bandpass

b=[1 0 1 0 0 1 1 0 round(rand(1,12))];
sa=mix_lo(modul(b,'unipolar_nrz'),5000,0);
ya=envelope(sa,3500);

scope(ya,'one-shot',0.02);
title("Gambar 6")

