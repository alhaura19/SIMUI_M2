<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class c_organisasi extends CI_Controller {
	public function index()
    {
    	$data = array(	'title'	=> 'Organisasi');
		
		#$this->load->helper('url');
		
		$this->load->view('v_organisasi', $this->$data);

    }
}
