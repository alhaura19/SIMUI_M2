<?php
// memanggil isi header
require_once ('layout/head.php');
// memanggil isis navbar
require_once ('layout/navbar.php');
?>
<!-- Isi konten dimulai dari sini -->
<main role="main">
  <div class="container-fluid">
    <!-- Example row of columns -->
    <div class="row">
      <div class="col-md-4 border pt-4" >
        <h2>Organisasi</h2>
        <p><a class="btn btn-secondary" href="#" role="button">Lihat Organisasi &raquo;</a></p>
      </div>
      <div class="col-md-4 border pt-4">
        <h2>Kepanitiaan</h2>
        <p><a class="btn btn-secondary" href="#" role="button">Lihat Kepanitiaan &raquo;</a></p>
      </div>
      <div class="col-md-4 border pt-4" >
        <h2>Event</h2>
        <p><a class="btn btn-secondary" href="#" role="button">Lihat Event &raquo;</a></p>
      </div>
    </div>
  </div> <!-- /container -->
</main>
<!-- akhir isi konten -->
<?php
// memanggil isi footter
require_once ('layout/footer.php');
?>
