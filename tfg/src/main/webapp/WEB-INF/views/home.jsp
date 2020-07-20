<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>9420 - Control Comercial</title>
	<!-- 
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	-->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
					<!--
					<li>
						<a href="#">Estadísticas</a>
					</li>
					-->

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

			<div class="col-md-4 col-lg-4">
				<div class = "panel panel-primary">
				   
				   <div class ="panel-heading">
				   		<h3 style="text-align:center;">Dra</h2>
				   </div>

				   <div class = "panel-body">
				   		<p style="text-align:center;">Turnos confirmados:</p>

					    <ul class = "list-group list-group-flush">
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;09:30-11:30 -&nbsp;<b>Reyes, Ezequiel: </b>Japonés en pierna.</li>
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;12:30-14:30 -&nbsp;<b>Sanchez, Nicolas: </b>Realismo en espalda.</li>
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;15:30-19:00 -&nbsp;<b>Campos, Marcos: </b>Realismo en pierna.</li>
					  	</ul>
				   </div>
				   
				</div>
			</div>

			<div class="col-md-4 col-lg-4">
				<div class = "panel panel-primary">
				   
				   <div class ="panel-heading">
				   		<h3 style="text-align:center">Marchi Renzo</h2>
				   </div>
				   
				   <div class = "panel-body">
				   		<p style="text-align:center;">Turnos confirmados:</p>

					    <ul class = "list-group list-group-flush">
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;10:30-12:00 -&nbsp;<b>Bolatti, Mario: </b>Trash Polka en muslo.</li>
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;18:30-20:30 -&nbsp;<b>Perez, Adriana: </b>Lettering en antebrazo.</li>
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;21:00-21:30 -&nbsp;<b>Ramonda, Charles: </b>New School en rodilla.</li>
					   	</ul>
				   </div>
				 
				</div>
			</div>

			<div class="col-md-4 col-lg-4">
				<div class = "panel panel-primary">
				   
				   <div class ="panel-heading">
				   		<h3 style="text-align:center">NQK</h2>
				   </div>
				   
				   <div class = "panel-body">
				      	<p style="text-align:center;">Turnos confirmados:</p>

					    <ul class = "list-group list-group-flush">
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;11:00-13:30 -&nbsp;<b>Vázquez, Franco: </b>Blackwork en pierna.</li>
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;15:30-18:30 -&nbsp;<b>Suarez, Matías: </b>Old School en pierna.</li>
					   		<li class="list-group-item"><i class="glyphicon glyphicon-calendar"></i>&nbsp;19:00-21:00 -&nbsp;<b>Herrera, Guido: </b>Neotradicional en pierna.</li>
					   	</ul>
				   </div>
				   
				</div>
			</div>
		</section>
	</div>

	<script src="bootstrap/js/jquery.js"></script>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>