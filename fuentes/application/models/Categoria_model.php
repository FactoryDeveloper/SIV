<?php
    class Categoria_model extends CI_Model
    {
       
        public function guardar_categoria($id,$categoria,$descripcion)
        {
            $data = array(
                            'cod_categoria' => $id,
                            'categoria'     => $categoria,
                            'descripcion'   => $descripcion
                         ); 

            if($id)
            {
                $this->db->where('cod_categoria', $id);
                $this->db->update('categoria', $data);
            }
            else
            {
                $this->db->insert('categoria', $data);
            }  
        }

        public function eliminar_categoria($id)
        {
            $this->db->where('cod_categoria', $id);
            $this->db->delete('categoria');
        }

        public function ListarCategoria()
        {
            $this->db->select('cod_categoria, categoria, descripcion');
            $this->db->from('categoria');
            $this->db->order_by('categoria');
            $consulta = $this->db->get();
            $resultado = $consulta->result();
            return $resultado;
        }

        public function BuscarCategoria($id)
        {
            $this->db->select('cod_categoria, categoria, descripcion');
            $this->db->from('categoria');
            $this->db->where('cod_categoria', $id);
            $consulta = $this->db->get();
            $resultado = $consulta->row();
            return $resultado;
        }
    }
?>