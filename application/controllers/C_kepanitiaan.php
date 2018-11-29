<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_kepanitiaan extends CI_Controller {
	
	/*public function __construct(){
		parent ::__construct();
		
		//load model
		$this->load->model('m_kepanitiaan');

	}*/
	
	public function index()
	{
		$data = array(	'title'	=> 'Kepanitiaan');
		/*'data_kepanitiaan' => $this->m_kepanitiaan->get_kepanitiaan_all(),
		'dd_kepanitiaan' => $this->m_kepanitiaan->dd_kepanitiaan(),
		'kepanitiaan_selected' => $this->input->post('kepanitiaan')?$this->input->post('kepanitiaan'):'',
		'dd_organisasi' => $this->m_kepanitiaan->dd_organisasi(),
		'organisasi_selected' => $this->input->post('organisasi')?$this->input->post('organisasi'):'',
		//untuk edit ganti '' menjadi data dari database misal $raw->id_organisasi*/
		
		$this->load->view('v_kepanitiaan', $data);
		$this->load->helper('form_helper');
	}
	
	/*public function simpan()
	{
		$data = array(
			'id_kepanitiaan' => $this->input->post("id_kepanitiaan"),
			'id_organisasi' => $this->input->post("id_organisasi"),
			'nama' => $this->input->post("nama_kepanitiaan")
		);
		
		$this->m_kepanitiaan->simpan($data);
		$this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');
	}
	
	public function edit($id_buku)
	{
		$id_kepanitiaan = $this->uri->segment(3);
		$data = array(
			'title'	=> 'Edit Kepanitiaan',
			'nama' => $this->model_kepanitiaan->edit($id_kepanitiaan)
		);
		$this->load->view('edit_kepanitiaan', $data);
	}
	
	public function update()
	{
		$id['id_kepanitiaan'] = $this->input->post("id_kepanitiaan");
		$data = array(
			'id_organisasi'         => $this->input->post("id_organisasi")
		);
		$this->model_kepanitiaan->update($data, $id);
		$this->session->set_flashdata('notif', '<div class="alert alert-success alert-dismissible"> Success! data berhasil diupdate didatabase.
                                                </div>');
		//redirect
		//redirect('buku/');
	}
	
	public function hapus($id_buku)
	{
		$id['id_kepanitiaan'] = $this->uri->segment(3);
		$this->model_kepanitiaan->hapus($id);
		
		//redirect
		//redirect('buku/');
	}*/
}
