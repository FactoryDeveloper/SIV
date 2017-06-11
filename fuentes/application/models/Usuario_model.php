<?php
    class usuario_model extends CI_Model
    {
        public function __construct()
        {
            parent::Model();
        }

        public function guardar_usuario($id,$contraseña,$tipo_usuario)
        {
            $data = array(
                            'correo_electronico'    => $id,
                            'contraseña'            => $modelo,
                            'tipo_usuario'          => $tipo_usuario
                         ); 

            if($id)
            {
                $this->db->where('correo_electronico', $id);
                $this->db->update('usuario', $data);
            }
            else
            {
                $this->db->insert('usuario', $data);
            }  
        }

        public function eliminar_usuario($id)
        {
            $this->db->where('correo_electronico', $id);
            $this->db->delete('usuario');
        }

        public ListarUsuario()
        {
            $this->db->select('correo_electronico, contraseña, tipo_usuario');
            $this->db->from('usuario');
            $this->db->order_by('correo_electronico');
            $consulta = $this->db->get();
            $resultado = $consulta->result();
            return $resultado;
        }

        public function BuscarUsuario($id)
        {
            $this->db->select('correo_electronico, contraseña, tipo_usuario');
            $this->db->from('usuario');
            $this->db->where('correo_electronico', $id);
            $consulta = $this->db->get();
            $resultado = $consulta->row();
            return $resultado;
        }
    }
?>