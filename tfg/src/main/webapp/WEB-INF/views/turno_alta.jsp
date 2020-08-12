<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>9420 - Control Comercial</title>
	<link rel="icon" href="<c:url value="/resources/img/favicon.ico"/>">
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">

	<!--https://developer.snapappointments.com/bootstrap-select/examples/-->
	<!-- Bootstrap-Select-->
	<link rel="stylesheet" href="bootstrap-select/dist/css/bootstrap-select.min.css">

	<!-- Calendar: Mas facil con jQuery UI-->
	<link href="css/bootstrap-datetimepicker.min.css" rel="stylesheet">

	<!-- CalV0
	<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css" rel="stylesheet">
	-->
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
					<li class="dropdown active">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Turnos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Crear Turno</a></li>
								<li><a href="#">Visualizar Turnos</a></li>
							</ul>
					</li>
					<li class="dropdown">
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
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> Ezequiel Quispe Reyes</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		<h1>Crear Turno</h1>

		<form action="#" method="post">

			<div class="form-group">
				<label for="inputName">Turno iniciado por</label>
				<input type="text" class="form-control" id="inputName" placeholder="Ezequiel Quispe Reyes" disabled="true">
			</div>

			<div class="form-group row"><!-- Padre-->
				<div class="form-inline col-lg-6">
					<label for="inputCal">Fecha:&nbsp;</label>
					<div class="input-group date" id="divMiCalendario">
				    	<input type='text' id="txtFecha" class="form-control" placeholder="Seleccione fecha">
				        <span class="input-group-addon">
				        	<span class="glyphicon glyphicon-calendar"></span>
				        </span>
				    </div>
				</div>

				<div class="form-inline col-lg-6">
					<label for="inputCal">Hora:&nbsp;</label>
					<div class="input-group date" id="divMiCalendario">
				    	<input type='text' id="txtFecha" class="form-control" placeholder="Seleccione hora">
				        <span class="input-group-addon">
				        	<span class="glyphicon glyphicon-dashboard"></span>
				        </span>
				    </div>
				</div>
			</div><!-- Padre -->

			<!-- Cal v0
			<div class="form-group">
				<label>Fecha</label>
					<div class="dates">
						<div class="input-group date">
							<input type="text" autocomplete="off" id="user1" class="form-control" placeholder="Seleccione fecha">
							<span class="input-group-addon">
					        	<span class="glyphicon glyphicon-calendar"></span>
					        </span>
					    </div>
					</div>
			</div>
			-->
			<div class="form-group">
			    <label for="inputTattoist">Tatuador</label>
			    <select class="form-control" name="" id="inputTattoist">
			    	<option value="">Renzo Marchi</option>
			    </select>
  			</div>

  			<!-- Para realizar la búsqueda se utiliza Select2-->
  			
  			<div class="form-group">
  				<label for="inputCli2">Cliente</label>
	  			<select class="form-control selectpicker" data-live-search="true">
					<option>Olave, Juan</option>
				</select>
			</div>

  			<div class="form-group">
				<label for="senia">Seña:&nbsp;$</label>
				<input class="form-control" id="senia" type="text" placeholder="Ingrese solo números:">
			</div>

			<div class="form-group">
			    <label for="inputPri">Seleccione prioridad</label>
			    <select class="form-control" id="inputPri">
			    	<option>Normal</option>
			      	<option>Alta</option>
			    </select>
  			</div>

  			 <div class="form-group">
  			 	<label for="inputDescripci">Descripción:</label>
				<textarea class="form-control" rows="5" id="inputDescri" placeholder="Escriba la descripción:"></textarea>
			</div> 

			<div class="form-inline">
				<div class="form-group"><b><button type="submit" class="btn btn-primary">Agregar</button></b></div>
				<div class="form-group"></div><b><button type="submit" class="btn btn-success">Usar asistente de diseño</button></b></div>
			</div>

		</form>



	</div>
	<br>

	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="bootstrap-select/dist/js/bootstrap-select.min.js"></script>

	<!-- SOLAMENTE FUNCIONA CON VERSIONES ANTERIORES A 2.7.0 -->
   <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js"></script>
   <script src="js/bootstrap-datetimepicker.min.js"></script>
   <script src="js/bootstrap-datetimepicker.es.js"></script>


   <!-- CALv0
   <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>
	-->

	<script type="text/javascript">
		$( document ).ready(function() {
		    console.log("ready!");
		    $('.my-select').selectpicker();
		});
	</script>

   <script type="text/javascript">
     $('#divMiCalendario').datetimepicker({
         pickTime : false
      });
   </script>
   <!--CALv0
   <script type="text/javascript">
   	$(function(){
	   	$('.dates #user1').datepicker({
	   		'format':'yyyy-mm-dd',
	   		'autoclose':true
	   	});
	});
   </script>
	-->
</body>
</html>