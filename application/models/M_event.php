<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_event extends CI_model{

  public function get_event_all()
  {
    //select p.nama as nama_or,e.nama,e.tanggal,e.waktu,e.kapasitas,e.harga_tiket,e.lokasi,e.sifat_event,e.deskripsi_singkat,k.nama as nama_kategori
    // from simui.event e join simui.kategori_event k on e.nomor_kategori=k.nomor join simui.pembuat_event p on e.id_pembuat_event = p.id;
    $query = $this->db->select("e.nomor_kategori,e.id_pembuat_event,e.id_event,p.nama as nama_or,
    e.nama,e.tanggal,e.waktu,e.kapasitas,e.harga_tiket,
    e.lokasi,e.sifat_event,e.deskripsi_singkat,k.nama as nama_kategori,e.jumlah_pendaftar")
    ->from('event as e')
    ->join('kategori_event as k','e.nomor_kategori = k.nomor')
    ->join('pembuat_event as p','e.id_pembuat_event = p.id')
    ->order_by('tanggal', 'ASC')
    ->get();
    return $query->result();
  }

  public function insert($data)
  {

    $query = $this->db->insert("event", $data);

    if($query){
      return true;
    }else{
      return false;
    }

  }


  public function update($data, $id_event)
  {

    $query = $this->db->update("event", $data, $id_event);

    if($query){
      return true;
    }else{
      return false;
    }

  }

  public function hapus($id_event)
  {
    $query = $this->db->delete('event',array('id_event' => $id_event));

    if($query){
      return true;
    }else{
      return false;
    }

  }

  //fungsi ini untuk mengambil data form dropdown organisasi
  public function dd_organisasi()
  {
    $this->db->order_by('nama','asc');
    $result = $this->db->get('pembuat_event');

    $dd[''] = 'Pilih Organisasi';
    if ($result->num_rows()>0) {
      foreach ($result->result() as $row) {
        // tentukan valuenya(selelah kiri) dan lahelnya (sebelah kanan)
        $dd[$row->id] = $row->nama;
      }
    }
    return $dd;
  }

  public function dd_kepanitiaan()
  //fungsi ini untuk mengambil data form dropdown kepanitiaan
  {
    $this->db->order_by('tanggal_dibuka','asc');
    $result = $this->db->get('open_recruitment');

    $dd[''] = 'Pilih Kepanitiaan';
    if ($result->num_rows()>0) {
      foreach ($result->result() as $row) {
        // tentukan valuenya(selelah kiri) dan lahelnya (sebelah kanan)
        $dd[$row->id_oprec] = $row->nama;
      }
    }
    return $dd;
  }
  public function dd_kategori()
  //fungsi ini untuk mengambil data form dropdown kategori
  {
    $this->db->order_by('nomor','asc');
    $result = $this->db->get('kategori_event');

    $dd[''] = 'Pilih Kategori Event';
    if ($result->num_rows()>0) {
      foreach ($result->result() as $row) {
        // tentukan valuenya(selelah kiri) dan lahelnya (sebelah kanan)
        $dd[$row->nomor] = $row->nama;
      }
    }
    return $dd;
  }


}
