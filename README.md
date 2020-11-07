![banner](https://github.com/vitoatmo/matlab-praktikum-lab-telkom-2020/blob/main/img/banner-lab-telkom.png)

# MK Lab Telekomunikasi 2020 
 Dokumentasi ini digunakan untuk melampirkan seluruh kegiatan praktikum  
 Praktikum menggunakan MATLAB sebagai simulasi :computer:
 
  documented by: **Bhadrika E.A. 0711740000120**

## :book: Daftar Praktikum 
1. [Praktikum 1 Baseband](https://github.com/vitoatmo/matlab-praktikum-lab-telkom-2020/tree/main/P1_baseband)
2. [Praktikum 2 Deteksi](https://github.com/vitoatmo/matlab-praktikum-lab-telkom-2020/tree/main/P2_deteksi)
3. [Praktikum 3 -on going-](https://github.com/vitoatmo/matlab-praktikum-lab-telkom-2020/tree/main)
4. [Praktikum 4 -on going-](https://github.com/vitoatmo/matlab-praktikum-lab-telkom-2020/tree/main)

## :computer: Toolbox 
toolbox yang dibutuhkan agar bisa dijalankan
1. [Digital Communication Toolbox](https://www.mathworks.com/solutions/dsp.html?s_tid=srchtitle)
2. [Signal Processing Toolbox](https://www.mathworks.com/products/signal.html?s_tid=srchtitle)
3. [Communication Toolbox](https://www.mathworks.com/products/communications.html)

## :computer: menggunakan MATLAB v2020b 
:arrow_right: jika menggunakan MATLAB v2014 dan kebawah, abaikan step ini
1. tidak support `psd.m` karena di :open_file_folder: toolbox matlab menghapus fungsi tersebut. 
   - bisa menggunakan `pwelch` atau 
   - atau ganti dengan [`psd2014.m`](https://github.com/vitoatmo/matlab-praktikum-lab-telkom-2020/blob/main/_listing_function/psd2014.m) di `psd.m` mu di :open_file_folder: `MATLAB\R2020b\toolbox\signal\signal`
   - beri komentar atau `%` untuk warning, karena warning menghentikan program disitu
2. pastikan direktor `psd.m` di MATLAB sudah benar dan nama tetap `psd.m` agar fungsi tetap berjalan
3. :beginner:[`tutorial mengganti`](https://youtu.be/vmDp2jOB13U)

## :warning: Kendala Praktikum
- **Praktikum 1** butuh `psd` jika bisa `pwelch` silakan dicoba
- **Praktikum 2** Percobaan 3 `transmit` tidak tersedia argument untuk `delay` maupun `roll-off` 
- **Praktikum 2** Percobaan 4 `duodetect` belum tersedia 

## :octocat: Contact me
- :e-mail: bhadrika.17071@mhs.its.ac.id
- :e-mail: vito.atmo@gmail.com
- :discord: ventus#1293
