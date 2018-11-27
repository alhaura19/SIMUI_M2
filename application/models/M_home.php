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
}
?>
