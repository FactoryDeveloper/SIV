<?php
    class entidad_model extends CI_Model
    {
        public function __construct()
        {
            parent::Model();
        }

        public function guardar_entidad($id,$nombre,$apellido,$celular,$estado)
        {
            $data = array(
                            'corre_electronico' => $id,
                            'nombre'            => $modelo,
                            'apellido'          => $apellido,
                            'celular'           => $celular,
                            'estado'            =>  $estado
                         ); 

            if($id)
            {
                $this->db->where('corre_electronico', $id);
                $this->db->update('entidad', $data);
            }
            else
            {
                $this->db->insert('entidad', $data);
            }  
        }

        public function eliminar_entidad($id)
        {
            $this->db->where('correo_electronico', $id);
            $this->db->delete('entidad');
        }

        public ListarEntidad()
        {
            $this->db->select('corre_electronico, nombre, apellido, celular, estado');
            $this->db->from('entidad');
            $this->db->order_by('nombre');
            $consulta = $this->db->get();
            $resultado = $consulta->result();
            return $resultado;
        }

        public function BuscarEntidad($id)
        {
            $this->db->select('corre_electronico, nombre, apellido, celular, estado');
            $this->db->from('entidad');
            $this->db->where('corre_electronico', $id);
            $consulta = $this->db->get();
            $resultado = $consulta->row();
            return $resultado;
        }
    }
?>