-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 01 Ara 2020, 23:32:20
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
-- Veritabanı: `muberrayilmaz_02`
--
CREATE DATABASE IF NOT EXISTS `muberrayilmaz_02` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `muberrayilmaz_02`;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitap`
--

CREATE TABLE `kitap` (
  `kNo` int(11) NOT NULL COMMENT 'Kitaba ait olan numaradır',
  `ISBN` bigint(13) NOT NULL COMMENT 'Kitaba ait olan ISBN',
  `kAdi` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Kitabın adı',
  `kBasYil` year(4) NOT NULL COMMENT 'Kitabın basım yılı bilgisi',
  `kSyfSayi` int(11) NOT NULL COMMENT 'Kitabın toplam sayfa sayısı bilgisi',
  `yayNo` int(11) NOT NULL COMMENT 'Yayın no bilgisi',
  `yazNo` int(11) NOT NULL COMMENT 'Yazara ait olan no bilgisi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Kitaplara ait olan bilgiler ';

--
-- Tablo döküm verisi `kitap`
--

INSERT INTO `kitap` (`kNo`, `ISBN`, `kAdi`, `kBasYil`, `kSyfSayi`, `yayNo`, `yazNo`) VALUES
(1, 9786053143611, 'Havva\'nın Saklı Yüzü-Arap Dünyasında Kadınlar', 2019, 366, 1, 1),
(2, 9786052956588, 'Kalede 1 Başına', 2018, 179, 2, 2),
(3, 9789750720901, 'İvan İlyiçin Ölümü', 2003, 93, 3, 3),
(4, 9786050900286, 'Serenad', 2016, 481, 4, 4),
(5, 9786050914443, 'Kardeşimin Hikayesi', 2013, 324, 4, 4),
(6, 9789754582901, 'Sineklerin Tanrısı', 2006, 261, 2, 6),
(7, 9789750738876, 'Jane Eyre', 2018, 626, 3, 7),
(8, 9789752124394, 'On Küçük Zenci', 2018, 223, 8, 8),
(9, 9789754058789, 'Acı Kahve', 2018, 150, 8, 8),
(10, 9786059702614, 'Köpek Gibi Büyütülmüş Çocuk', 2017, 444, 10, 10),
(11, 9786050939828, 'Huzursuzluk', 2017, 154, 11, 4),
(12, 9786053115557, 'Safsatalar', 2019, 256, 12, 12),
(13, 9786053116196, 'Astrolojinin Bilimle İmtihanı', 2019, 248, 12, 12),
(14, 9786052980811, 'Körlük', 2017, 331, 14, 14),
(15, 9786055888589, '50 Soruda Yapay Zeka', 2018, 184, 15, 15);

-- --------------------------------------------------------

--
-- Görünüm yapısı durumu `kitapbilgileri`
-- (Asıl görünüm için aşağıya bakın)
--
CREATE TABLE `kitapbilgileri` (
`kAdi` varchar(80)
,`yayAdi` varchar(80)
,`AdSoyad` mediumtext
);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayinevi`
--

CREATE TABLE `yayinevi` (
  `yayNo` int(11) NOT NULL COMMENT 'Yayınevine ait olan numara',
  `yayAdi` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yayınevinin adı',
  `yayURL` varchar(100) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yayınevine ait olan URL bilgisi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yayınevine ait olan bilgiler';

--
-- Tablo döküm verisi `yayinevi`
--

INSERT INTO `yayinevi` (`yayNo`, `yayAdi`, `yayURL`) VALUES
(1, 'Ayrıntı Yayınları', 'https://www.ayrintiyayinlari.com.tr/'),
(2, 'İş Bankası Kültür Yayınları', 'https://www.iskultur.com.tr/'),
(3, 'Can Yayınları', 'https://canyayinlari.com/'),
(4, 'Doğan Kitap', 'https://www.dogankitap.com.tr/anasayfa'),
(8, 'Altın Kitaplar', 'https://www.altinkitaplar.com.tr/'),
(10, 'Koridor Yayıncılık', 'https://www.koridoryayincilik.com.tr/'),
(11, 'Doğan Kitap', 'https://www.dogankitap.com.tr/anasayfa'),
(12, 'Destek Yayınları', 'https://destekdukkan.com/anasayfa'),
(14, 'Kırmızı Kedi', 'https://www.kirmizikedi.com/'),
(15, 'Bilim ve Gelecek', 'https://bilimvegelecek.com.tr/');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazar`
--

CREATE TABLE `yazar` (
  `yazNo` int(11) NOT NULL COMMENT 'Yazara ait olan numara',
  `yazAd` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazarın adı ',
  `yazSoyAd` text COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazarın soyadı',
  `yazURL` varchar(80) COLLATE utf8_unicode_ci NOT NULL COMMENT 'Yazara ait olan URL bilgisi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Yazara ait olan bilgiler';

--
-- Tablo döküm verisi `yazar`
--

INSERT INTO `yazar` (`yazNo`, `yazAd`, `yazSoyAd`, `yazURL`) VALUES
(1, 'Neval ', 'Es-Sadevi', 'https://www.dr.com.tr/Yazar/neval-es-sadevi/s=10087231'),
(2, 'Sunay ', 'Akın', 'https://tr.wikipedia.org/wiki/Sunay_Ak%C4%B1n'),
(3, 'Lev Nikolayeviç ', 'Tolstoy', 'https://tr.wikipedia.org/wiki/Lev_Tolstoy'),
(4, 'Zülfü', 'Livaneli', 'https://tr.wikipedia.org/wiki/Z%C3%BClf%C3%BC_Livaneli'),
(6, 'William ', 'Golding', 'https://tr.wikipedia.org/wiki/William_Golding'),
(7, 'Charlotte ', 'Bronte', 'https://tr.wikipedia.org/wiki/Charlotte_Bront%C3%AB'),
(8, 'Agatha ', 'Christie', 'https://tr.wikipedia.org/wiki/Agatha_Christie'),
(10, 'Maia ', 'Szalavitz', 'https://en.wikipedia.org/wiki/Maia_Szalavitz'),
(12, 'Tevfik ', 'Uyar', 'https://www.tevfikuyar.com/hakkimda'),
(14, 'Jose ', 'Saramago', 'https://tr.wikipedia.org/wiki/Jos%C3%A9_Saramago'),
(15, 'Cem ', 'Say', 'https://www.cmpe.boun.edu.tr/tr/people/cem.say');

-- --------------------------------------------------------

--
-- Görünüm yapısı `kitapbilgileri`
--
DROP TABLE IF EXISTS `kitapbilgileri`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `kitapbilgileri`  AS  select `k`.`kAdi` AS `kAdi`,`y`.`yayAdi` AS `yayAdi`,concat(`yz`.`yazAd`,' ',`yz`.`yazSoyAd`) AS `AdSoyad` from ((`kitap` `k` join `yayinevi` `y`) join `yazar` `yz`) where `k`.`yayNo` = `y`.`yayNo` and `k`.`yazNo` = `yz`.`yazNo` ;

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
-- Tablo için indeksler `yayinevi`
--
ALTER TABLE `yayinevi`
  ADD PRIMARY KEY (`yayNo`);

--
-- Tablo için indeksler `yazar`
--
ALTER TABLE `yazar`
  ADD PRIMARY KEY (`yazNo`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kitap`
--
ALTER TABLE `kitap`
  MODIFY `kNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Kitaba ait olan numaradır', AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `yayinevi`
--
ALTER TABLE `yayinevi`
  MODIFY `yayNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yayınevine ait olan numara', AUTO_INCREMENT=16;

--
-- Tablo için AUTO_INCREMENT değeri `yazar`
--
ALTER TABLE `yazar`
  MODIFY `yazNo` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Yazara ait olan numara', AUTO_INCREMENT=16;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
