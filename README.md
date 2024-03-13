Ini adalah skrip-skrip shell di android untuk membantu memudahkan alat ffmpeg membagi satu video/mp4 ke beberapa bagian video/mp4 sesuai waktu pada subrip/srt yang diberikan (harus extensi .srt dengan waktu yang sesuai)
tinggal jalankan saja
<pre>
sh ./run-all.sh /full-path/files.srt /full-path/files.mp4
</pre>
....
Untuk tujuan membalik putaran video,
jalankan (harus jalankan run-all.sh dahulu)
<pre>sh ./reverse2All.sh /full-path/files.srt</pre>

Pemutaran video terbalik berguna untuk melewati klaim konten id di youtube.
unggah dahulu konten film ke youtube untuk mengujinya.
jika ditandai merah (diblokir di semua negara). gunakan skrip dari sini.

cara membalik video di sini bukan dari awal sampai akhir video secara penuh (a to z).
cara membalik video secara penuh akan mengacaukan alur adegan pada video.
jadi di sini, kita harus membagi video ke beberapa bagian.
dari bagian itu kita akan balikan pemutarannya/reversing.
setelah semua dibalik, lalu akan digabungkan kembali

perhatikan contoh video youtube di bawah

<a href="https://youtu.be/R_REy9JaPl4">Spiderman 1994 - S01E02</a>
<br/>
jika video diatas langsung diunggah ke youtube, tidak mungkin akan bisa dipublikasikan untuk ditonton.

perangkat kamu harus terinstall ffmpeg android.
untuk pertanyaan hubungi <a href="https://facebook.com/zvryzaqy">zvryzaqy</a>
