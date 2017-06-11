<?php
    class Subcategoria_model extends CI_model
    {
       public function guardar_subcategoria($id,$subcategoria,$descripcion)
        {
            $data = array(
                            'cod_subcategoria' => $id,
                            'subcategoria'     => $subcategoria,
                            'descripcion'   => $descripcion
                         ); 

            if($id)
            {
                $this->db->where('cod_subcategoria', $id);
                $this->db->update('subcategoria', $data);
            }
            else
            {
                $this->db->insert('subcategoria', $data);
            }  
        }

        public function eliminar_subcategoria($id)
        {
            $this->db->where('cod_subcategoria', $id);
            $this->db->delete('subcategoria');
        }

        public function ListarSubcategoria()
        {
            $this->db->select('cod_subcategoria, subcategoria, descripcion');
            $this->db->from('subcategoria');
            $this->db->order_by('subcategoria');
            $consulta = $this->db->get();
            $resultado = $consulta->result();
            return $resultado;
        }

        public function BuscarSubcategoria($id)
        {
            $this->db->select('cod_subcategoria, subcategoria, descripcion');
            $this->db->from('subcategoria');
            $this->db->where('cod_subcategoria', $id);
            $consulta = $this->db->get();
            $resultado = $consulta->row();
            return $resultado;
        }
    }
?>