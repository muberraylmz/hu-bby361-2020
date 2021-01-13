<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");
    
    /* Veritabanı sorgulama */
    $guncel_kitap = mysqli_real_escape_string($baglanti, $_GET["eserKayitNo"]);

$sorgu = mysqli_query($baglanti, "SELECT * FROM kitap WHERE eserKayitNo = $guncel_kitap");
    $satir = mysqli_fetch_assoc($sorgu);
$sorgu2 = mysqli_query($baglanti, "SELECT * FROM yayinevi");
    $satir2 = mysqli_fetch_assoc($sorgu);
$sorgu3 = mysqli_query($baglanti, "SELECT *, CONCAT(yazarAdi, ' ', yazarSoyadi) AS AdSoyad FROM yazar");
    $satir3 = mysqli_fetch_assoc($sorgu);
?>
<!DOCTYPE html>
<html lang="tr"><head><meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
    <meta name="generator" content="Jekyll v3.8.6">
    <title>KATALOG</title>

    <!-- Bootstrap core CSS -->
<link href="bootstrap.min.css" rel="stylesheet">

    <!-- Favicons -->
<link rel="apple-touch-icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/apple-touch-icon.png" sizes="180x180">
<link rel="icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/favicon-32x32.png" sizes="32x32" type="image/png">
<link rel="icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/favicon-16x16.png" sizes="16x16" type="image/png">
<link rel="manifest" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/manifest.json">
<link rel="mask-icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/safari-pinned-tab.svg" color="#563d7c">
<link rel="icon" href="https://getbootstrap.com/docs/4.4/assets/img/favicons/favicon.ico">
<meta name="msapplication-config" content="/docs/4.4/assets/img/favicons/browserconfig.xml">
<meta name="theme-color" content="#563d7c">


    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        -ms-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
    </style>
    <!-- Custom styles for this template -->
    <link href="./katalog_files/navbar-top.css" rel="stylesheet">
  </head>
  <body>
    <nav class="navbar navbar-expand-md navbar-dark bg-dark mb-4">
  <a class="navbar-brand" href="https://getbootstrap.com/docs/4.4/examples/navbar-static/#">Top navbar</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarCollapse" aria-controls="navbarCollapse" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarCollapse">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link" href="index.php">Ana Sayfa </a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="kitap.php">Kitap İşlemleri</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="yazar.php">Yazar İşlemleri</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="yayinevi.php">Yayınevi İşlemleri</a>
      </li>
    </ul>
    <form class="form-inline mt-2 mt-md-0">
      <input class="form-control mr-sm-2" type="text" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0" type="submit">Search</button>
    </form>
  </div>
</nav>

<main role="main" class="container">
<!-- KODLAR -->
<h1>Kitap Güncelle</h1>
<form action="guncel_kitap.php" method="post">
    Eser Adi: <input type="text" name="eserAdi" value="<?php echo $satir["eserAdi"] ;?>"><br><br>
    Eser Kayıt Tarihi: <input type="text" name="eserKayitTarihi" value="<?php echo $satir["eserKayitTarihi"] ;?>"><br><br>
    Eser Basım Yılı: <input type="text" name="eserBasimYili" value="<?php echo $satir["eserBasimYili"] ;?>"><br><br>
    Eser ISBN: <input type="text" name="eserISBN" value="<?php echo $satir["eserISBN"] ;?>"><br><br>
    Eser Açıklama: <input type="text" name="eserAciklama" value="<?php echo $satir["eserAciklama"] ;?>"><br><br>
    Eserin Yayınevi: <select name="yayineviNo" id="yayineviNo">
                    <option value="Yayınevi Bilgisini Güncellemek İçin Seçim Yapınız">Yayınevi Bilgisini Güncellemek İçin Seçim Yapınız</option>
                    <?php while($satir2 = mysqli_fetch_assoc($sorgu2)){?>
                    <option value="<?php echo $satir2['yayineviNo']; ?>"><?php echo $satir2["yayineviAdi"]; ?></option>
                    <?php }?>
                    </select><br><br>
    Eserin Yazarı: <select name="yazarNo" id="yazarNo">
                    <option value="Yazar Bilgisini Güncellemek İçin Seçim Yapınız">Yazar Bilgisini Güncellemek İçin Seçim Yapınız</option>
                    <?php while($satir3 = mysqli_fetch_assoc($sorgu3)){?>
                    <option value="<?php echo $satir3['yazarNo']; ?>"><?php echo $satir3["AdSoyad"]; ?></option>
                    <?php }?>
                    </select><br><br>
    <input type="hidden" value="<?php echo $satir["eserKayitNo"] ;?>" name="eserKayitNo">
    <input type="submit" value="Kitap Güncelle">
</form>
<!-- KODLAR -->   
</main>
<script src="jquery-3.4.1.slim.min.js"></script>
      <script src="bootstrap.bundle.min.js"></script>

</body></html>