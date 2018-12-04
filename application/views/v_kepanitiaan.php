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
											<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#edit_organisasi<?=$hasil_kepanitiaan->id?>">Edit</button>
											<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#organisasiDelete<?=$hasil_kepanitiaan->id?>">Hapus</button>
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
              <input type="text" class="form-control" name="nama_kepanitiaan">
            </div>
            <div class="form-group">
              <label for="organisasi">Organisasi Pengawas :</label>
              <select class="form-control" id="tingkatan" name="tingkatan">
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
              <?php
              $dd_organisasi_attribute = 'class="form-control select2"';
              echo form_dropdown('organisasi', $dd_organisasi, $organisasi_selected, $dd_organisasi_attribute);
              ?>
            </div>
            <div class="form-group">
              <label for="email">Alamat Email :</label>
              <input type="email" class="form-control" name="email">
            </div>
            <div class="form-group">
              <label for="alamat_website">Alamat Website :</label>
              <input type="url"  class="form-control" name="alamat_website">
            </div>
            <div class="form-group">
              <label for="contact_person">Contact Person :</label>
              <input type="tel" class="form-control" name="contact_person">
            </div>
            <div class="form-group">
              <label for="kategori">Kategori Kepanitiaan :</label>
              <select class="form-control" id="kategori" name="kategori">
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
              <textarea name="deskripsi" rows="4" cols="45"></textarea>
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


  <div class="modal fade" id="delete" tabindex="-1" role="dialog" aria-labelledby="edit" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><span class="glyphicon glyphicon-remove" aria-hidden="true"></span></button>
          <h4 class="modal-title custom_align" id="Heading">Delete this entry</h4>
        </div>
        <div class="modal-body">

          <div class="alert alert-danger"><span class="glyphicon glyphicon-warning-sign"></span> Are you sure you want to delete this Record?</div>

        </div>
        <div class="modal-footer ">
          <button type="button" class="btn btn-success" ><span class="glyphicon glyphicon-ok-sign"></span> Yes</button>
          <button type="button" class="btn btn-default" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> No</button>
        </div>
      </div>
      <!-- /.modal-content -->
    </div>
    <!-- /.modal-dialog -->
  </div> <!-- /container -->
</main>
<!-- Akhir isi konten -->
  <?php
  // memanggil isi footter
  require_once ('layout/footer.php');
  ?>
