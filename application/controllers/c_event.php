<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class c_event extends CI_Controller {
	public function index()
    {
    	$data = array(	'title'	=> 'Event');
		
		#$this->load->helper('url');
		
		$this->load->view('v_event');
    }
}
