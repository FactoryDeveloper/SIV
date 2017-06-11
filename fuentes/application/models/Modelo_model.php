<?php
    class modelo_model extends CI_Model
    {
        public function __construct()
        {
            parent::Model();
        }

        public function guardar_modelo($id,$modelo)
        {
            $data = array(
                            'cod_modelo' => $id,
                            'modelo'     => $modelo
                         ); 

            if($id)
            {
                $this->db->where('cod_modelo', $id);
                $this->db->update('modelo', $data);
            }
            else
            {
                $this->db->insert('modelo', $data);
            }  
        }

        public function eliminar_modelo($id)
        {
            $this->db->where('cod_modelo', $id);
            $this->db->delete('modelo');
        }

        public ListarModelo()
        {
            $this->db->select('cod_modelo, modelo');
            $this->db->from('modelo');
            $this->db->order_by('modelo');
            $consulta = $this->db->get();
            $resultado = $consulta->result();
            return $resultado;
        }

        public function BuscarModelo($id)
        {
            $this->db->select('cod_modelo, modelo');
            $this->db->from('modelo');
            $this->db->where('cod_modelo', $id);
            $consulta = $this->db->get();
            $resultado = $consulta->row();
            return $resultado;
        }
    }
?>