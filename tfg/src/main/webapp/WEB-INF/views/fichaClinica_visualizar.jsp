<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>9420 - Control Comercial</title>
	<link rel="icon" href="<c:url value="/resources/img/favicon.ico"/>">
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
				<a class="navbar-left" href="#"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavBar">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Turnos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Crear Turno</a></li>
								<li><a href="#">Visualizar Turnos</a></li>
							</ul>
					</li>
					<li class="dropdown active">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Usuarios<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Crear Usuario</a></li>
								<li><a href="#">Visualizar Usuarios</a></li>
							</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Registrar Producto</a></li>
								<li><a href="#">Visualizar Stock</a></li>
							</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${nombre}</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		
		<a href="#" class="btn btn-success" role="button">
			<span class="glyphicon glyphicon-pencil"></span>
			Editar Ficha Clínica
		</a>
		<a href="#" class="btn btn-danger" role="button">
			<span class="glyphicon glyphicon-trash"></span>
			Eliminar Ficha Clínica
		</a>
		
		<br><br>
		<div class="panel-group" id="accordion">
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
						Ficha clínica: General</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">
					
						<table class ="table table-bordered table-striped table-hover">
							<thead>
				    			<tr>
				    				<th class="col-md-2">Apellido y Nombre</th>
				      				<th class="col-md-2">Grupo Sanguíneo</th>
				      				<th class="col-md-1">Factor RH</th>
				      				<th class="col-md-3">Alergias</th>
				      				<th class="col-md-2">Problemas Cardíacos</th>
				      				<th class="col-md-2">Comentarios</th>
				    			</tr>
				  			</thead>
				  			<tbody>
				  				<c:forEach items="${personas}" var="persona">
					    			<tr>
					    				<td>${persona.apellido}, ${persona.nombre}</td>
					      				<th>${persona.id}</th>
					      				<td>${persona.rol.nombre}</td>
					      				<td>${persona.apellido}, ${persona.nombre}</td>
					      				<td>${persona.telefono}</td>
					      				<td></td>
					    			</tr>
				 	 			</c:forEach>
				  			</tbody>
						</table>
					
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
						Ficha clinica: Piel</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
					
						<table class ="table table-bordered table-striped table-hover">
							<thead>
				    			<tr>
				      				<th class="col-md-1">Psoriasis</th>
				      				<th class="col-md-1">Eccema</th>
				      				<th class="col-md-1">Queloide</th>
				      				<th class="col-md-9">Comentarios</th>
				    			</tr>
				  			</thead>
				  			<tbody>
				  				<c:forEach items="${personas}" var="persona">
					    			<tr>
					      				<th>${persona.id}</th>
					      				<td>${persona.rol.nombre}</td>
					      				<td>${persona.apellido}, ${persona.nombre}</td>
					      				<td></td>
					    			</tr>
				 	 			</c:forEach>
				  			</tbody>
						</table>
						
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
						Ficha clínica: ETS</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
					
						<table class ="table table-bordered table-striped table-hover">
							<thead>
				    			<tr>
				      				<th class="col-md-1">VIH</th>
				      				<th class="col-md-1">Sifilis</th>
				      				<th class="col-md-1">Hepatitis B</th>
				      				<th class="col-md-1">HPV</th>
				      				<th class="col-md-8">Comentarios</th>
				    			</tr>
				  			</thead>
				  			<tbody>
				  				<c:forEach items="${personas}" var="persona">
					    			<tr>
					      				<th>${persona.id}</th>
					      				<td>${persona.rol.nombre}</td>
					      				<td>${persona.apellido}, ${persona.nombre}</td>
					      				<td>${persona.telefono}</td>
					      				<td></td>
					    			</tr>
				 	 		</c:forEach>
				  		</tbody>
					</table>
					
				</div>
			</div>
		</div>
	</div>
		
	</div>
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
</body>
</html>