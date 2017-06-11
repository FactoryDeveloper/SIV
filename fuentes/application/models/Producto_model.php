<?php
    class producto_model extends CI_Model
    {
        public function guardar_producto($id,$nombre,$descripcion,$imagen,$estado,$precio_nuevo,$precio_usado,$cod_modelo,$cod_subcategoria)
        {
            $data = array(
                            'cod_producto'          => $id,
                            'nombre'                => $modelo,
                            'descripcion'           => $modelo,
                            'imagen'                => $modelo,
                            'estado'                => $modelo,
                            'precio_nuevo'          => $modelo,
                            'precio_usado'          => $modelo,
                            'cod_modelo'            => $modelo,
                            'cod_subcategoria'      => $modelo
                         ); 

            if($id)
            {
                $this->db->where('cod_producto', $id);
                $this->db->update('producto', $data);
            }
            else
            {
                $this->db->insert('producto', $data);
            }  
        }

        public function eliminar_producto($id)
        {
            $this->db->where('cod_producto', $id);
            $this->db->delete('producto');
        }

        public function ListarProducto()
        {
            $this->db->select('cod_producto, nombre, descripcion, imagen, estado, precio_nuevo, precio_usado, cod_modelo, cod_subcategoria');
            $this->db->from('producto');
            $this->db->order_by('nombre');
            $consulta = $this->db->get();
            $resultado = $consulta->result();
            return $resultado;
        }

        public function BuscarProducto($id)
        {
            $this->db->select('cod_producto, nombre,descripcion, imagen, estado, precio_nuevo, precio_usado, cod_modelo, cod_subcategoria');
            $this->db->from('producto');
            $this->db->where('cod_producto', $id);
            $consulta = $this->db->get();
            $resultado = $consulta->row();
            return $resultado;
        }
    }
?>