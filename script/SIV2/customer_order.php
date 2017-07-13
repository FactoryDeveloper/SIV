<?php
	session_start();
	if(!isset($_SESSION['uid'])){
	header('Location:index.php');
	}
 ?>

<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>VENTAS CON CARRITO DE COMPRAS</title>
	<link rel="stylesheet" type="text/css" href="assets/bootstrap-3.3.6-dist/css/bootstrap.css">
	<link rel="stylesheet" type="text/css" href="styles.css">
</head>
<body>
	<div class="navbar navbar-default navbar-fixed-top" id="topnav">
		<div class="container-fluid">
			<div class="navbar-header">
				<a href="index.php" class="navbar-brand">VENTAS CON CARRITO DE COMPRAS</a>
			</div>

			
		</div>
	</div>
	<br><br><br><br><br>
	<div class='container-fluid'>
		<div class='row'>
		<div class='col-md-2'></div>
		<div class='col-md-8'>
			<div class="panel panel-default">
  				<div class="panel-heading">Detalles de la orden de cliente</div>
  				<div class="panel-body">
    				<div class='col-md-6'><img src='assets/prod_images/iPad.jpg' style='float: right;'></div>
    				<div class='col-md-6'>
    					<table class='table table-hover'>
    					<p></p><p></p><br>
    						<tr><td><b>Producto:</b></td><td>iPad</td></tr>
    						<tr><td><b>Pricio:</b></td><td>$25000</td></tr>
    						<tr><td><b>Cantidad:</b></td><td>1</td></tr>
    						<tr><td><b>Pago:</b></td><td>Completed</td></tr>
    						<tr><td><b>Transaccion ID:</b></td><td>02259xxxxxx</td></tr>
    					</table>
    				</div>
  				</div>
			</div>
		<div class='col-md-2'></div>
	</div>

	</div>


	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="assets/bootstrap-3.3.6-dist/js/bootstrap.min.js"></script>
	<script src="main.js"></script>
</body>
</html>