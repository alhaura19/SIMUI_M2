<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_home extends CI_model{

    public function get_all()
    {
        $query = $this->db->select("*")
                 ->from('event')
                 ->order_by('tanggal', 'DESC')
                 ->limit('5')
                 ->get();
        return $query->result();
    }

}
