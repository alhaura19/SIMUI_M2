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
        <h4>Daftar Kepanitiaan</h4>
        <?php if (isset($_SESSION['type'])) { ?>
          <button class="btn btn-md btn-success" type="button" name="tambah_kepanitiaan" data-toggle="modal" data-target="#tambah_kepanitiaan">Tambah Kepanitiaan</button>
        <?php } ?>
        <hr>
        <div class="table-responsive">
          <table id="table" class="table table-sm table-condensed table-bordred table-striped table-hover">
            <thead class="thead-dark">
              <th>Nama Kepanitiaan</th>
              <th>Email</th>
              <th>Alamat Website</th>
              <th>Organisasi</th>
              <th>Kategori</th>
              <th>Logo</th>
              <th>Deskripsi</th>
              <th>Contact Person</th>
              <?php if (isset($_SESSION['type'])) { ?>
                <th>Options</th>
              <?php } ?>
            </thead>
            <tbody>
              <?php
              foreach ($data_kepanitiaan as $hasil_kepanitiaan) {?>
                <tr>
                  <td><?php echo $hasil_kepanitiaan->nama; ?></td>
                  <td><?php echo $hasil_kepanitiaan->email; ?></td>
                  <td><?php echo $hasil_kepanitiaan->alamat_website; ?></td>
                  <td><?php echo $hasil_kepanitiaan->organisasi; ?></td>
                  <td><?php echo $hasil_kepanitiaan->kategori; ?></td>
                  <td> <img class="img-thumbnail" src="<?php echo base_url('uploads/logo/'.$hasil_kepanitiaan->logo); ?>" alt=""></td>
                  <td><?php echo $hasil_kepanitiaan->deskripsi; ?></td>
                  <td><?php echo $hasil_kepanitiaan->contact_person; ?></td>
                  <?php if (isset($_SESSION['type'])) { ?>
                    <td>
                      <button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#edit_kepanitiaan<?=$hasil_kepanitiaan->id?>">Edit</button>
                      <button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#kepanitiaanDelete<?=$hasil_kepanitiaan->id?>">Hapus</button>
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

  <!-- awal modals tambah kepanitiaan -->
  <div class="modal fade" id="tambah_kepanitiaan" tabindex="-1" role="dialog" aria-labelledby="tambah_kepanitiaan" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="Label_tambah_kepanitiaan">Tambah Data Kepanitiaan</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form enctype="multipart/form-data" action="<?php echo base_url('kepanitiaan/tambah_kepanitiaan') ?>" method="post">
            <div class="form-group">
              <label for="nama_organisasi" class="col-form-label">Nama Kepanitiaan:</label>
              <input type="text" class="form-control" name="nama_kepanitiaan" required>
            </div>
            <div class="form-group">
              <label for="organisasi">Organisasi Pengawas :</label>
              <select class="form-control" id="tingkatan" name="tingkatan" required>
                <option>Universitas</option>
                <optgroup label="Fakultas">
                  <option>Fakultas Ilmu Komputer</option>
                  <option>Fakultas Hukum</option>
                  <option>Fakultas Ilmu Budaya</option>
                  <option>Fakultas Kedokteran</option>
                  <option>Fakultas Ekonomi dan Bisnis</option>
                  <option>Fakultas Psikologi</option>
                  <option>Fakultas Kedokteran Gigi</option>
                  <option>Fakultas Matematika dan Ilmu Pengetahuan Alam</option>
                  <option>Fakultas Teknik</option>
                  <option>Fakultas Kesehatan Masyarakat</option>
                  <option>Fakultas Ilmu Sosial dan Ilmu Politik</option>
                  <option>Fakultas Ilmu Keperawatan</option>
                  <option>Program Vokasi</option>
                  <option>Fakultas Farmasi</option>
                  <option>Fakultas Ilmu Administrasi</option>
                  <option>Sekolah Ilmu Lingkungan</option>
                  <option>Sekolah Kajian Stratejik dan Global</option>
                </optgroup>
              </select>
              <select class="form-control select2" name="organisasi" id="organisasi" required>
                <?php foreach ($dd_organisasi as $opsi_organisasi):?>
                <option value="<?=$opsi_organisasi->id?>"><?=$opsi_organisasi->nama?></option>
              <?php endforeach;?>
              </select>
            </div>
            <div class="form-group">
              <label for="email">Alamat Email :</label>
              <input type="email" class="form-control" name="email" required>
            </div>
            <div class="form-group">
              <label for="alamat_website">Alamat Website :</label>
              <input type="url"  class="form-control" name="alamat_website">
            </div>
            <div class="form-group">
              <label for="contact_person">Contact Person :</label>
              <input type="tel" class="form-control" name="contact_person" required>
            </div>
            <div class="form-group">
              <label for="kategori">Kategori Kepanitiaan :</label>
              <select class="form-control" id="kategori" name="kategori" required>
                <option>Unit Kegiatan Mahasiswa</option>
                <option>Dewan Perwakilan Mahasiswa Universitas</option>
                <option>Badan Eksekutif Mahasiswa Universitas</option>
                <option>Dewan Perwakilan Mahasiswa Fakultas</option>
                <option>Badan Eksekutif Mahasiswa Fakultas</option>
                <option>Himpunan Mahasiswa Jurusan</option>
              </select>
            </div>
            <div class="form-group">
              <label for="logo">Logo :</label>
              <input type="file" class="form-control-file" name="logo"></input>
            </div>
            <div class="form-group">
              <label for="deskripsi">Deskripsi Kepanitiaan :</label>
              <textarea name="deskripsi" rows="4" cols="45" required></textarea>
            </div>
          </div>
          <div class="modal-footer">
            <div class="form-group">
              <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
              <button type="submit" class="btn btn-primary">Tambah Kepanitiaan</button>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <!-- akhir modals tambah organisasi -->
  <!-- awal modals edit kepanitiaan -->
  <?php foreach ($data_kepanitiaan as $hasil_kepanitiaan):?>
    <div class="modal fade" id="edit_kepanitiaan<?=$hasil_kepanitiaan->id?>" tabindex="-1" role="dialog" aria-labelledby="edit_kepanitiaan<?=$hasil_kepanitiaan->id?>" aria-hidden="true">
      <div class="modal-dialog" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="Label_edit_kepanitiaan">Edit Data Kepanitiaan</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <form enctype="multipart/form-data" action="<?php echo base_url('kepanitiaan/edit_kepanitiaan') ?>" method="post">
              <div class="form-group">
                <label for="nama_organisasi" class="col-form-label">Nama Kepanitiaan:</label>
                <input type="hidden" class="form-control" name="id" value="<?=$hasil_kepanitiaan->id?>" required>
                <input type="text" class="form-control" name="nama_kepanitiaan" value="<?=$hasil_kepanitiaan->nama?>" required>
              </div>
              <div class="form-group">
                <label for="organisasi">Organisasi Pengawas :</label>
                <select class="form-control" id="tingkatan" name="tingkatan">
                  <option selected value="<?=$hasil_kepanitiaan->tingkatan?>"><?=$hasil_kepanitiaan->tingkatan?></option>
                  <option>Universitas</option>
                  <optgroup label="Fakultas">
                    <option>Fakultas Ilmu Komputer</option>
                    <option>Fakultas Hukum</option>
                    <option>Fakultas Ilmu Budaya</option>
                    <option>Fakultas Kedokteran</option>
                    <option>Fakultas Ekonomi dan Bisnis</option>
                    <option>Fakultas Psikologi</option>
                    <option>Fakultas Kedokteran Gigi</option>
                    <option>Fakultas Matematika dan Ilmu Pengetahuan Alam</option>
                    <option>Fakultas Teknik</option>
                    <option>Fakultas Kesehatan Masyarakat</option>
                    <option>Fakultas Ilmu Sosial dan Ilmu Politik</option>
                    <option>Fakultas Ilmu Keperawatan</option>
                    <option>Program Vokasi</option>
                    <option>Fakultas Farmasi</option>
                    <option>Fakultas Ilmu Administrasi</option>
                    <option>Sekolah Ilmu Lingkungan</option>
                    <option>Sekolah Kajian Stratejik dan Global</option>
                  </optgroup>
                </select>
                <select class="form-control select2" name="organisasi" id="organisasi">
                  <option selected value="<?=$hasil_kepanitiaan->id_organisasi?>"><?=$hasil_kepanitiaan->organisasi?></option>
                  <?php foreach ($dd_organisasi as $opsi_organisasi):?>
                  <option value="<?=$opsi_organisasi->id?>"><?=$opsi_organisasi->nama?></option>
                <?php endforeach;?>
                </select>
              </div>
              <div class="form-group">
                <label for="email">Alamat Email :</label>
                <input type="email" class="form-control" name="email" value="<?=$hasil_kepanitiaan->email?>">
              </div>
              <div class="form-group">
                <label for="alamat_website">Alamat Website :</label>
                <input type="url"  class="form-control" name="alamat_website" value="<?=$hasil_kepanitiaan->alamat_website?>">
              </div>
              <div class="form-group">
                <label for="contact_person">Contact Person :</label>
                <input type="tel" class="form-control" name="contact_person" value="<?=$hasil_kepanitiaan->contact_person?>">
              </div>
              <div class="form-group">
                <label for="kategori">Kategori Kepanitiaan :</label>
                <select class="form-control" id="kategori" name="kategori">
                  <option selected value="<?=$hasil_kepanitiaan->kategori?>"><?=$hasil_kepanitiaan->kategori?></option>
                  <option>Unit Kegiatan Mahasiswa</option>
                  <option>Dewan Perwakilan Mahasiswa Universitas</option>
                  <option>Badan Eksekutif Mahasiswa Universitas</option>
                  <option>Dewan Perwakilan Mahasiswa Fakultas</option>
                  <option>Badan Eksekutif Mahasiswa Fakultas</option>
                  <option>Himpunan Mahasiswa Jurusan</option>
                </select>
              </div>
              <div class="form-group">
                <label for="logo">Logo :</label>
                <input type="file" value="<?php echo base_url('uploads/logo/'.$hasil_kepanitiaan->logo); ?>" class="form-control-file" name="logo"></input>
              </div>
              <div class="form-group">
                <label for="deskripsi">Deskripsi Kepanitiaan :</label>
                <textarea name="deskripsi" rows="4" cols="45"><?=$hasil_kepanitiaan->deskripsi?></textarea>
              </div>
            </div>
            <div class="modal-footer">
              <div class="form-group">
                <button type="reset" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="submit" class="btn btn-primary">Edit Kepanitiaan</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
  <?php endforeach; ?>
  <!-- Akhir modals edit kepanitiaan -->
  <!-- awal modals delete kepanitiaan -->
  <?php foreach ($data_kepanitiaan as $hasil_kepanitiaan):?>
    <div class="modal fade" id="kepanitiaanDelete<?=$hasil_kepanitiaan->id?>" tabindex="-1" role="dialog" aria-labelledby="kepanitiaanDelete<?=$hasil_kepanitiaan->id?>" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <h4 class="modal-title custom_align" id="Label_delete_kepanitiaan">Hapus Data Kepanitiaan</h4>
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
          </div>
          <div class="modal-body">
            <p>Apakah anda yakin akan menghapus kepanitiaan <?=$hasil_kepanitiaan->nama;?></p>
          </div>
          <form action="<?php echo base_url('kepanitiaan/hapus/'); ?>" method="post">
            <div class="modal-footer ">
              <div class="form-group">
                <input type="hidden" name="id" value="<?=$hasil_kepanitiaan->id?>" name="id" class="form-control">
                <button type="reset" class="btn btn-default" data-dismiss="modal"> Batal</button>
                <button type="submit" class="btn btn-danger" > Hapus Kepanitiaan</button>
              </div>
            </div>
          </form>
        </div>
        <!-- /.modal-content -->
      </div>
      <!-- /.modal-dialog -->
    </div>
  <?php endforeach; ?>
  <!-- akhir modals delete -->
</main>
<!-- Akhir isi konten -->
<?php
// memanggil isi footter
require_once ('layout/footer.php');
?>
