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
	<link rel="stylesheet" href="<c:url value="/resources/bootstrap-select-1.13.18/css/bootstrap-select.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/jquery-timepicker-1.3.5/css/jquery.timepicker.min.css"/>">
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
				<a class="navbar-left" href="${pageContext.request.contextPath}/home"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavBar">
				<ul class="nav navbar-nav">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Turnos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/turno/mostrar">Crear/Visualizar Turnos</a></li>
							</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Usuarios<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/usuario/crear">Crear Usuario</a></li>
								<li><a href="${pageContext.request.contextPath}/usuario/mostrar">Visualizar Usuarios</a></li>
							</ul>
					</li>
					<li class="dropdown active">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/stock/crear">Registrar Producto</a></li>
								<li><a href="#">Visualizar Stock</a></li>
							</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">
							<span class="glyphicon glyphicon-user"></span>
							${nombre}
							<span class="caret"></span>
						</a>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal" data-target="#modalChangePassword">Cambiar Contrase�a</a></li>
						</ul>
					</li>
					<li>
						<a href="javascript:;" onclick="document.getElementById('logout-form').submit();"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Cerrar Sesi�n</a>
						<form action="${pageContext.request.contextPath}/logout" method="POST" id="logout-form"></form>
					</li>
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
		<table class ="table table-bordered table-striped table-hover">
			<thead>
			    <tr class="warning">
			      <th class="col-md-1">C�digo Producto</th>
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
			  	<c:forEach items="${listaStock}" var="producto">
			  		<tr>
			  			<th>${producto.id}</th>
			  			<td>${producto.marca.nombre}</td>
			  			<td>${producto.tipoProducto.nombre}</td>
			  			<td>${producto.caracteristica}</td>
			  			<td>${producto.cantidad}</td>
						<td><a href="#" class="btn btn-default"><span class="glyphicon glyphicon-eye-open"></span></a></td>
			      		<td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
			      		<td><a href="<spring:url value="/stock/eliminar?id-producto=${producto.id}"/>" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			  		</tr>
			  	</c:forEach>
			  </tbody>			
		</table>
	</div>
	
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/bootstrap-select.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/i18n/defaults-es_ES.min.js"/>"></script>
	<script src="<c:url value="/resources/jquery-timepicker-1.3.5/js/jquery.timepicker.min.js"/>"></script>
	<script type="text/javascript">
		//. class
		//# id
		$(document).ready(function(){
			//Comprobacion inicial
			$('.my-select').selectpicker();
			$('.input-timepicker').timepicker({
			    timeFormat: 'HH:mm',
			    interval: 30,
			    minTime: '10:00',
			    maxTime: '20:30',
			    dynamic: false,
			    dropdown: true,
			    scrollbar: true
			});
    	});
	</script>
</body>
</html>