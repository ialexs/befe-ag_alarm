## Sedot Medali

> Mon Aug 20 14:01:48 WIB 2018 - by ialexs

Lucu-lucuan.

Ide dari obrolan di WA Group (Senin/20Ags2-18) ttg hasil medali Indonesia di Asian Games 2018 

## Konsep Gembel

Kalau Indonesia mendapatkan medali, otomatis lagu Indonesia Raya berkumandang di pantry wkwkwkwk :D

## Metode

Deteksi perubahan pada halaman perolehan medali dari website resmi Asian Games

-   URL: httpss://en.asiangames2018.id/medals/noc/INA

Dengan melakukan

-   Secara periodik melakukan _scrapping_ URL (menggunakan <https://www.crummy.com/software/BeautifulSoup/>)
-   Output jadi file \*.txt
-   Bandingkan dengan \*.txt sebelumnya
-   Jika ada perubahan, mainkan Indonesia Raya 30 detik (menggunakan `play` pada server)
