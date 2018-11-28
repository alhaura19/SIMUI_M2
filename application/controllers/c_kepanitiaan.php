<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class c_kepanitiaan extends CI_Controller {
	public function index()
    {
    	$data = array(	'title'	=> 'Kepanitiaan');
		
		#$this->load->helper('url');
		
		$this->load->view('v_kepanitiaan');
    }
}
