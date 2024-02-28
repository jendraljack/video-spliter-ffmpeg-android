Ini adalah skrip shell di android untuk membantu memudahkan alat ffmpeg membagi satu ke beberapa bagian sesuai waktu pada subrip/srt yang diberikan

tinggal jalankan saja
<pre>
sh ./run-all.sh
</pre>
....
Untuk tujuan membalik putaran video
jalankan (harus jalankan run-all.sh dahulu)
<pre>sh ./reverse2All.sh</pre>

pemutaran video terbalik berguna untuk melewati klaim konten id di youtube.

cara membalik video di sini bukan dari awal sampai akhir video secara penuh.
cara membalik video secara penuh akan mengacaukan alur adegan pada video.
jadi di sini, kita harus membagi video ke beberapa bagian.
dari bagian itu akan dibalikan pemutaran.
lalu akan digabungkan kembali

perhatikan contoh video youtube di bawah

<a href="https://youtu.be/R_REy9JaPl4">Spiderman 1994 - S01E02</a>
<br/>
jika video diatas langsung diunggah ke yout*be, tidak mungkin akan bisa dipublikasikan untuk ditonton.

perangkat kamu harus terinstall ffmpeg android.
