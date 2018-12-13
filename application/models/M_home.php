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
        $query = $this->db->select("p.nama")
                 ->from('pembuat_event as p')
                 ->join('kepanitiaan as k','p.id = k.id_kepanitiaan')
                 ->order_by('p.nama','ASC')
                 ->limit('5')
                 ->get();
        return $query->result();
    }
    public function get_organisasi()
    {
        $query = $this->db->select("p.nama")
                 ->from('pembuat_event as p')
                 ->join('organisasi as o','o.id_organisasi = p.id')
                 ->order_by('p.nama','ASC')
                 ->limit('5')
                 ->get();
        return $query->result();
    }

}
