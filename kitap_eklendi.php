<?php
    /* Bağlantı bilgilerinin alınması*/
    require_once("baglanti.php");

    /* Ekleme işlemi sorgusu */
    $eserAdi =       mysqli_real_escape_string($baglanti, $_POST['eserAdi']);
    $eserBasimYili = mysqli_real_escape_string($baglanti, $_POST['eserBasimYili']);
    $eserISBN =      mysqli_real_escape_string($baglanti, $_POST['eserISBN']);
    $eserAciklama =  mysqli_real_escape_string($baglanti, $_POST['eserAciklama']);
    $yayineviAdi =    mysqli_real_escape_string($baglanti, $_POST['yayinevi']);
    $AdSoyad =       mysqli_real_escape_string($baglanti, $_POST['yazar']);
    $sorgu = "INSERT INTO kitap (eserAdi, eserBasimYili, eserISBN, eserAciklama, yayineviNo, yazarNo)
            VALUES ('$eserAdi', '$eserBasimYili', '$eserISBN', '$eserAciklama', '$yayineviAdi', '$AdSoyad')";

    if (mysqli_query($baglanti, $sorgu)) {
        $islemSonuc = "Yeni Kayıt Başarıyla Oluşturuldu.";
    } else {
        $islemSonuc = "Hata: " . $sorgu . "<br>" . mysqli_error($baglanti);
    }
    $sorgu2 = mysqli_query($baglanti, "SELECT K.eserKayitNo, K.eserAdi, K.eserKayitTarihi, K.eserBasimYili, K.eserISBN,                                                  k.eserAciklama, Y.yayineviAdi, CONCAT (YZ.yazarAdi, ' ', YZ.yazarSoyadi) AS AdSoyad
                                       FROM kitap K, yayinevi Y, yazar YZ
                                       WHERE K.yayineviNo = Y.yayineviNo AND K.yazarNo = YZ.yazarNo");

    mysqli_close($baglanti);

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
<h1>Kitap İşlem Sonucu</h1>
<p><?php echo $islemSonuc; ?></p>
<p><a href="kitap_ekle.php">Yeni Kitap Ekle</a></p>
<?php
echo("<table border=1 width=80%>");
    echo("<tr>");
    echo("<td><b>Eser Kayıt No</b></td>");
    echo("<td><b>Eser Adı</b></td>");
    echo("<td><b>Eser Kayıt Tarihi</b></td>");
    echo("<td><b>Eser Basım Yılı</b></td>");
    echo("<td><b>Eser ISBN</b></td>");
    echo("<td><b>Eser Açıklama</b></td>");
    echo("<td><b>Eserin Yayınevi</b></td>");
    echo("<td><b>Eserin Yazarı</b></td>");
    echo("<td><b>Güncelle</b></td>");
    echo("<td><b>Sil</b></td>");
    echo("</tr>");
/* Sorgu sonuçlarının yazdırılması */
while($satir = mysqli_fetch_assoc($sorgu2)){
    echo("<tr>");
    echo("<td>".$satir["eserKayitNo"]."</td>");
    echo("<td>".$satir["eserAdi"]."</td>");
    echo("<td>".$satir["eserKayitTarihi"]."</td>");
    echo("<td>".$satir["eserBasimYili"]."</td>");
    echo("<td>".$satir["eserISBN"]."</td>");
    echo("<td>".$satir["eserAciklama"]."</td>");
    echo("<td>".$satir["yayineviAdi"]."</td>");
    echo("<td>".$satir["AdSoyad"]."</td>");
    echo("<td><a href='guncel_kitap.php?eserKayitNo=".$satir["eserKayitNo"]."'>Güncelle</a></td>");
    echo("<td><a href='sil_kitap.php?eserKayitNo=".$satir["eserKayitNo"]."'>Sil</a></td>");
    echo("</tr>");
            }
echo("</table>");
?>
<!-- KODLAR -->   
</main>
<script src="jquery-3.4.1.slim.min.js"></script>
      <script src="bootstrap.bundle.min.js"></script>

</body></html>