## Sedot Medali

> Mon Aug 20 14:01:48 WIB 2018 - by ialexs

![](./mascot.png)
## Lucu-lucuan.

Ide dari obrolan di WA Group (Senin/20Ags2-18) ttg hasil medali Indonesia di Asian Games 2018

Basic proof-of-concept


## Konbel - Konsep Gembel

Kalau Indonesia mendapatkan medali, otomatis lagu Indonesia Raya berkumandang di kantor :D :D


~~~~~\o/ ~~~\o/

## Mebel - Metode Gembel

Deteksi perubahan pada halaman perolehan medali dari website resmi Asian Games

-   URL: <https://en.asiangames2018.id/medals/noc/INA>

By:

-   Secara periodik (via 'crontab') melakukan _scrapping_ URL 
(using BeautifulSoup <https://www.crummy.com/software/BeautifulSoup/>) _baru tau BeautifulSoup hari ini :D :D_
-   Output jadi file \*.dat
-   Bandingkan dengan \*.dat sebelumnya
-   Jika ada perubahan, mainkan Indonesia Raya 30 detik 
(using `play` Notes: `play` is from SoX <http://sox.sourceforge.net/>)

> end

