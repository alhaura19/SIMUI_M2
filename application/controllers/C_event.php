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
				);



		$this->load->view('v_event',$data);
    }


    public function simpan()
    {
        $data = array(

            'no_isbn'       => $this->input->post("no_isbn"),
            'nama_buku'         => $this->input->post("nama_buku"),
            'tanggal_terbit'    => $this->input->post("tanggal_terbit"),
            'pengarang'         => $this->input->post("pengarang"),

        );

        $this->m_event->simpan($data);

        $this->session->set_flashdata('info', 'Success! data berhasil disimpan didatabase');


    }

    public function edit($id_buku)
    {
        $id_buku = $this->uri->segment(3);

        $data = array(

            'title'     => 'Edit Data Buku',
            'data_buku' => $this->model_buku->edit($id_buku)

        );

        $this->load->view('edit_buku', $data);
    }

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

    public function hapus($id_buku)
    {
        $id['id_buku'] = $this->uri->segment(3);

        $this->model_buku->hapus($id);

        //redirect
        redirect('buku/');

    }

}
