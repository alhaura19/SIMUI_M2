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
              <th>Poster</th>
              <?php if (isset($_SESSION['type'])) { ?>
                <th>Options</th>
              <?php } ?>
            </thead>
            <tbody>
              <?php
              foreach ($data_event as $hasil_event) {
                ?>
                <tr>
                  <td><?php echo $hasil_event->nama_or; ?></td>
                  <td><?php echo $hasil_event->nama; ?></td>
                  <td><?php echo $hasil_event->tanggal; ?></td>
                  <td><?php echo $hasil_event->waktu; ?></td>
                  <td><?php echo $hasil_event->kapasitas; ?></td>
                  <td><?php echo $hasil_event->harga_tiket; ?></td>
                  <td><?php echo $hasil_event->lokasi; ?></td>
                  <td><?php echo $hasil_event->sifat_event; ?></td>
                  <td><?php echo $hasil_event->deskripsi_singkat; ?></td>
                  <td><?php echo $hasil_event->nama_kategori; ?></td>
                  <td><?php echo $hasil_event->jumlah_pendaftar; ?></td>
                  <td><img class="img-thumbnail" src="<?php echo base_url('uploads/poster/'.$hasil_event->poster); ?>" alt=""></td>
                  <?php if (isset($_SESSION['type'])) { ?>
                    <td>
                      <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#edit_event<?=$hasil_event->id_event?>">Edit</button>
                      <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#modalsDelete<?=$hasil_event->id_event?>">Hapus</button>
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
        <h5 class="modal-title" id="Label_tambah_event">Tambah Data Event</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form enctype="multipart/form-data" action="<?php echo base_url('event/tambah_event') ?>" method="post">
          <div class="form-group">
            <label for="nama_event" class="col-form-label">Nama Event:</label>
            <input type="text" class="form-control" name="nama_event" required>
          </div>
          <div class="form-group">
            <label for="organisasi">Organisasi :</label>
            <select class="form-control select2" name="organisasi" id="organisasi" required>
              <option selected value="kosong">Pilih Organisasi Penyelenggara Event</option>
              <?php foreach ($dd_organisasi as $opsi_organisasi):?>
                <option value="<?=$opsi_organisasi->id?>"><?=$opsi_organisasi->nama?></option>
              <?php endforeach;?>
            </select>
          </div>
          <div class="form-group">
            <label for="kepanitiaan">Kepanitiaan :</label>
            <select class="form-control select2" name="organisasi" id="organisasi" required>
              <option selected value="kosong">Pilih Kepanitiaan Event</option>
              <?php foreach ($dd_kepanitiaan as $opsi_kepanitiaan):?>
                <option value="<?=$opsi_kepanitiaan->id?>"><?=$opsi_kepanitiaan->nama?></option>
              <?php endforeach;?>
            </select>
          </div>
          <div class="form-group">
            <label for="tanggal">Tanggal :</label>
            <input type="date" data-date-format="YYYY/MM/DD" class="form-control" name="tanggal" id='tanggal1' required/>
          </div>
          <div class="form-group">
            <label for="waktu">Waktu :</label>
            <div class='input-group date' >
              <input type='time' class="form-control" name="waktu" id='waktu' required/>
              <span class="input-group-addon">
                <span class="glyphicon glyphicon-time"></span>
              </span>
            </div>
          </div>
          <div class="form-group">
            <label for="kapasitas">Kapasitas :</label>
            <input type="number" class="form-control" name="kapasitas" required></input>
          </div>
          <div class="form-group">
            <label for="harga_tiket">Harga Tiket :</label>
            <input type="number" class="form-control" name="harga_tiket" value="0"></input>
          </div>
          <div class="form-group">
            <label for="lokasi">Lokasi :</label>
            <input type="text" class="form-control" name="lokasi" required></input>
          </div>
          <div class="form-group">
            <label for="sifat_event">Sifat Event : </label>
            <div class="form-check form-check-inline">
              <input class="form-check-input" type="radio" name="sifat_event" id="umum" value="umum" checked>
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
            <textarea name="deskripsi_singkat"  rows="4" cols="45" required></textarea>
          </div>
          <div class="form-group">
            <label for="poster">Poster :</label>
            <input type="file" class="form-control-file" name="poster" required>
          </div>
        </div>
        <div class="modal-footer">
          <div class="form-group">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            <button type="submit" class="btn btn-primary">Tambah Event</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</div>
<!-- Akhir modals tambah_event -->
<!-- awal modals edit_event -->
<?php foreach ($data_event as $hasil_event):?>
  <div class="modal fade" id="edit_event<?=$hasil_event->id_event?>" tabindex="-1" role="dialog" aria-labelledby="edit_event" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="labelEditEvent<?=$hasil_event->id_event?>">Edit Data Event</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form enctype="multipart/form-data" action="<?php echo site_url('event/edit_event') ?>" method="post">
            <input type="hidden" readonly value="<?=$hasil_event->id_event;?>" name="id_event" class="form-control">
            <div class="form-group">
              <label for="nama_event" class="col-form-label">Nama Event:</label>
              <input type="text" class="form-control" name="nama_event" value="<?=$hasil_event->nama;?>">
            </div>
            <div class="form-group">
              <label for="organisasi">Organisasi :</label>
              <select class="form-control select2" name="organisasi" id="organisasi">
                <option selected value="<?=$hasil_event->id_pembuat_event?>"><?=$hasil_event->nama_or?></option>
                <?php foreach ($dd_organisasi as $opsi_organisasi):?>
                  <option value="<?=$opsi_organisasi->id?>"><?=$opsi_organisasi->nama?></option>
                <?php endforeach;?>
              </select>
            </div>
            <div class="form-group">
              <label for="kepanitiaan">Kepanitiaan :</label>
              <input type="text" name="kepanitiaan" disabled value="-">
            </div>
            <div class="form-group">
              <label for="tanggal">Tanggal :</label>
              <input class="form-control" type="date" data-date-format="YYYY/MM/DD" id='tanggal1' name="tanggal" value="<?=$hasil_event->tanggal;?>">
            </div>
            <div class="form-group">
              <label for="waktu">Waktu :</label>
              <div class='input-group date' >
                <input type='time' class="form-control" id='waktu' name="waktu" value="<?=$hasil_event->waktu;?>">
              </div>
            </div>
            <div class="form-group">
              <label for="kapasitas">Kapasitas :</label>
              <input type="number" class="form-control" name="kapasitas" value="<?=$hasil_event->kapasitas;?>"></input>
            </div>
            <div class="form-group">
              <label for="harga_tiket">Harga Tiket :</label>
              <input type="number" class="form-control" name="harga_tiket" value="<?=$hasil_event->harga_tiket;?>"></input>
            </div>
            <div class="form-group">
              <label for="lokasi">Lokasi :</label>
              <input type="text" class="form-control" name="lokasi" value="<?=$hasil_event->lokasi;?>"></input>
            </div>
            <div class="form-group">
              <label for="sifat_event">Sifat Event : </label>
              <input type="text" name="sifat_event" value="<?=$hasil_event->sifat_event;?>">
            </div>
            <div class="form-group">
              <label for="kategori_event">Kategori Event :</label>
              <?php
              $dd_kategori_attribute = 'class="form-control select2"';
              echo form_dropdown('kategori', $dd_kategori, $kategori_selected = $hasil_event->nomor_kategori, $dd_kategori_attribute);
              ?>
            </div>
            <div class="form-group">
              <label for="deskripsi_singkat">Deskripsi :</label>
              <textarea name="deskripsi_singkat"  rows="4" cols="45"><?=$hasil_event->deskripsi_singkat;?></textarea>
            </div>
            <div class="form-group">
              <label for="poster">Poster :</label>
              <input type="file" name="poster" class="form-control-file" >
            </div>

          </div>
          <div class="modal-footer">
            <div class="form-group">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Edit Event</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
<?php endforeach; ?>
<!-- akhir modals edit_event -->
<!-- Modals delete data -->
<?php foreach ($data_event as $hasil_event):?>
  <div class="modal fade" id="modalsDelete<?=$hasil_event->id_event?>" tabindex="-1" role="dialog" aria-labelledby="modalsDelete" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="modalsDelete_title">Hapus Data</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <p>Apakah anda akan menghapus data event <?=$hasil_event->nama;?></p>
          <form class="" action="<?php echo base_url('event/hapus/'); ?>" method="post">
            <div class="form-group">
              <input type="hidden" readonly value="<?=$hasil_event->id_event;?>" name="id_event" class="form-control">
            </div>
          </div>
          <div class="modal-footer">
            <div class="form-group">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Batal</button>
              <button type="submit" class="btn btn-danger">Hapus</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
<?php endforeach; ?>
<!-- ahiir modals delete data -->
<!-- akhir isi modal -->
<!-- Akhir isi konten -->
<?php
// memanggil isi footter
require_once ('layout/footer.php');
?>
