<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Dashboard extends CI_Controller {


    public function index()
    {
    $data = array(	'title'	=> 'Halaman Dashboard');
		// 				'isi'	=> 'dasbor_view');
		$this->load->helper('url');
		// $this->load->view('layout/wrapper',$data);
		$this->load->view('v_dashboard',$data);

    }

}
