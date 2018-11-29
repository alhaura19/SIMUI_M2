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
          <button class="btn btn-md btn-success" type="button" name="tambah_event" data-toggle="modal" data-target="#tambah_event">Tambah Event</button>
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
                      <button class="btn btn-md btn-primary" type="button" name="edit_event" data-toggle="modal" data-target="#edit_event">Edit</button>
                      <button class="btn btn-md btn-danger" type="button" name="delete_event" data-toggle="modal" data-target="#delete_event">Hapus</button>
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
<!-- awal isi modal -->
<div class="modal fade" id="tambah_event" tabindex="-1" role="dialog" aria-labelledby="tambah_event" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="tambah_event">Tambah Data Event</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <label for="nama" class="col-form-label">Nama Event:</label>
            <input type="text" class="form-control" id="nama_event">
          </div>
          <div class="form-group">
            <label for="organisasi">Organisasi :</label>
            <?php
            $dd_organisasi_attribute = 'class="form-control select2"';
            echo form_dropdown('organisasi', $dd_organisasi, $organisasi_selected, $dd_organisasi_attribute);
            ?>
          </div>
          <div class="form-group">
            <label for="kepanitiaan">Kepanitiaan :</label>
            <?php
            $dd_kepanitiaan_attribute = 'class="form-control select2"';
            echo form_dropdown('kepanitiaan', $dd_kepanitiaan, $kepanitiaan_selected, $dd_kepanitiaan_attribute);
            ?>
          </div>
          <div class="form-group">
            <label for="tanggal">Tanggal :</label>
            <input data-date-format="dd/mm/yyyy" class="form-control" id='datepicker'/>
          </div>
          <div class="form-group">
            <label for="waktu">Waktu :</label>
            <div class='input-group date' id='datetimepicker3'>
              <input type='text' class="form-control" />
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-time"></span>
              </span>
            </div>
          </div>
          <script type="text/javascript">
          $(function () {
            $('#datetimepicker3').datetimepicker({
              format: 'LT'
            });
          });
          </script>
          <div class="form-group">
            <label for="kapasitas">Kapasitas :</label>
            <input class="form-control" id="kapasitas"></input>
          </div>
          <div class="form-group">
            <label for="harga_tiket">Harga Tiket :</label>
            <input class="form-control" id="harga_tiket"></input>
          </div>
          <div class="form-group">
            <label for="lokasi">Lokasi :</label>
            <input class="form-control" id="lokasi"></input>
          </div>
          <div class="form-group">
            <label for="sifat_event">Sifat Event : </label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="sifat_event" id="umum" value="umum">
              <label class="form-check-label" for="umum">Umum</label>
            </div>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="sifat_event" id="private" value="private">
              <label class="form-check-label" for="private">Private</label>
            </div>
          </div>
          <div class="form-group">
            <label for="kategori_event">Kategori Event :</label>
            <?php
            $dd_kategori_attribute = 'class="form-control select2"';
            echo form_dropdown('kategori', $dd_kategori, $kategori_selected, $dd_kategori_attribute);
            ?>
          </div>
          <div class="form-group">
            <label for="deskripsi_singkat">Deskripsi :</label>
            <textarea name="deskripsi_singkat" id="deskripsi_singkat" rows="4" cols="45"></textarea>
          </div>
          <div class="form-group">
            <label for="poster">Poster :</label>
            <input type="file" class="form-control-file" id="poster">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <div class="form-group">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Tambah Event</button>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- akhir isi modal -->
<!-- Akhir isi konten -->
<?php
// memanggil isi footter
require_once ('layout/footer.php');
?>
