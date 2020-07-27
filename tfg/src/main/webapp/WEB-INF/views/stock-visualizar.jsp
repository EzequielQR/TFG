<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>9420 - Control Comercial</title>
	<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.7/css/bootstrap.min.css"/>">
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<!-- data-target="#myNavVar" indicates the ID of the part that will be affected when the button is clicked -->
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavBar">
					<!-- Three small verticals bars inside button-->
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-left" href="#"><img src="img-snowflake48x48.png"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavBar">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Turnos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Crear Turno</a></li>
								<li><a href="#">Visualizar Turno</a></li>
							</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Usuarios<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Crear Usuario</a></li>
								<li><a href="#">Visualizar Usuarios</a></li>
							</ul>
					</li>
					<li class="dropdown active">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Registrar Producto</a></li>
								<li><a href="#">Visualizar Stock</a></li>
							</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Ezequiel Quispe Reyes</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesi�n</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<!-- /paginaAredirigir?search=T-->
		<form action="paginaAredirigir">
			<div class="input-group">
				<!-- El atributo search se va a cocatenar a la URL cuando se le ponga submit-->
				<input type="text" class="form-control" placeholder="Buscar palabras claves. Ej.: Tinta, aguja, puntera..." name="search">
				<div class="input-group-btn">
					<button class="btn btn-info" type="button" data-toggle="modal" data-target="#loginModal">
						<i class="glyphicon glyphicon-cog"></i>
					</button>
					<button class="btn btn-success" type="submit">
						<i class="glyphicon glyphicon-search"></i>
					</button>
				</div>
			</div>
		</form>
		<br><br>
		<!--
		<form action="paginaAredirigir">
			<div class="input-group">
				<input type="text" class="form-control" placeholder="Buscar palabras claves. Ej.: Tinta, aguja, puntera..." name="search">
				<div class="input-group-btn">
					<a href="#" class="btn btn-info" data-toggle="modal" data-target="#loginModal">
						<i class="glyphicon glyphicon-cog"></i>
		    		</a>
		    		<a href="funky" class="btn btn-success" type="submit">
						<i class="glyphicon glyphicon-search"></i>
		    		</a>
				</div>
			</div>
		</form>
		<br><br>
		-->
		<table class ="table table-bordered table-striped table-hover">
			<thead>
			    <tr class="warning">
			      <th class="col-md-1">C�digo Producto</th>
			      <th class="col-md-2">Fecha de Ingreso</th>
			      <th class="col-md-2">Marca</th>
			      <th class="col-md-2">Tipo de Producto</th>
			      <th class="col-md-2">Detalle</th>
			      <th class="col-md-2">Cantidad</th>
			      <th class="col-md-1">Visualizar</th>
			      <th class="col-md-1">Editar Producto</th>
			      <th class="col-md-1">Eliminar Producto</th>
			    </tr>
			  </thead>
			  <tbody>
			    <tr>
			      <th>1</th>
			      <td>4/Jun/2020</td>
			      <td>IntenZe</td>
			      <td>Tinta</td>
			      <td>Color: Lining Red Dark</td>
			      <td>17</td>
			      <td><a href="#" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span></a></td>
			      <td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
			      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			    </tr>

			    <tr>
			      <th>2</th>
			      <td>4/Jun/2020</td>
			      <td>IntenZe</td>
			      <td>Tinta</td>
			      <td>Color: Lining Red Light</td>
			      <td>4</td>
			      <td><a href="#" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span></a></td>
			      <td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
			      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			    </tr>

			    <tr>
			      <th>3</th>
			      <td>4/Jun/2020</td>
			      <td>Dynamic</td>
			      <td>Tinta</td>
			      <td>Color: Matte Black</td>
			      <td>1</td>
			      <td><a href="#" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span></a></td>
			      <td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
			      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			    </tr>

			    <tr>
			      <th>4</th>
			      <td>5/Jun/2020</td>
			      <td>Yuelong</td>
			      <td>Aguja</td>
			      <td>3RL</td>
			      <td>7</td>
			      <td><a href="#" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span></a></td>
			      <td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
			      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			    </tr>

			    <tr>
			      <th>5</th>
			      <td>5/Jun/2020</td>
			      <td>Big Wasp</td>
			      <td>Aguja</td>
			      <td>5RL</td>
			      <td>2</td>
			      <td><a href="#" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span></a></td>
			      <td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
			      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			    </tr>

			    <tr>
			      <th>6</th>
			      <td>5/Jun/2020</td>
			      <td>Dragonhawk</td>
			      <td>Aguja</td>
			      <td>5RS</td>
			      <td>9</td>
			      <td><a href="#" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span></a></td>
			      <td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
			      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			    </tr>

			  </tbody>			
		</table>
	</div>

	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
    <script src="bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
    <script src="bootstrap-datepicker/language/bootstrap-datepicker.es.min.js"></script>
    <script type="text/javascript">
    	$("#myElement").click(function(){
    		$(document).ready(function(){
    			$("#exemplo").datepicker().focus();
    		});
    	});
    </script>
    <script type="text/javascript">
    	$('#exemplo').datepicker({
    		format: 'dd/mm/yyyy',
    		language: 'es'
		});
    </script>
</body>