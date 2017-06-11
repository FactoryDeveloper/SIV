<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Subcategoria extends CI_Controller {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
    public function __construct()
    {
    	parent::__construct();
        $this->load->model('Subcategoria_model');           
        $this->load->model('Producto_model');  
		//$this->load->model('Marca_model');  
	}
    public function index()
	{
        $data['SubCategorias'] = $this->Subcategoria_model->ListarSubcategoria();
		$data['Productos'] = $this->Producto_model->ListarProducto();
		//$data['Marcas'] = $this->Marca_model->BuscarMarca($id);
		$this->load->view('templates/head');
		$this->load->view('templates/nav');
		$this->load->view('productos/subcategoria',$data);
		$this->load->view('templates/footer');
	}
}