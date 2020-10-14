<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
				<a class="navbar-left" href="#"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavBar">
				<ul class="nav navbar-nav">
					<li class="dropdown active">
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
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/stock/crear">Registrar Producto</a></li>
								<li><a href="${pageContext.request.contextPath}/stock/mostrar">Visualizar Stock</a></li>
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
							<li><a href="#" data-toggle="modal" data-target="#modalChangePassword">Cambiar Contraseña</a></li>
						</ul>
					</li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
	
		<h1 style="text-align:center">
			Asistente de diseño de tatuajes:&nbsp;<strong><c:out value="${estilo}"/>.</strong>
			<small><c:out value="${query}"/></small>
		</h1>
		<br>
		<form:form class="form-horizontal" method="GET">
		
			<input type="hidden" name="id-turno" value="${idTurno}">
			<input type="hidden" name="estilo" value="${estilo}">
			
			<div class="form-group">
				<label for="input-search" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 control-label">Búsqueda:</label>
			    <div class="col-lg-8 col-md-8 col-sm-8 col-xs-7">
			     <input type="text" class="form-control" id="input-search" 
			     placeholder="Ingresar palabras claves separadas por espacios. Ejemplo: Pez Koi Color"
			     name="query">
			    </div>
			    <div class="col-lg-2 col-md-2 col-sm-2 col-xs-3">
			    	<button type="submit" class="btn btn-primary" id="btnSubmit" name="action" value="search">
						<span class="glyphicon glyphicon-search"></span>
						Buscar
					</button>
			    </div>
			</div>
		
		</form:form>
		<br>
		
		<section class="main row">

				<c:forEach items="${listImg}" var="listItem">
					<div class="col-xs-6 col-md-4 col-lg-4">
						<div class="panel panel-default">
		            		<div class="panel-body">
		            			<a href='<c:out value="${listItem}"/>' target="_blank">
			                		<img style="width:365px;height:335px" src='<c:out value="${listItem}"/>' 
			                		class="img-responsive img-rounded">
			                	</a>
			            	</div>
			            	<div class="panel-footer">
			            		<a href="<c:url value="/panel-asistente/guardar?id-turno=${idTurno}&img=${listItem}"/>"
			            		 class="btn btn-lg btn-block btn-success"> 
			            			<span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir
			            		</a>
			            	</div>
		        		</div>
					</div>
				</c:forEach>

		</section>
	</div>
	
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/bootstrap-select.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/i18n/defaults-es_ES.min.js"/>"></script>
	<script src="<c:url value="/resources/jquery-timepicker-1.3.5/js/jquery.timepicker.min.js"/>"></script>
</body>
</html>