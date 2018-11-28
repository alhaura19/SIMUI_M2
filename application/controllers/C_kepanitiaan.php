<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_kepanitiaan extends CI_Controller {
	
	/*public function __construct(){
		parent ::__construct();
		
		//load model
		$this->load->model('m_event');

	}*/
	
	public function index()
	{
		$data = array(	'title'	=> 'Kepanitiaan');
		//'data_kepanitiaan' => $this->m_kepanitian->get_kepatiaan_all()
		$this->load->view('v_kepanitiaan', $data);
	}
	
	/*public function simpan()
	{
		$data = array(
			'id_kepanitiaan'       => $this->input->post("id_kepanitiaan"),
			'id_organisasi'         => $this->input->post("id_organisasi")
		);
		$this->m_kepanitiaan->simpan($data);
		$this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');
	}
	
	public function edit($id_buku)
	{
		$id_kepanitiaan = $this->uri->segment(3);
		$data = array(
			'title'	=> 'Edit Kepanitiaan',
			'nama' => $this->m_kepanitiaan->edit($id_kepanitiaan)
		);
		$this->load->view('edit_kepanitiaan', $data);
	}
	
	public function update()
	{
		$id['id_kepanitiaan'] = $this->input->post("id_kepanitiaan");
		$data = array(
			'id_organisasi'         => $this->input->post("id_organisasi")
		);
		$this->m_kepanitiaan->update($data, $id);
		$this->session->set_flashdata('notif', '<div class="alert alert-success alert-dismissible"> Success! data berhasil diupdate didatabase.
                                                </div>');
		//redirect
		//redirect('buku/');
	}
	
	public function hapus($id_buku)
	{
		$id['id_kepanitiaan'] = $this->uri->segment(3);
		$this->m_kepanitiaan->hapus($id);
		
		//redirect
		//redirect('buku/');
	}*/
}
