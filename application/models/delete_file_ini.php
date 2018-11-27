<?php
if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class m_home extends CI_Model
{
  function __construct()
   {
    parent::__construct();

   }

   function cekDetailDataLogin($username,$password) {
    return $this->db->select("*")
    ->from("pengguna as a")
    ->where("a.username",$username)
    ->where("a.password",$password)
    ->get()->result_array();
   }
   function getlogin($username,$password)
   {
     if($username !='' && $password !='')
     {
       $pass = $password;
       $this->db->where("username",$username);
       $this->db->where("password",$pass);
       $query = $this->db->get("pengguna");
       if($query->num_rows() > 0){
         foreach($query->result() as $row){
           $user = array(
             "username" => $row->username
           );
           $this->session->set_userdata($user);
           redirect('dashboard');
         }
       }
       else
       {
         // Jika username atau password tidak sama
         redirect('home');
       }
     }
     else
     {
       // Jika username atau password kosong
       redirect('home');
     }
   }
}
?>
