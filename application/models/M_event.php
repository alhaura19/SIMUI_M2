<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class M_event extends CI_model{

    public function get_event_all()
    {
        $query = $this->db->select("*")
                 ->from('event')
                 ->order_by('tanggal', 'ASC')
                 ->get();
        return $query->result();
    }

    public function simpan($data)
    {

        $query = $this->db->insert("tbl_buku", $data);

        if($query){
            return true;
        }else{
            return false;
        }

    }

    public function _uploadPoster()
  	{
  		$config['upload_path']          = './upload/poster/';
  		$config['allowed_types']        = 'pdf|gif|jpg|png';
  		$config['file_name']            = $this->product_id;
  		$config['overwrite']						= true;
  		$config['max_size']             = 10240; // 1MB
  		// $config['max_width']            = 1024;
  		// $config['max_height']           = 768;

  		$this->load->library('upload', $config);

  		if ($this->upload->do_upload('image')) {
  			return $this->upload->data("file_name");
  		}

  		return "default.jpg";
  	}


    public function edit($id_buku)
    {

        $query = $this->db->where("id_buku", $id_buku)
                ->get("tbl_buku");

        if($query){
            return $query->row();
        }else{
            return false;
        }

    }

    public function update($data, $id)
    {

        $query = $this->db->update("tbl_buku", $data, $id);

        if($query){
            return true;
        }else{
            return false;
        }

    }

    public function hapus($id)
    {

        $query = $this->db->delete("tbl_buku", $id);

        if($query){
            return true;
        }else{
            return false;
        }

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
    public function dd_kepanitiaan()
    {
      $this->db->order_by('id_kepanitiaan','asc');
      $result = $this->db->get('kepanitiaan');

      $dd[''] = 'Pilih Kepanitiaan';
      if ($result->num_rows()>0) {
        foreach ($result->result() as $row) {
          // tentukan valuenya(selelah kiri) dan lahelnya (sebelah kanan)
          $dd[$row->id_kepanitiaan] = $row->id_kepanitiaan;
        }
      }
      return $dd;
    }
    public function dd_kategori()
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
