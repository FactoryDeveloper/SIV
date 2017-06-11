<link href="<?php echo base_url(); ?>assets/css/categoria.css" rel="stylesheet">
<div class="container-fluid">
      <div class="row">
        <div class="col-sm-3 col-md-2 sidebar">
          <ul class="nav nav-sidebar">
            <li class="active"><a href="#">Categorias <span class="sr-only">(current)</span></a></li>
             <?php foreach ($SubCategorias as $items){ ?>
            <li><a href="#"><?php echo $items->subcategoria; ?></a></li>        
            <?php } ?>
          </ul>
        </div>
        <div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
            <h1 class="page-header">Productos</h1>
            <div class="row placeholders">
            <?php foreach ($Productos as $items){ //$Marcas as $items2 ?>
            
            <div class="col-xs-6 col-sm-3 placeholder">
              <img src="data:image/gif;base64,R0lGODlhAQABAIAAAHd3dwAAACH5BAAAAAAALAAAAAABAAEAAAICRAEAOw==" width="200" height="200" class="img-responsive" alt="Generic placeholder thumbnail">
              <h4><?php echo $items->nombre;  ?></h4>
              <span class="text-muted"><?php echo $items->descripcion; ?></span>
            </div>
          
            <?php } ?>
          </div>
        </div>
      </div>
    </div>