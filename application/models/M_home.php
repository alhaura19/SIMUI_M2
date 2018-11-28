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
                 ->from('kepanitiaan')
                 ->limit('5')
                 ->get();
        return $query->result();
    }
    public function get_organisasi()
    {
        $query = $this->db->select("*")
                 ->from('organisasi')
                 ->limit('5')
                 ->get();
        return $query->result();
    }

}
