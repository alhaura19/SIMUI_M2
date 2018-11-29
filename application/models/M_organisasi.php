<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_home extends CI_model{

    public function get_organisasi_all()
    {
        $query = $this->db->select("*")
                 ->from('organisasi')
                 ->get();
        return $query->result();
    }
	
    public function dd_organisasi()
	{
		$this->db->order_by('id_organisasi','asc');
		$result = $this->db->get('organisasi');
		$dd[''] = 'Pilih Organisasi';

		if ($result->num_rows()>0) {
			foreach ($result->result() as $row) {
			// tentukan valuenya(selelah kiri) dan lahelnya (sebelah kanan)
				$dd[$row->id_organisasi] = $row->id_organisasi;
			}
		}
		return $dd;
	}

}
