-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 29 Eki 2020, 13:27:14
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
-- Veritabanı: `muberrayilmaz_01`
--
CREATE DATABASE IF NOT EXISTS `muberrayilmaz_01` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `muberrayilmaz_01`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `kNo` int(11) NOT NULL COMMENT 'Kitaba ait olan numara',
  `ISBN` varchar(17) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitaba ait olan ISBN',
  `kAdı` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın adı',
  `kBasYıl` date NOT NULL COMMENT 'Kitabın basım yılı bilgisi',
  `kYayEv` varchar(200) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın yayınevi bilgisi',
  `kYazAd` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabı yazan kişinin adı',
  `kFizÖz` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Kitaba ait olan fiziksel özellikler '
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitaplara ait olan bilgiler';

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`kNo`, `ISBN`, `kAdı`, `kBasYıl`, `kYayEv`, `kYazAd`, `kFizÖz`) VALUES
(1, '978-605-331-619-6', 'Astrolojinin Bilimle İmtihanı Yıldızınız Ne Söylemiyor?', '2019-07-04', 'Destek Yayınları', 'Tevfik Uyar', 'Ciltsiz / 248 sayfa / 13,5 x 21,5'),
(2, '978-605-299-613-3', 'Yaşam 3.0 Yapay Zeka Çağında İnsan Olmak', '2019-02-08', 'Pegasus Yayınları', 'Max Tegmark', NULL),
(3, '978-975-9038-02-1', 'Deliler Boşandı', '1957-05-05', 'Nesin Yayınevi', 'Aziz Nesin', NULL),
(4, '978-605-5755-30-0', 'Outliers (Çizginin Dışındakiler) Bazı İnsanlar Neden Daha Başarılı Olur?', '2020-04-01', 'MediaCat Kitapları', 'Malcolm Gladwell', NULL),
(5, '978-975-14-0296-7', 'İnsan İnsana', '1991-11-10', 'Remzi Kitabevi', 'Doğan Cüceloğlu', NULL),
(6, '978-605-4820-39-9', 'Kadın Yok Savaşın Yüzünde ', '2017-10-08', 'Kafka Yayınevi', 'Svetlana Aleksiyeviç', NULL),
(7, '978-605-5888-58-9', '50 Soruda Yapay Zeka', '2018-10-09', 'Bilim ve Gelecek Kitaplığı', 'Cem Say', 'Karton Kapak / 188 Sayfa'),
(8, '978-605-4820-52-8', 'Çernobil Duası Geleceğin Tarihi', '2017-04-05', 'Kafka Yayınevi', 'Svetlana Aleksiyeviç', NULL),
(9, '978-605-4629-86-2', 'Algernon\'a Çiçekler', '2018-06-05', 'Koridor Yayıncılık', 'Daniel Keyes', NULL),
(10, '978-975-21-2439-4', 'On Küçük Zenci', '2020-01-05', 'Altın Kitaplar', 'Agatha Christie', 'Ciltsiz / 2. Hamur / 224 Sayfa / 13,5x19,5');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayınevi`
--

CREATE TABLE `yayınevi` (
  `yayNo` int(11) NOT NULL COMMENT 'Yayınevine ait olan numara ',
  `yayAd` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yayınevinin adı',
  `yayURL` varchar(80) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Yayınevine ait olan adres'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yayınevine ait olan bilgiler';

--
-- Tablo döküm verisi `yayınevi`
--

INSERT INTO `yayınevi` (`yayNo`, `yayAd`, `yayURL`) VALUES
(1, 'Destek Yayınları ', 'https://destekdukkan.com/anasayfa'),
(2, 'Pegasus Yayınları ', 'http://www.pegasusyayinlari.com/'),
(3, 'Nesin Yayınevi', 'https://www.nesinyayinevi.com/'),
(4, 'MediaCat Kitapları', 'https://mediacat.com/mediacat-kitaplari/'),
(5, 'Remzi Kitabevi', 'http://www.remzi.com.tr/anasayfa'),
(6, 'Kafka Yayınevi', 'https://www.kafkakitap.com/'),
(7, 'Bilim ve Gelecek Kitaplığı', 'https://kitaplik.bilimvegelecek.com.tr/'),
(8, 'Koridor Yayıncılık', 'https://www.koridoryayincilik.com.tr/'),
(9, 'Altın Kitaplar', 'https://www.altinkitaplar.com.tr/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yNo` int(11) NOT NULL COMMENT 'Yazara ait olan numara bilgisi',
  `yAd` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazarın adı',
  `YSoyAd` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazarın soyadı',
  `yURL` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Yazar hakkındaki bilgilere ulaşılabilecek adres'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yazara ait olan bilgiler';

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`yNo`, `yAd`, `YSoyAd`, `yURL`) VALUES
(1, 'Tevfik', 'Uyar', 'https://www.tevfikuyar.com/hakkimda'),
(2, 'Max ', 'Tegmark', 'https://tr.wikipedia.org/wiki/Max_Tegmark'),
(3, 'Aziz', 'Nesin', 'https://tr.wikipedia.org/wiki/Aziz_Nesin'),
(4, 'Malcolm', 'Gladwell', 'https://en.wikipedia.org/wiki/Malcolm_Gladwell'),
(5, 'Doğan', 'Cüceloğlu', 'http://www.dogancuceloglu.net/'),
(6, 'Svetlana', 'Aleksiyeviç', 'https://tr.wikipedia.org/wiki/Svetlana_Aleksiyevi%C3%A7'),
(7, 'Cem', 'Say', 'https://www.cmpe.boun.edu.tr/tr/people/cem.say'),
(8, 'Daniel ', 'Keyes', 'https://kidega.com/yazar/daniel-keyes-107359'),
(9, 'Agatha ', 'Christie', 'https://tr.wikipedia.org/wiki/Agatha_Christie');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kitap`
--
ALTER TABLE `kitap`
  ADD PRIMARY KEY (`kNo`),
  ADD UNIQUE KEY `ISBN` (`ISBN`);

--
-- Tablo için indeksler `yayınevi`
--
ALTER TABLE `yayınevi`
  ADD PRIMARY KEY (`yayNo`),
  ADD UNIQUE KEY `yayURL` (`yayURL`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yNo`),
  ADD UNIQUE KEY `yURL` (`yURL`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `kNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Kitaba ait olan numara', AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `yayınevi`
--
ALTER TABLE `yayınevi`
  MODIFY `yayNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yayınevine ait olan numara ', AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yazara ait olan numara bilgisi', AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
