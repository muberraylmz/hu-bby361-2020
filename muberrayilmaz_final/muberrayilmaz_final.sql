-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 13 Oca 2021, 10:24:23
-- Sunucu sürümü: 10.4.14-MariaDB
-- PHP Sürümü: 7.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `muberrayilmaz_final`
--
CREATE DATABASE IF NOT EXISTS `muberrayilmaz_final` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `muberrayilmaz_final`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `eserKayitNo` int(11) NOT NULL COMMENT 'Eserin kayıt numarası',
  `eserKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Eserin kayıt tarihi',
  `eserAdi` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Eserin adı',
  `eserBasimYili` year(4) NOT NULL COMMENT 'Eserin basım yılı',
  `eserISBN` bigint(11) NOT NULL COMMENT 'Esere ait olan ISBN',
  `yazarNo` int(11) NOT NULL COMMENT 'Eser yazarının numarası',
  `yayineviNo` int(11) NOT NULL COMMENT 'Eser yayınevinin numarası',
  `eserAciklama` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Eserin açıklaması'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitaplarla ilgili olan bilgiler ';

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`eserKayitNo`, `eserKayitTarihi`, `eserAdi`, `eserBasimYili`, `eserISBN`, `yazarNo`, `yayineviNo`, `eserAciklama`) VALUES
(81, '2021-01-08 12:33:21', 'Kozmos: Yeni Dünyalar', 2020, 9786052426593, 41, 42, 'Kozmos: Yeni Dünyalar, Carl Sagan ve Ann Druyan’ın birlikte başladıkları destanın heyecan verici yeni halkasıdır. Druyan’ın Emmy ve Peabody ödüllü Kozmos: Bir Uzay Serüveni adlı belgeseli, 181 ülkede gösterilmiş küresel bir fenomendir. Druyan şimdi de Yeni Dünyalar’la sizi, 14 milyar yıllık kozmik evrimin ve doğanın en mahrem girintilerine sürükleneceğiniz bu çarpıcı maceraya davet ediyor.'),
(84, '2021-01-08 15:14:35', 'Körlük - Kitap Güncelleme Deneme', 2017, 9786052980811, 39, 40, 'Distopik eserlere ilgi duyanların elinden düşürmediği Körlük, yayınlandığı günden bu yana adından söz ettirmeye devam ediyor. Portekiz’li yazar José Saramago’ya 1998’de Nobel Edebiyat Ödülü’nü kazandıran eser, konusuyla olduğu kadar zekice kurgulanmış karakterleriyle de dikkat çekiyor. Dönemin liberal demokrasi anlayışına bir eleştiri mahiyetinde kaleme alınan roman, insanların gittikçe bencilleşip olaylar karşısında duyarsızlaşmasını bir körlük metaforu etrafında işliyor.'),
(85, '2021-01-08 15:31:59', 'Dönüşüm Zamanı | Kitap Güncelleme Denemesi', 2020, 9786057605306, 43, 44, 'Başkalarına ilham ve cesaret verme yeteneği olan ruh terapisti Diana Cooper, Dönüşüm Zamanı’nda ruhumuzu bir amaca nasıl yönelteceğimizi gösteriyor. Kendimizi dönüştürmek için hayatımızda, düşünme ve yaşama şeklimizde ne değişiklikler yapacağımızı adım adım anlatıyor.'),
(86, '2021-01-12 15:58:10', 'Safsatalar', 2019, 9786053115557, 44, 46, 'Tıpkı her sabah aynaya baktığımızda derinleşen çizgilerimizi fark edemediğimiz gibi, dünyanın gidişatını da her günü bir öncekiyle karşılaştırarak tahlil etmek kolay olmuyor. Gündemi takip ederken, haber okurken, internette gezinirken çoğu zaman içimizde tarifi zor bir duygu oluşuyor.'),
(87, '2021-01-12 16:00:33', 'Sarmal | Kitap güncelleme deneme', 2020, 9786052986134, 42, 45, '1950’li yıllardan itibaren önce ABD destekli sonra Suudi Arabistan sermayesinin katkılarıyla bir “Siyasal İslam” organizasyonu kuruldu.  Bu örgüt/organizasyon gelişti, büyüdü, çeşitli kollarıyla ağ gibi ülkemizi sarmaladı. Kadrolar yetiştirdi, kurumlara sızdı, bürokrasiye yerleşti, parça parça devleti ele geçirdi ve en sonunda “tam iktidar” oldu. Uzun yıllardır da Türkiye Cumhuriyeti devletini yönetiyor.');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayinevi`
--

CREATE TABLE `yayinevi` (
  `yayineviNo` int(11) NOT NULL COMMENT 'Yayınevinin kayıt nuamarası',
  `yayineviKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Yayınevinin kayıt tarihi',
  `yayineviAdi` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yayınevinin adı',
  `yayineviURL` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yayınevinin URL bilgisi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yayıneviyle ilgili bilgilerin bulunduğu tablo';

--
-- Tablo döküm verisi `yayinevi`
--

INSERT INTO `yayinevi` (`yayineviNo`, `yayineviKayitTarihi`, `yayineviAdi`, `yayineviURL`) VALUES
(1, '2020-12-25 21:52:45', 'Destek Yayınları _ Güncelleme denemesi', 'https://destekdukkan.com/anasayfa'),
(3, '2020-12-24 00:17:53', 'Yapı Kredi Yayınları', 'https://www.yapikrediyayinlari.com.tr/'),
(4, '2020-12-25 21:53:24', 'İş Bankası Kültür Yayınları >> Güncelleme denemesi', 'https://www.iskultur.com.tr/'),
(5, '2021-01-07 23:33:48', 'Altın Kitaplar > G', 'https://www.altinkitaplar.com.tr/'),
(6, '2020-12-24 23:56:37', 'Sel Yayıncılık | Deneme ', 'https://www.selyayincilik.com/'),
(30, '2020-12-28 20:22:57', 'Ekleme Deneme', 'https://twitter.com/ylmz_muberra'),
(31, '2020-12-28 20:23:43', 'Power BI | Güncelle Deneme', 'https://twitter.com/notifications'),
(37, '2021-01-08 12:29:49', 'CAN YAYINLARI _ Güncelleme denemesi', 'https://www.kitapyurdu.com/yayinevi/can-yayinlari/30.html'),
(38, '2021-01-01 14:08:45', 'İTHAKİ YAYINLARI', 'https://www.kitapyurdu.com/yayinevi/ithaki-yayinlari/67.html'),
(39, '2021-01-01 15:01:38', 'PAN YAYINCILIK', 'https://www.kitapyurdu.com/yayinevi/pan-yayincilik/90.html'),
(40, '2021-01-12 15:58:33', 'Doğan Kitap | Yayınevi Güncelleme Denemesi', 'https://www.dr.com.tr/Yayinevi/dogan-kitap/s=2744'),
(41, '2021-01-07 23:45:43', 'Turkuvaz Kitap', 'https://www.dr.com.tr/Yayinevi/turkuvaz-kitap/s=26386'),
(42, '2021-01-08 14:48:37', 'Beta Kids / Güncelleme Deneme ', 'https://www.dr.com.tr/Yayinevi/beta-kids/s=1408'),
(43, '2021-01-08 14:47:52', 'Othello', 'https://www.dr.com.tr/Yayinevi/othello/s=10004710'),
(44, '2021-01-08 15:28:48', 'Maya Kitap > Güncelleme Link Denemesi', 'https://www.dr.com.tr/Yayinevi/maya-kitap/s=6378'),
(45, '2021-01-12 15:56:10', 'Kolektif Kitap', 'https://www.dr.com.tr/Yayinevi/kolektif-kitap/s=5699'),
(46, '2021-01-12 15:57:03', 'Destek Yayınları', 'https://www.dr.com.tr/Yayinevi/destek-yayinlari/s=2561');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yazarNo` int(11) NOT NULL COMMENT 'Yazarın kayıt nuamarası',
  `yazarKayitTarihi` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Yazarın kayıt tarihi',
  `yazarAdi` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazarın adı',
  `yazarSoyadi` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazarın soyadı',
  `yazarURL` varchar(150) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazarın URL bilgisi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yazarlarla ilgili bilgilerin bulunduğu tablo';

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`yazarNo`, `yazarKayitTarihi`, `yazarAdi`, `yazarSoyadi`, `yazarURL`) VALUES
(5, '2020-12-24 22:44:05', 'Fyodor Mihayloviç | Deneme', 'Dostoyevski', 'https://tr.wikipedia.org/wiki/Fyodor_Dostoyevski'),
(6, '2020-12-24 00:23:29', 'Agatha', 'Christie', 'https://tr.wikipedia.org/wiki/Agatha_Christie'),
(7, '2021-01-12 15:59:00', 'Ferit | Yazar Güncelleme Denemesi', 'Edgü', 'https://tr.wikipedia.org/wiki/Ferit_Edg%C3%BC'),
(28, '2020-12-28 20:25:08', 'Yazar Ekleme Deneme', 'İnan', 'https://twitter.com/messages'),
(31, '2021-01-08 12:31:56', 'Tevfik _ Güncelleme Denemesi', 'Uyar', 'https://www.tevfikuyar.com/hakkimda'),
(33, '2020-12-28 21:45:05', 'Münevver >> Güncelleme denemesi', 'Bektaş', 'https://twitter.com/home?lang=tr'),
(34, '2020-12-30 11:23:35', ' Victor ', 'E. Frankl', 'https://kidega.com/yazar/viktor-frankl-169892'),
(35, '2021-01-07 23:33:59', 'Michael > G', 'Ende', 'https://www.kitapyurdu.com/yazar/michael-ende/10940.html'),
(36, '2021-01-01 13:18:19', 'Yusuf ', 'Atılgan', 'https://www.kitapyurdu.com/yazar/yusuf-atilgan/6322.html'),
(37, '2021-01-01 14:09:08', 'Madeline ', 'Miller ', 'https://www.kitapyurdu.com/yazar/madeline-miller/162219.html'),
(38, '2021-01-01 15:02:06', 'Jostein ', 'Gaarder ', 'https://www.kitapyurdu.com/yazar/jostein-gaarder/7795.html'),
(40, '2021-01-07 23:46:17', 'Sosuke ', 'Natsukawa', 'https://www.dr.com.tr/Yazar/sosuke-natsukawa/s=10101715'),
(41, '2021-01-08 12:30:52', 'Ann ', 'Druyan', 'https://www.dr.com.tr/Yazar/ann-druyan/s=260727'),
(42, '2021-01-08 14:50:02', 'Mark ', 'Boyle', 'https://www.dr.com.tr/yazarlar'),
(43, '2021-01-08 15:30:56', 'Diana | Güncelleme Link Denemesi', 'Cooper', 'https://www.dr.com.tr/Yazar/diana-cooper/s=218988'),
(44, '2021-01-12 15:57:33', 'Tevfik ', 'Uyar', 'https://www.dr.com.tr/Yazar/tevfik-uyar/s=9423');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`eserKayitNo`),
  ADD UNIQUE KEY `eserISBN` (`eserISBN`);

--
-- Tablo için indeksler `yayinevi`
--
ALTER TABLE `yayinevi`
  ADD PRIMARY KEY (`yayineviNo`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yazarNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `eserKayitNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Eserin kayıt numarası', AUTO_INCREMENT=88;

--
-- Tablo için AUTO_INCREMENT değeri `yayinevi`
--
ALTER TABLE `yayinevi`
  MODIFY `yayineviNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yayınevinin kayıt nuamarası', AUTO_INCREMENT=47;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yazarNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yazarın kayıt nuamarası', AUTO_INCREMENT=45;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
