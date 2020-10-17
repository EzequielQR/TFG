<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
								<li><a href="${pageContext.request.contextPath}/turno/mostrar">Crear/Visualizar Turnos</a></li>
							</ul>
					</li>
					<li class="dropdown active">
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
		<div class="main row">
			<form:form method="POST" modelAttribute="persona" id="myForm">
				<fieldset>
					<legend>Editar Usuario</legend>
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="inputName">Nombre</label>
								<form:input path="nombre" class="form-control" type="text" id="inputName" placeholder="Ingrese su nombre" required="required"/>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputApellido">Apellido</label>
								<form:input path="apellido" class="form-control" type="text" id="inputApellido" placeholder="Ingrese su apellido" required="required"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="tipoUser">Seleccione el rol</label>
								<select class="form-control" id="tipoUsuario" disabled="disabled">
									<option>${persona.rol.nombre}</option>
								</select>
							</div>
							<input type="hidden" name="usuarioRol" value="${persona.rol.nombre}">
							
							<div class="col-lg-6 col-md-6">
								<label for="inputAlias">Alias</label>
								<c:choose>
									<c:when test="${fn:toLowerCase(persona.rol.nombre) == fn:toLowerCase('TATUADOR')}">
										<input type="text" class="form-control" name="tatuadorAlias" id="inputAlias" 
										value="${alias}">
									</c:when>
									<c:otherwise>
										<input type="text" class="form-control" name="tatuadorAlias" id="inputAlias" 
										placeholder="Ingrese el alias">
									</c:otherwise>
								</c:choose>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="tipoDoc">Seleccione el tipo de documento</label>
								<select class="form-control" id="tipoDocumento" name="usuarioDocumento">
									<c:forEach items="${listaTipoDocumentos}" var="documento">
										<c:choose>
											<c:when test="${documento.nombre == persona.tipoDocumento.nombre}">
												<option selected>${documento.nombre}</option>
											</c:when>
											<c:otherwise>
												<option>${documento.nombre}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>				
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputNumDoc">Documento</label>
								<form:input path="numeroDocumento" class="form-control" type="text" id="inputNumDoc" placeholder="Ingrese el n�mero de documento" required="required"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="inputEmail">Correo electr�nico</label>
								<form:input path="correoElectronico" class="form-control" type="email" id="inputEmail" placeholder="Ingrese su correo electr�nico" required="required"/>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputTel">Tel�fono</label>
								<form:input path="telefono" class="form-control" type="text" id="inputTel" placeholder="Ingrese su tel�fono" required="required"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputDomicilio">Domicilio</label>
						<form:input path="domicilio" class="form-control" type="text" id="inputDomicilio" placeholder="Ingrese su domicilio" required="required"/>
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-success" id="btnSubmit" name="action" value="edit">
							<span class="glyphicon glyphicon-user"></span>
							Editar
						</button>
						
						<button type="submit" class="btn btn-danger" id="btnFichaClinica" name="action" value="ficha_clinica">
							<span class="glyphicon glyphicon-tint"></span>
							Editar ficha cl�nica
						</button>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript">
		//. class
		//# id
		$(document).ready(function(){
			//Comprobacion inicial
   			if( $("#tipoUsuario").find(":selected").text().toUpperCase() === 'TATUADOR' ){
   				$("#inputAlias").prop('required', true);
   				$("#inputAlias").prop('disabled', false);
   			} else {
   				$("#inputAlias").prop('required', false);
   				$("#inputAlias").prop('disabled', true);
   			}

   			if($("#tipoUsuario option:selected").text().toUpperCase() === 'CLIENTE'){
   				$("#btnFichaClinica").prop('disabled', false);
			} else {
				$("#btnFichaClinica").prop('disabled', true);
			}
    	});
	</script>
</body>
</html>