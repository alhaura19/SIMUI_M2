<?php
// memanggil isi header
require_once ('layout/head.php');
// memanggil isis navbar
require_once ('layout/navbar.php');
?>
<!-- Isi konten dimulai dari sini -->
<main role="main">
  <div class="container">
    <div class="row">
      <div class="col-md-12 pt-4">
        <?php if (isset($_SESSION['type'])) { ?>
        <a href="#tambah_event" class="btn btn-md btn-success">Tambah Event</a>
        <?php } ?>
        <hr>
        <div class="table-responsive">
          <table id="table" class="table table-sm table-condensed table-bordred table-striped table-hover">
            <thead class="thead-dark">
              <th>Penyelenggara Event</th>
              <th>Nama Event</th>
              <th>Tanggal</th>
              <th>Waktu</th>
              <th>Kapasitas</th>
              <th>Harga Tiket</th>
              <th>Lokasi</th>
              <th>Sifat Event</th>
              <th>Deskripsi Singkat</th>
              <th>Kategori</th>
              <th>Jumlah Pendaftar</th>
              <?php if (isset($_SESSION['type'])) { ?>
              <th>Options</th>
            <?php } ?>
            </thead>
            <tbody>
              <?php
              foreach ($data_event as $hasil_event) {
                ?>
                <tr>
                  <td><?php echo $hasil_event->id_pembuat_event; ?></td>
                  <td><?php echo $hasil_event->nama; ?></td>
                  <td><?php echo $hasil_event->tanggal; ?></td>
                  <td><?php echo $hasil_event->waktu; ?></td>
                  <td><?php echo $hasil_event->kapasitas; ?></td>
                  <td><?php echo $hasil_event->harga_tiket; ?></td>
                  <td><?php echo $hasil_event->lokasi; ?></td>
                  <td><?php echo $hasil_event->sifat_event; ?></td>
                  <td><?php echo $hasil_event->deskripsi_singkat; ?></td>
                  <td><?php echo $hasil_event->nomor_kategori; ?></td>
                  <td><?php echo $hasil_event->jumlah_pendaftar; ?></td>
                  <?php if (isset($_SESSION['type'])) { ?>
                  <td>
                    <a href="<?php echo base_url() ?>c_event/edit/<?php echo $hasil_event->id_event ?>" class="btn btn-sm btn-success">Edit</a>
                    <a href="<?php echo base_url() ?>c_event/hapus/<?php echo $hasil_event->id_event ?>" class="btn btn-sm btn-danger">Hapus</a>
                  </td>
                  <?php  }?>
                </tr>
              <?php } ?>
            </tbody>
          </table>
        </div>
      </div>
    </div>
  </div>
</main>
<!-- Akhir isi konten -->
<?php
// memanggil isi footter
require_once ('layout/footer.php');
?>
