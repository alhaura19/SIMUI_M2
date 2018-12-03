
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
				<h4>Daftar Organisasi</h4>
				<?php if (isset($_SESSION['type'])) { ?>
					<button class="btn btn-md btn-success" type="button" name="tambah_organisasi" data-toggle="modal" data-target="#tambah_organisasi">Tambah Organisasi</button>
				<?php } ?>
				<hr>
				<div class="table-responsive">
					<table id="table" class="table table-sm table-condensed table-bordred table-striped table-hover">
						<thead class="thead-dark">
							<th>Nama Organisasi</th>
							<th>Email</th>
							<th>Alamat Website</th>
							<th>Tingkatan</th>
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
							foreach ($data_organisasi as $hasil_organisasi) {?>
								<tr>
									<td><?php echo $hasil_organisasi->nama; ?></td>
									<td><?php echo $hasil_organisasi->email; ?></td>
									<td><?php echo $hasil_organisasi->alamat_website; ?></td>
									<td><?php echo $hasil_organisasi->tingkatan; ?></td>
									<td><?php echo $hasil_organisasi->kategori; ?></td>
									<td> <img class="img-thumbnail" src="<?php echo base_url('uploads/logo/'.$hasil_organisasi->logo); ?>" alt=""></td>
									<td><?php echo $hasil_organisasi->deskripsi; ?></td>
									<td><?php echo $hasil_organisasi->contact_person; ?></td>
									<?php if (isset($_SESSION['type'])) { ?>
										<td>
											<button class="btn btn-primary btn-sm" type="button" data-toggle="modal" data-target="#edit_organisasi<?=$hasil_organisasi->id?>">Edit</button>
											<button type="button" class="btn btn-danger btn-sm" data-toggle="modal" data-target="#organisasiDelete<?=$hasil_organisasi->id?>">Hapus</button>
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

	<!-- awal modals tambah organisasi -->
	<div class="modal fade" id="tambah_organisasi" tabindex="-1" role="dialog" aria-labelledby="tambah_organisasi" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="Label_tambah_organisasi">Tambah Data Organisasi</h5>
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<form enctype="multipart/form-data" action="<?php echo base_url('organisasi/tambah_organisasi') ?>" method="post">
						<div class="form-group">
							<label for="nama_organisasi" class="col-form-label">Nama Organisasi:</label>
							<input type="text" class="form-control" name="nama_organisasi">
						</div>
						<div class="form-group">
							<label for="tingkatan">Tingkatan :</label>
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
							<label for="kategori">Kategori Organisasi :</label>
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
							<label for="deskripsi">Deskripsi Organisasi :</label>
							<textarea name="deskripsi" rows="4" cols="45"></textarea>
						</div>
					</div>
					<div class="modal-footer">
						<div class="form-group">
							<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
							<button type="submit" class="btn btn-primary">Tambah Organisasi</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- akhir modals tambah organisasi -->

	<!-- awal modals edit_organisasi -->
	<?php foreach ($data_organisasi as $hasil_organisasi):?>
		<div class="modal fade" id="edit_organisasi<?=$hasil_organisasi->id?>" tabindex="-1" role="dialog" aria-labelledby="edit_organisasi<?=$hasil_organisasi->id?>" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title custom_align" id="Heading">Edit Data Organisasi</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            <span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<form enctype="multipart/form-data" action="<?php echo base_url('organisasi/edit_organisasi') ?>" method="post">
							<input type="hidden" readonly value="<?=$hasil_organisasi->id;?>" name="id" class="form-control">
							<div class="form-group">
								<label for="nama_organisasi" class="col-form-label">Nama Organisasi:</label>
								<input type="text" class="form-control" name="nama_organisasi" value="<?=$hasil_organisasi->nama;?>">
							</div>
							<div class="form-group">
								<label for="tingkatan">Tingkatan :</label>
								<select class="form-control" id="tingkatan" name="tingkatan" >
									<option selected ><?=$hasil_organisasi->tingkatan;?></option>
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
							</div>
							<div class="form-group">
								<label for="email">Alamat Email :</label>
								<input type="email" class="form-control" name="email" value="<?=$hasil_organisasi->email;?>">
							</div>
							<div class="form-group">
								<label for="alamat_website">Alamat Website :</label>
								<input type="url"  class="form-control" name="alamat_website" value="<?=$hasil_organisasi->alamat_website;?>">
							</div>
							<div class="form-group">
								<label for="contact_person">Contact Person :</label>
								<input type="tel" class="form-control" name="contact_person" value="<?=$hasil_organisasi->contact_person;?>">
							</div>
							<div class="form-group">
								<label for="kategori">Kategori Organisasi :</label>
								<select class="form-control" id="kategori" name="kategori">
									<option selected ><?=$hasil_organisasi->kategori;?></option>
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
								<label for="deskripsi">Deskripsi Organisasi :</label>
								<textarea name="deskripsi" rows="4" cols="45"><?=$hasil_organisasi->deskripsi;?></textarea>
							</div>
						</div>
						<div class="modal-footer">
							<div class="form-group">
								<button type="reset" class="btn btn-secondary" data-dismiss="modal">Close</button>
								<button type="submit" class="btn btn-primary">Edit Organisasi</button>
							</div>
						</form>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	<?php endforeach; ?>
	<!-- Akhir modals edit_organisasi -->
	<!-- awal modals delete organisasi -->
	<?php foreach ($data_organisasi as $hasil_organisasi):?>
		<div class="modal fade" id="organisasiDelete<?=$hasil_organisasi->id?>" tabindex="-1" role="dialog" aria-labelledby="delete<?=$hasil_organisasi->id?>" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="label_delete<?=$hasil_organisasi->id?>">Hapus Data Organisasi</h5>
						<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
					</div>
					<div class="modal-body">
						<p>Apakah anda yakin akan menghapus organisasi <?=$hasil_organisasi->nama;?></p>
					</div>
					<form class="" action="<?php echo base_url('organisasi/hapus/'); ?>" method="post">
						<div class="modal-footer ">
							<div class="form-group">
								<input type="hidden" readonly value="<?=$hasil_organisasi->id?>" name="id" class="form-control">
								<button type="button" class="btn btn-default" data-dismiss="modal">Batal</button>
								<button type="submit" class="btn btn-success" >Hapus</button>
							</div>
						</div>
					</form>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
	<?php endforeach; ?>
	<!-- akhir modalsDelete organisasi -->
</main>
<?php
// memanggil isi footter
require_once ('layout/footer.php');
?>
