<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Kepanitiaan extends CI_Controller {

	public function __construct(){
		parent ::__construct();

		//load model
		$this->load->helper(array('form', 'url'));
		$this->load->model('m_kepanitiaan');

	}

	public function index()
	{
		$data = array(
			'title'	=> 'Kepanitiaan',
			'data_kepanitiaan' => $this->m_kepanitiaan->get_kepanitiaan_all(),
			'dd_organisasi' => $this->m_kepanitiaan->dd_organisasi(),
			// 'organisasi_selected' => $this->input->post('organisasi')?$this->input->post('organisasi'):$row->organisasi,


		);
		$this->load->helper('form_helper','form','url','date');
		$this->load->library('upload','form_validation');
		$this->load->view('v_kepanitiaan', $data);

	}

	public function tambah_kepanitiaan()
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
			redirect(base_url('kepanitiaan'));
		}else {
			// inisialisasi data untuk insert database
			$data_tabel_kepanitiaan = $this->input->post("organisasi");

			$data = array(
				// mulai ini config untuk upload Poster
				'nama'       				=> $this->input->post("nama_kepanitiaan"),
				'tingkatan'  				=> $this->input->post("tingkatan"),
				'email'    					=> $this->input->post("email"),
				'alamat_website'    => $this->input->post("alamat_website"),
				'contact_person'    => $this->input->post("contact_person"),
				'kategori'       		=> $this->input->post("kategori"),
				'deskripsi'       	=> $this->input->post("deskripsi"),
				'logo'							=>$this->upload->data("file_name"),

			);
			$this->m_kepanitiaan->insert($data,$data_tabel_kepanitiaan);
			$this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');
			redirect(base_url('organisasi'));
		}
	}

	// fungsi hapus kepanitiaan
	public function hapus()
	{
		$id = $this->input->post('id');
		if($id==""){
			$this->session->set_flashdata('danger',"Data Anda Gagal Di Hapus, ID Kepanitiaan kosong");
			redirect('kepanitiaan');
		}else{
			if ($this->m_kepanitiaan->hapus($id)) {
				$this->session->set_flashdata('success',"Data Kepanitiaan Berhasil Dihapus");
				redirect('kepanitiaan');
			}else {
				$this->session->set_flashdata('danger',"Data Gagal Dihapus, SQL Error");
				redirect('kepanitiaan');
			}
		}
	}

	//fungsi edit data kepanitiaan
	public function edit_kepanitiaan()
	{

		if (NULL == $this->input->post('logo')||trim($this->input->post('logo')) == '') {
// jika field file upload tidak berubah / tidak ada isinya
//update data tanpa mengubah isi tabel logo
			$id['id'] = $this->input->post("id");
			$id_organisasi_pengawas = $this->input->post("organisasi");
			$data = array(
				'nama'       				=> $this->input->post("nama_kepanitiaan"),
				'tingkatan'  				=> $this->input->post("tingkatan"),
				'email'    					=> $this->input->post("email"),
				'alamat_website'    => $this->input->post("alamat_website"),
				'contact_person'    => $this->input->post("contact_person"),
				'kategori'       		=> $this->input->post("kategori"),
				'deskripsi'       	=> $this->input->post("deskripsi"),
			);
			$this->m_kepanitiaan->update($data, $id,$id_organisasi_pengawas);
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
		$id_organisasi_pengawas = $this->input->post("organisasi");
		$data = array(
			'nama'       				=> $this->input->post("nama_organisasi"),
			'tingkatan'  				=> $this->input->post("tingkatan"),
			'email'    					=> $this->input->post("email"),
			'alamat_website'    => $this->input->post("alamat_website"),
			'contact_person'    => $this->input->post("contact_person"),
			'kategori'       		=> $this->input->post("kategori"),
			'deskripsi'       	=> $this->input->post("deskripsi"),
			'poster'						=>$this->upload->data("file_name"),
		);

		$this->m_kepanitiaan->update($data, $id, $id_organisasi_pengawas);
		redirect('organisasi');
		$this->session->set_flashdata('info', 'Success! data berhasil diupdate didatabase.');

		//redirect


	}

}
