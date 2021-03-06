<?php if(! defined('BASEPATH')) exit('Akses langsung tidak diperbolehkan');

class Simple_login {
	// SET SUPER GLOBAL
	var $CI = NULL;
	public function __construct() {
		$this->CI =& get_instance();
	}
	// Fungsi login
	public function login($username, $password) {
		$query = $this->CI->db->get_where('pengguna',array('username'=>$username,'password' => $password));
		if($query->num_rows() == 1) {
			$row 	= $this->CI->db->query("SELECT username FROM simui.pengguna where username ='".$username."'");
			$admin 	= $row->row();
			$id 	= $admin->username;
			$this->CI->session->set_userdata('username', $username);
			$this->CI->session->set_userdata('id_login', uniqid(rand()));
			$this->CI->session->set_userdata('id', $id);

			$query = $this->CI->db->get_where('admin',array('username'=>$username));
			if ($query->num_rows()==1) {
				$row0 	= $this->CI->db->query("SELECT username FROM simui.admin where username ='".$username."'");
				$this->CI->session->set_userdata('type', 'Admin');
			}
			$query = $this->CI->db->get_where('pembuat_event',array('humas'=>$username));
			if ($query->num_rows()==1) {
				$this->CI->session->set_userdata('type', 'Humas');
			}
			$this->CI->session->set_flashdata('success','Selamat Datang '.$username);
			redirect(base_url('home'));
		}else{
			$this->CI->session->set_flashdata('error','Oops... Username/password salah');
			redirect(base_url('home'));
		}
		return false;
	}
	// Proteksi halaman
	public function cek_login() {
		if($this->CI->session->userdata('username') == '') {
			$this->CI->session->set_flashdata('warning','Anda belum login');
			redirect(base_url('home'));
		}
	}
	// Fungsi logout
	public function logout() {
		$this->CI->session->unset_userdata('username');
		$this->CI->session->unset_userdata('id_login');
		$this->CI->session->unset_userdata('id');
		$this->CI->session->unset_userdata('type');
		$this->CI->session->set_flashdata('success','Anda berhasil logout');
		redirect(base_url('home'));
	}
}
