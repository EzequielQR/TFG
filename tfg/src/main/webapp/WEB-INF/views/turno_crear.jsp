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
	
	<!-- Bootstrap Select -->
	<!-- https://developer.snapappointments.com/bootstrap-select/ -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/css/bootstrap-select.min.css"/>
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
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${nombre}</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="main row">
			<form:form method="POST" id="myForm">
				<fieldset>
					<legend>Crear Turno</legend>
					
					<div class="form-group">
						<label for="inputName">Turno iniciado por</label>
						<input type="text" class="form-control" id="inputName" 
						placeholder="Ezequiel Quispe Reyes" disabled="disabled"/>
					</div>
					
					<!-- Padre-->
					<div class="form-group row">
					
						<div class="form-inline col-lg-3 col-md-3 col-sm-3">
							<label for="input-fecha">Fecha:&nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-calendar"></span>
								</div>
								<!-- Convert String to Date -->
								<fmt:parseDate value="${fecha_hidden}" pattern="yyyy-MM-dd" var="parse_date"/>
								<input type="text" class="form-control" id="input-fecha" 
								value="<fmt:formatDate pattern='dd/MMM/yyyy' value ='${parse_date}'/>" disabled="disabled">
							</div>
						</div>
						
						<div class="form-inline col-lg-3 col-md-3 col-sm-3">
							<label for="input-hora">Hora:&nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span class="glyphicon glyphicon-dashboard"></span>
								</div>
							    <input type="text" class="form-control" id="input-hora" placeholder="Seleccione hora">
						    </div>
						</div>
						
						<div class="form-inline col-lg-3 col-md-3 col-sm-3">
							<label for="advance-payment">Seña:&nbsp;</label>
							<div class="input-group">
								<div class="input-group-addon">
									<span>$</span>
								</div>
								<input type="text" class="form-control" id="advance-payment" placeholder="Ingrese solo números">
							</div>
						</div>
	
						<div class="form-inline col-lg-3 col-md-3 col-sm-3">
				    		<label for="tipoCategoria">Prioridad:&nbsp;</label>
				    		<select class="form-control" id="tipoCategoria" name="prioridadId">
				      			<c:forEach items="${listaPrioridades}" var="prioridad">
									<option value="${prioridad.id}">${prioridad.nombre}</option>
								</c:forEach>
				    		</select>
	  					</div>
						
					</div>
					<!-- Padre -->
					
					<div class="form-group">
			    		<label for="tatuador">Tatuador:</label>
			    		<select class="form-control" id="tatuador" name="tatuadorId">
			    			<c:forEach items="${listaTatuadores}" var="tattooist">
								<option value="${tattooist.id}">${tattooist.pseudonimo}</option>
							</c:forEach>
			    		</select>
  					</div>

  					<!-- Para realizar la búsqueda se utiliza Select2-->
  					<div class="form-group">
  						<label for="inputCli2">Cliente:</label>
	  					<select class="form-control selectpicker" id="inputCli2" name="clienteId" data-live-search="true" title="Buscar por nombre, apellido o número de documento">
							<c:forEach items="${listaClientes}" var="client">
								<option value="${client.id}" data-tokens="${client.persona.numeroDocumento}">
									${client.persona.apellido}, ${client.persona.nombre}
								</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
		  			 	<label for="inputDescripci">Descripción:</label>
						<textarea class="form-control" rows="5" id="inputDescri" placeholder="Escriba la descripción:"></textarea>
					</div>
					
					<div class="form-group">
					
						<button type="submit" class="btn btn-primary" id="btnSubmit" name="action" value="save">
							<span class="glyphicon glyphicon-plus"></span>
							Agregar
						</button>
						
						<button type="submit" class="btn btn-success" id="btnAssistant" name="action" value="assistant">
							<span class="glyphicon glyphicon-search"></span>
							Usar asistente de diseño
						</button>
					
					</div>
					
				</fieldset>
			</form:form>
		</div>
	</div>
	
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/bootstrap-select.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.13.18/js/i18n/defaults-es_ES.min.js"></script>
	<script type="text/javascript">
		//. class
		//# id
		$(document).ready(function(){
			//Comprobacion inicial
			$('.my-select').selectpicker();
    	});
	</script>
</body>
</html>