<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class C_organisasi extends CI_Controller {
	
	/*public function __construct(){
		parent ::__construct();
		
		//load model
		$this->load->model('M_organisasi');
	}*/
	
	public function index()
	{
		$data = array(	'title'	=> 'Organisasi');

		$this->load->view('v_organisasi', $data);
	}
	
	/*public function simpan()
	{
		$data = array(
			'id_organisasi'         => $this->input->post("id_organisasi")
		);
		$this->model_organisasi->simpan($data);
		$this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');
	}
	
	public function edit($id_organisasi)
	{
		$id_organisasi = $this->uri->segment(3);
		$data = array(
			'title'	=> 'Edit Organisasi',
			'nama' => $this->M_organisasi->edit($id_organisasi)
		);
		$this->load->view('edit_organisasi', $data);
	}
	
	public function update()
	{
		$id['id_organisasi'] = $this->input->post("id_organisasi");
		$data = array(
			'nama'         => $this->input->post("nama")
		);
		$this->model_organisasi->update($data, $id);
		$this->session->set_flashdata('notif', '<div class="alert alert-success alert-dismissible"> Success! data berhasil diupdate didatabase.
                                                </div>');
		//redirect
		//redirect('buku/');
	}
	
	public function hapus($id_organisasi)
	{
		$id['id_organisasi'] = $this->uri->segment(3);
		$this->model_organisasi->hapus($id);
		
		//redirect
		//redirect('buku/');
	}*/
}
