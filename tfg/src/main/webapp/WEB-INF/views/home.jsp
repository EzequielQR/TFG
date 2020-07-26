<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
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
				<a class="navbar-left" href="#"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavBar">
				<ul class="nav navbar-nav">

					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Turnos<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Gestión</a></li>
							</ul>
					</li>

					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Clientes<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Gestión</a></li>
							</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos<b class="caret"></b></a>
							<ul class="dropdown-menu">
								<li><a href="#">Gestión</a></li>
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
		<section class="main row">

			<h1 style="text-align:center">Turnos asignados para hoy:</h1>
			<br>

			<c:forEach items="${list}" var="item">
				<div class="col-md-4 col-lg-4">
					<div class = "panel panel-primary">
					   
					   <div class ="panel-heading">
					   		<h3 style="text-align:center;">${item.pseudonimo}</h3>
					   </div>
	
					   <div class = "panel-body">
					   		<p style="text-align:center;">Turnos confirmados:</p>
	
							<c:forEach items="${item.turnos}" var="turnos">
							    <ul class = "list-group list-group-flush">
							   		<li class="list-group-item">
							   			<i class="glyphicon glyphicon-calendar"></i>
							   			&nbsp;<fmt:formatDate type="both" value="${turnos.fechaInicio}"
							   			timeStyle="short"/>
							   			<b>-&nbsp;${turnos.cliente.persona.apellido},&nbsp;${turnos.cliente.persona.nombre}:</b>
							   			${turnos.descripcion}
							   		</li>
							  	</ul>
						  	</c:forEach>
					   </div>
					   
					</div>
				</div>
			</c:forEach>
			
		</section>
	</div>
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
</body>
</html>