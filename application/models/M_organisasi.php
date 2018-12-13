<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_organisasi extends CI_model{

  public function get_organisasi_all()
  {
    $query = $this->db->select("*")
    ->from('pembuat_event as p')
    ->join('organisasi as o','o.id_organisasi = p.id','natural')
    ->get();
    return $query->result();
  }

  //fungsi update data, pastikan data di table organisasi
  //on update cascade
  public function update($data, $id)
  {
    $query = $this->db->update("pembuat_event", $data, $id);

    if($query){
      return true;
    }else{
      return false;
    }

  }
  // fungsi insert data
  public function insert($data)
  {
    $query = $this->db->insert("pembuat_event", $data);
    if($query){
      $id_organisasi = array(
        'id_organisasi' => $this->db->insert_id('simui.table_pembuat_event_id_seq'),
      );
      $this->db->insert('organisasi',$id_organisasi);
      return true;
    }else{
      return false;
    }
  }

  public function hapus($id)
  //untuk hapus data organisasi dilakukan di dua tabel, tabel organisasi
  // dan tabel pembuat_event
  {
    $query = $this->db->delete('organisasi',array('id_organisasi' => $id));
    if($query){
      //jika berhasil baru delete data organisasi pada tabel pembuat_event
      $this->db->delete('pembuat_event',array('id' => $id ));
      return true;
    }else{
      return false;
    }

  }
}
