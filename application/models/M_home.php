<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_home extends CI_model{

    public function get_event()
    {
        $query = $this->db->select("*")
                 ->from('event')
                 ->order_by('tanggal', 'DESC')
                 ->limit('5')
                 ->get();
        return $query->result();
    }
    public function get_kepanitiaan()
    {
        $query = $this->db->select("*")
                 ->from('open_recruitment')
                 ->order_by('tanggal_dibuka')
                 ->limit('5')
                 ->get();
        return $query->result();
    }
    public function get_organisasi()
    {
        $query = $this->db->select("*")
                 ->from('pembuat_event')
                 ->limit('5')
                 ->get();
        return $query->result();
    }

}
