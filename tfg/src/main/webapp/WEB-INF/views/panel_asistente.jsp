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
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${nombre}</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
		
		<!-- Insert your own Programmable Search Engine ID here -->
		<script src="https://cse.google.com/cse.js?cx=894f345ef3f3a3b75"></script>

		<div class="gcse-searchbox"></div>
		<div class="gcse-searchresults" data-defaultToImageSearch="true" data-disableWebSearch="true"></div>

		
		<h1 style="text-align:center">Asistente de diseño de tatuajes: <strong>Oriental.&nbsp;</strong><small>Flores&nbsp;(Peonías).</small></h1>
		<br>

		<section class="main row">

			<div class="col-xs-6 col-md-4 col-lg-4">
				<div class="panel panel-default">
            		<div class="panel-body">
            			<a href="https://i.pinimg.com/474x/9b/52/c2/9b52c2fe731a2574a1efacd5d5e3a518--tattos.jpg" target="_blank">
	                		<img style="width:365px;height:335px" src="https://i.pinimg.com/474x/9b/52/c2/9b52c2fe731a2574a1efacd5d5e3a518--tattos.jpg" class="img-responsive img-rounded">
	                	</a>
	            	</div>
	            	<div class="panel-footer">
	            		<button class="btn btn-lg btn-block btn-success"><span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir</button>
	            	</div>
        		</div>
			</div>

			<div class="col-xs-6 col-md-4 col-lg-4">
				<div class="panel panel-default">
            		<div class="panel-body">
	                	<img style="width:365px;height:335px" src="https://i.pinimg.com/474x/77/20/bf/7720bfcaa6f88b70850b47e0f9f9253d.jpg" class="img-responsive img-rounded">
	            	</div>
	            	<div class="panel-footer">
	            		<button class="btn btn-lg btn-block btn-success"><span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir</button>
	            	</div>
        		</div>
			</div>

			<div class="col-xs-6 col-md-4 col-lg-4">
				<div class="panel panel-default">
            		<div class="panel-body">
	                	<img style="width:365px;height:335px" src="https://i.pinimg.com/474x/38/4a/ed/384aedfff87bbf068b00c0cb973c3cee.jpg" class="img-responsive img-rounded">
	            	</div>
	            	<div class="panel-footer">
	            		<button class="btn btn-lg btn-block btn-success"><span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir</button>
	            	</div>
        		</div>
			</div>

			<div class="col-xs-6 col-md-4 col-lg-4">
				<div class="panel panel-default ">
            		<div class="panel-body">
	                	<img style="width:365px;height:335px" src="https://i.pinimg.com/736x/21/8e/eb/218eebef34641fcdcd696d2caf90ff5d.jpg" class="img-responsive img-rounded">
	            	</div>
	            	<div class="panel-footer">
	            		<button class="btn btn-lg btn-block btn-success"><span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir</button>
	            	</div>
        		</div>
			</div>

			<div class="col-xs-6 col-md-4 col-lg-4">
				<div class="panel panel-default">
            		<div class="panel-body">
	                	<img style="width:365px;height:335px" src="https://i.pinimg.com/474x/9a/c9/de/9ac9de3c623398afa5dd7a233a767be9--lotus-flower-design-flower-designs.jpg" class="img-responsive img-rounded">
	            	</div>
	            	<div class="panel-footer">
	            		<button class="btn btn-lg btn-block btn-success"><span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir</button>
	            	</div>
        		</div>
			</div>

			<div class="col-xs-6 col-md-4 col-lg-4">
				<div class="panel panel-default">
            		<div class="panel-body">
	                	<img style="width:365px;height:335px" src="https://i.pinimg.com/474x/e5/7f/c0/e57fc00ea7e615e7093289927b98f893--tattoo-sketchbook-sketch-tattoo.jpg" class="img-responsive img-rounded">
	            	</div>
	            	<div class="panel-footer">
	            		<button class="btn btn-lg btn-block btn-success"><span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir</button>
	            	</div>
        		</div>
			</div>
			
		</section>
	</div>
	
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/bootstrap-select.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/i18n/defaults-es_ES.min.js"/>"></script>
	<script src="<c:url value="/resources/jquery-timepicker-1.3.5/js/jquery.timepicker.min.js"/>"></script>
</body>
</html>