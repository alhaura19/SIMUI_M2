<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_event extends CI_Controller {

	public function __construct(){

		parent ::__construct();

		//load model
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



		$this->load->view('v_event',$data);
		$this->load->helper('form_helper');
	}


	public function simpan()
	{
		$data = array(
			// mulai ini config untuk upload Poster
			'nama'       				=> $this->input->post("nama_event"),
			'id_pembuat_event'  => $this->input->post("organisasi_selected"),
			'id_kepanitiaan'  	=> $this->input->post("kepanitiaan_selected"),
			'tanggal'    				=> $this->input->post("tanggal"),
			'waktu'         		=> $this->input->post("waktu"),
			'kapasitas'         => $this->input->post("kapasitas"),
			'harga_tiket'       => $this->input->post("harga_tiket"),
			'lokasi'       			=> $this->input->post("lokasi"),
			'sifat_event'       => $this->input->post("sifat_event"),
			'deskripsi_singkat' => $this->input->post("deskripsi_singkat"),
			'nomor_kategori' => $this->input->post("kategori_selected"),

		);

		$this->m_event->simpan($data);

		$this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');


	}
// fungsi ini untuk mengambil data form edit
	public function edit($id_buku)
	{
		$id_buku = $this->uri->segment(3);

		$data = array(

			'title'     => 'Edit Data Buku',
			'data_buku' => $this->model_buku->edit($id_buku)

		);

		$this->load->view('edit_buku', $data);
	}
// fungsi ini mengirim data yg di edit
	public function update()
	{
		$id['id_buku'] = $this->input->post("id_buku");
		$data = array(

			'no_isbn'           => $this->input->post("no_isbn"),
			'nama_buku'         => $this->input->post("nama_buku"),
			'tanggal_terbit'    => $this->input->post("tanggal_terbit"),
			'pengarang'         => $this->input->post("pengarang"),

		);

		$this->model_buku->update($data, $id);

		$this->session->set_flashdata('notif', '<div class="alert alert-success alert-dismissible"> Success! data berhasil diupdate didatabase.
		</div>');

		//redirect
		redirect('buku/');

	}

	public function hapus($id_event)
	{
		if($id_event==""){
					$this->session->set_flashdata('error',"Data Anda Gagal Di Hapus");
					redirect('event');
			}else{
					$this->db->where('id_event', $id_event);
					$this->db->delete('event');
					$this->session->set_flashdata('success',"Data Berhasil Dihapus");
					redirect('event');

			}

	}

}
