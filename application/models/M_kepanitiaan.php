<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_kepanitiaan extends CI_model{
	// SELECT p.id, p.nama, p.email, p.alamat_website, p.tingkatan, p.kategori, p.logo, p.deskripsi, p.contact_person, k.id_kepanitiaan,
	// k.id_organisasi, po.nama as organisasi  FROM simui.pembuat_event p join simui.kepanitiaan k on p.id = k.id_kepanitiaan
	// join simui.pembuat_event po on k.id_organisasi = po.id;
	public function get_kepanitiaan_all()
	{
		$query = $this->db->select("p.id, p.nama, p.email, p.alamat_website, p.tingkatan, p.kategori,
		p.logo, p.deskripsi, p.contact_person, k.id_kepanitiaan, k.id_organisasi, po.nama as organisasi")
				->from('pembuat_event as p')
				->join('kepanitiaan as k','p.id = k.id_kepanitiaan')
				->join('pembuat_event as po', 'k.id_organisasi = po.id')
				->order_by('p.nama', 'ASC')
				->get();
		return $query->result();
	}

	public function dd_organisasi()
  { //ini adalah fungsi untuk mengambil data organisasi dalam tabel pembuat_event join dengan organisasi
    // $this->db->order_by('nama','asc');
    // $result = $this->db->get('pembuat_event');
    $query = $this->db->select('*')
							->from('pembuat_event as p')
							->join('organisasi as o','p.id=o.id_organisasi')
							->order_by('p.nama','ASC')
							->get();

    return $query->result();
  }

	// fungsi insert data
	public function insert($data,$data_tabel_kepanitiaan)
	{
		$query = $this->db->insert("pembuat_event", $data);
		if($query){
			$data_kepanitiaan = array(
				'id_kepanitiaan' => $this->db->insert_id('simui.table_pembuat_event_id_seq'),
				'id_organisasi'	=> $data_tabel_kepanitiaan,
			);
			$this->db->insert('kepanitiaan',$data_kepanitiaan);
			return true;
		}else{
			return false;
		}
	}

	//fungsi update data, pastikan data di table kepanitiaan
  //on update cascade
  public function update($data, $id, $id_organisasi_pengawas)
  {
    $query = $this->db->update("pembuat_event", $data, $id);

    if($query){
			$data_kepanitiaan = array(
				'id_organisasi' 	=> $id_organisasi_pengawas,
			);
      // update organisasi pengawas kepanitiaan di tabel kepanitiaan
			$this->db->where('id_kepanitiaan',$id['id']);
			$this->db->update("kepanitiaan",$data_kepanitiaan);
      return true;
    }else{
      return false;
    }

  }

	public function hapus($id)
  //untuk hapus data kepanitiaan dilakukan di dua tabel, tabel kepanitiaan
  // dan tabel pembuat_event
  {
    $query = $this->db->delete('kepanitiaan',array('id_organisasi' => $id));
    if($query){
      //jika berhasil baru delete data kepanitiaan pada tabel pembuat_event
      $this->db->delete('pembuat_event',array('id' => $id ));
      return true;
    }else{
      return false;
    }

  }
}
