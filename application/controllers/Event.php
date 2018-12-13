<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Event extends CI_Controller {

	public function __construct(){

		parent ::__construct();

		//load model
		$this->load->helper(array('form', 'url'));
		$this->load->model('m_event');

	}


	public function index()
	{
		$data = array(
			'title'	=> 'Event',
			'data_event' => $this->m_event->get_event_all(),
			'dd_organisasi' => $this->m_event->dd_organisasi(),
			'organisasi_selected' => $this->input->post('organisasi')?$this->input->post('organisasi'):'',
			'dd_kepanitiaan' => $this->m_event->dd_kepanitiaan(),
			'kepanitiaan_selected' => $this->input->post('kepanitiaan')?$this->input->post('kepanitiaan'):'',
			'dd_kategori' => $this->m_event->dd_kategori(),
			'kategori_selected' => $this->input->post('kategori')?$this->input->post('kategori'):'',
			//untuk edit ganti '' menjadi data dari database misal $raw->id_organisasi

		);

		$this->load->helper('form','url','date');
		$this->load->library('upload','form_validation');
		$this->load->view('v_event',$data);
	}


	public function tambah_event()
	{
		// upload file poster dulu
		// setting konfigurasi upload
		$config['upload_path'] = './uploads/poster/';
		$config['allowed_types'] = 'gif|pdf|jpg|png';
		$config['remove_spaces'] = TRUE;
		$config['overwrite'] = FALSE;
		// load library upload
		$this->load->library('upload',$config);
		// lakukan upload file

		if ( ! $this->upload->do_upload('poster'))
		{
			$this->session->set_flashdata('info',$this->upload->display_errors('<p>', '</p>'));
			redirect(base_url('event'));
		}else {
			// inisialisasi data untuk insert database
			$data = array(
				// mulai ini config untuk upload Poster
				'nama'       				=> $this->input->post("nama_event"),
				'id_pembuat_event'  => $this->input->post("organisasi"),
				'tanggal'    				=> $this->input->post("tanggal"),
				'waktu'         		=> $this->input->post("waktu"),
				'kapasitas'         => $this->input->post("kapasitas"),
				'harga_tiket'       => $this->input->post("harga_tiket"),
				'lokasi'       			=> $this->input->post("lokasi"),
				'sifat_event'       => $this->input->post("sifat_event"),
				'deskripsi_singkat' => $this->input->post("deskripsi_singkat"),
				'nomor_kategori' 		=> $this->input->post("kategori"),
				'poster'						=>$this->upload->data("file_name"),

			);
			$this->m_event->insert($data);
			$this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');
			redirect(base_url('event'));
		}
	}

	// fungsi ini mengirim data yg di edit
	public function edit_event()
	{

		if (empty($_FILES['poster']['name'])) {
// jika field file upload tidak berubah / tidak ada isinya
			$id_event['id_event'] = $this->input->post("id_event");
			$data = array(
				'nama'       				=> $this->input->post("nama_event"),
				'id_pembuat_event'  => $this->input->post("organisasi"),
				'tanggal'    				=> $this->input->post("tanggal"),
				'waktu'         		=> $this->input->post("waktu"),
				'kapasitas'         => $this->input->post("kapasitas"),
				'harga_tiket'       => $this->input->post("harga_tiket"),
				'lokasi'       			=> $this->input->post("lokasi"),
				'sifat_event'       => $this->input->post("sifat_event"),
				'deskripsi_singkat' => $this->input->post("deskripsi_singkat"),
				'nomor_kategori' => $this->input->post("kategori"),
			);

			$this->m_event->update($data, $id_event);
			$this->session->set_flashdata('info', 'Success! data berhasil diupdate didatabase.');
			redirect('event');


		}//jika field poster ada isinya, upload poster baru
		// upload file poster dulu
		// setting konfigurasi upload
		$config['upload_path'] = './uploads/poster/';
		$config['allowed_types'] = 'gif|pdf|jpg|png';
		$config['remove_spaces'] = TRUE;
		$config['overwrite'] = FALSE;
		// load library upload
		$this->load->library('upload',$config);
		// lakukan upload file

		if ( ! $this->upload->do_upload('poster'))
		{
			$this->session->set_flashdata('info',$this->upload->display_errors('<p>', '</p>'));
			redirect(base_url('event'));
		}

		$id_event['id_event'] = $this->input->post("id_event");
		$data = array(
			'nama'       				=> $this->input->post("nama_event"),
			'id_pembuat_event'  => $this->input->post("organisasi"),
			'tanggal'    				=> $this->input->post("tanggal"),
			'waktu'         		=> $this->input->post("waktu"),
			'kapasitas'         => $this->input->post("kapasitas"),
			'harga_tiket'       => $this->input->post("harga_tiket"),
			'lokasi'       			=> $this->input->post("lokasi"),
			'sifat_event'       => $this->input->post("sifat_event"),
			'deskripsi_singkat' => $this->input->post("deskripsi_singkat"),
			'nomor_kategori' => $this->input->post("kategori"),
			'poster'						=>$this->upload->data("file_name")

		);

		$this->m_event->update($data, $id_event);
		$this->session->set_flashdata('info', 'Success! data berhasil diupdate didatabase.');
		redirect('event');


		//redirect


	}

	public function hapus()
	{
		$id_event = $this->input->post('id_event');
		$id_pembuat_event = $this->input->post('id_pembuat_event');
		if($id_event==""){
			$this->session->set_flashdata('danger',"Data Anda Gagal Di Hapus");
			redirect('event');
		}else{
			if ($this->m_event->hapus($id_event,$id_pembuat_event)) {
						$this->session->set_flashdata('success',"Data Berhasil Dihapus");
				redirect('event');
			}else {
				$this->session->set_flashdata('danger',"Data Gagal Dihapus");
				redirect('event');
			}
		}

	}

}
