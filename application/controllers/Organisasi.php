<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Organisasi extends CI_Controller {

	public function __construct(){
		parent ::__construct();

		//load model
		$this->load->helper(array('form', 'url'));
		$this->load->model('m_organisasi');
	}

	public function index()
	{
		$data = array(
			'title'	=> 'Organisasi',
			'data_organisasi' => $this->m_organisasi->get_organisasi_all(),
		);

		$this->load->helper('form','url','date');
		$this->load->library('upload','form_validation');
		$this->load->view('v_organisasi', $data);
	}

	public function tambah_organisasi()
	{
		// upload file poster dulu
		// setting konfigurasi upload
		$config['upload_path'] = './uploads/logo/';
		$config['allowed_types'] = 'gif|jpg|png';
		$config['remove_spaces'] = TRUE;
		$config['overwrite'] = FALSE;
		// load library upload
		$this->load->library('upload',$config);
		// lakukan upload file

		if ( ! $this->upload->do_upload('logo'))
		{
			$this->session->set_flashdata('info',$this->upload->display_errors('<p>', '</p>'));
			redirect(base_url('organisasi'));
		}else {
			// inisialisasi data untuk insert database
			$data = array(
				// mulai ini config untuk upload Poster
				'nama'       				=> $this->input->post("nama_organisasi"),
				'tingkatan'  				=> $this->input->post("tingkatan"),
				'email'    					=> $this->input->post("email"),
				'alamat_website'    => $this->input->post("alamat_website"),
				'contact_person'    => $this->input->post("contact_person"),
				'kategori'       		=> $this->input->post("kategori"),
				'deskripsi'       	=> $this->input->post("deskripsi"),
				'logo'							=>$this->upload->data("file_name"),

			);
			$this->m_organisasi->insert($data);
			$this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');
			redirect(base_url('organisasi'));
		}
	}

  // fungsi hapus organisasi
	public function hapus()
	{
		$id = $this->input->post('id');
		if($id==""){
			$this->session->set_flashdata('danger',"Data Anda Gagal Di Hapus, ID Organisasi kosong");
			redirect('organisasi');
		}else{
			if ($this->m_organisasi->hapus($id)) {
					$this->session->set_flashdata('success',"Data Organisasi Berhasil Dihapus");
				redirect('organisasi');
			}else {
				$this->session->set_flashdata('danger',"Data Gagal Dihapus, SQL Error");
				redirect('organisasi');
			}
		}
	}

	//fungsi edit data organisasi
	public function edit_organisasi()
	{

		if (empty($_FILES['logo']['name'])) {
// jika field file upload tidak berubah / tidak ada isinya
//update data tanpa mengubah isi tabel logo
			$id['id'] = $this->input->post("id");
			$data = array(
				'nama'       				=> $this->input->post("nama_organisasi"),
				'tingkatan'  				=> $this->input->post("tingkatan"),
				'email'    					=> $this->input->post("email"),
				'alamat_website'    => $this->input->post("alamat_website"),
				'contact_person'    => $this->input->post("contact_person"),
				'kategori'       		=> $this->input->post("kategori"),
				'deskripsi'       	=> $this->input->post("deskripsi"),
			);
			$this->m_organisasi->update($data, $id);
			$this->session->set_flashdata('info', 'Success! data berhasil diupdate didatabase.');
			redirect('organisasi');
		}//jika field poster ada isinya, upload poster baru
		// upload file poster dulu
		// setting konfigurasi upload
		$config['upload_path'] = './uploads/logo/';
		$config['allowed_types'] = 'gif|pdf|jpg|png';
		$config['remove_spaces'] = TRUE;
		$config['overwrite'] = FALSE;
		// load library upload
		$this->load->library('upload',$config);
		// lakukan upload file

		if ( ! $this->upload->do_upload('logo'))
		{
			$this->session->set_flashdata('info',$this->upload->display_errors('<p>', '</p>'));
			redirect(base_url('organisasi'));
		}

		$id['id'] = $this->input->post("id");
		$data = array(
			'nama'       				=> $this->input->post("nama_organisasi"),
			'tingkatan'  				=> $this->input->post("tingkatan"),
			'email'    					=> $this->input->post("email"),
			'alamat_website'    => $this->input->post("alamat_website"),
			'contact_person'    => $this->input->post("contact_person"),
			'kategori'       		=> $this->input->post("kategori"),
			'deskripsi'       	=> $this->input->post("deskripsi"),
			'logo'							=>$this->upload->data("file_name"),
		);

		$this->m_organisasi->update($data, $id);
		redirect('organisasi');
		$this->session->set_flashdata('info', 'Success! data berhasil diupdate didatabase.');

		//redirect


	}

}
