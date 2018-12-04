<?php
// memanggil isi header
require_once ('layout/head.php');
// memanggil isis navbar
require_once ('layout/navbar.php');
?>
<!-- Isi konten dimulai dari sini -->
<main role="main">
  <div class="container-fluid ">
    <!-- Example row of columns -->
    <div class="row ">
      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
        <div class="db-wrapper">
          <div class="db-pricing-seven">
            <ul>
              <li class="price">
                DAFTAR ORGANISASI
              </li>
              <?php
              foreach ($data_organisasi as $home_organisasi) {
               ?>
              <li><?php echo $home_organisasi->nama ?></li>
            <?php } ?>
            </ul>
            <div class="pricing-footer">
              <a class="btn btn-secondary" href="<?php echo base_url('organisasi'); ?>" role="button">Lihat Organisasi &raquo;</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
        <div class="db-wrapper">
          <div class="db-pricing-seven">
            <ul>
              <li class="price">
                DAFTAR KEPANITIAAN
              </li>
              <?php
              foreach ($data_kepanitiaan as $home_kepanitiaan) {
               ?>
              <li><?php echo $home_kepanitiaan->nama ?></li>
            <?php } ?>
            </ul>
            <div class="pricing-footer">
              <a class="btn btn-secondary" href="index.php/kepanitiaan" role="button">Lihat Kepanitiaan &raquo;</a>
            </div>
          </div>
        </div>
      </div>
      <div class="col-xs-12 col-sm-4 col-md-4 col-lg-4">
        <div class="db-wrapper">
          <div class="db-pricing-seven">
            <ul>
              <li class="price">
                DAFTAR EVENT
              </li>
              <?php
              foreach ($data_event as $home_event) {
               ?>
              <li><?php echo $home_event->nama ?></li>
            <?php } ?>
            </ul>
            <div class="pricing-footer">
              <a class="btn btn-secondary" href="index.php/event" role="button">Lihat Event &raquo;</a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div> <!-- /container -->
</main>
<!-- akhir isi konten -->
<?php
// memanggil isi footter
require_once ('layout/footer.php');
?>
