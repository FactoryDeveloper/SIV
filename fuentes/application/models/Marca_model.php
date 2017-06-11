<?php
    class marca_model extends CI_Model
    {
        public function __construct()
        {
            parent::Model();
        }

        public function guardar_marca($nombre_marca,$id)
        {
            $data = array(
                            'cod_marca' => $id,    
                            'marca'     => $nombre_marca
                         );
            if($id)
            {
                $this->db->where('cod_marca', $id);
                $this->db->update('marca', $data);
            }
            else
            {
                $this->db->insert('marca', $data);
            } 
        }

        public function eliminar_marca($id)
        {
            $this->db->where('cod_marca', $id);
            $this->db->delete('marca');
        }

        public ListarMarca()
        {
            $this->db->select('cod_marca, marca');
            $this->db->from('marca');
            $this->db->order_by('marca');
            $consulta = $this->db->get();
            $resultado = $consulta->result();
            return $resultado;
        }

        public function BuscarMarca($id)
        {
            $this->db->select('cod_marca,marca');
            $this->db->from('marca');
            $this->db->where('cod_marca', $id);
            $consulta = $this->db->get();
            $resultado = $consulta->row();
            return $resultado;
        }
    }
?>