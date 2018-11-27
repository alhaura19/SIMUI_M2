<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends CI_Controller {

	/**
	* Index Page for this controller.
	*
	* Maps to the following URL
	* 		http://example.com/index.php/welcome
	*	- or -
	* 		http://example.com/index.php/welcome/index
	*	- or -
	* Since this controller is set as the default controller in
	* config/routes.php, it's displayed at http://example.com/
	*
	* So any other public methods not prefixed with an underscore will
	* map to /index.php/welcome/<method_name>
	* @see https://codeigniter.com/user_guide/general/urls.html
	*/
	

	public function index()
	{
		// Fungsi Login
		$valid = $this->form_validation;
		$username = $this->input->post('username');
		$password = $this->input->post('password');
		$valid->set_rules('username','Username','required');
		$valid->set_rules('password','Password','required');
		if($valid->run()) {
			$this->simple_login->login($username,$password, base_url('dashboard'), base_url('home'));
		}
		// End fungsi login
		$data = array('title' => 'Halaman Home' );
		$this->load->view('v_home',$data);
	}


	//logout disini
	function logout() {
		$this->simple_login->logout();
	}
}
