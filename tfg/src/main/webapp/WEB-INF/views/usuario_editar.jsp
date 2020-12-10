<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

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
				<a class="navbar-left" href="${pageContext.request.contextPath}/home"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
			</div>
			<div class="collapse navbar-collapse" id="myNavBar">
				<ul class="nav navbar-nav">
					<sec:authorize access="hasAnyRole('ADMIN', 'TATTOOIST', 'MANAGER', 'RECEPTIONIST')">
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
					</sec:authorize>
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
					<li>
						<a href="javascript:;" onclick="document.getElementById('logout-form').submit();"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Cerrar Sesión</a>
						<form action="${pageContext.request.contextPath}/logout" method="POST" id="logout-form"></form>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="main row">
			<form:form method="POST" id="myForm">
				<input type="hidden" name="id" value="${persona.id}">
				<input type="hidden" name="customerBoolean" value="${customer}">
				<fieldset>
					<legend>Editar Usuario</legend>
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="inputName">Nombre</label>
								<input name="nombre" class="form-control" type="text" id="inputName" placeholder="Ingrese su nombre" required="required" value="${persona.nombre}"/>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputApellido">Apellido</label>
								<input name="apellido" class="form-control" type="text" id="inputApellido" placeholder="Ingrese su apellido" required="required" value="${persona.apellido}"/>
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
								<input name="numeroDocumento" class="form-control" type="text" id="inputNumDoc" placeholder="Ingrese el número de documento" required="required" value="${persona.numeroDocumento}"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="inputEmail">Correo electrónico</label>
								<input name="correoElectronico" class="form-control" type="email" id="inputEmail" placeholder="Ingrese su correo electrónico" required="required" value="${persona.correoElectronico}"/>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputTel">Teléfono</label>
								<input name="telefono" class="form-control" type="text" id="inputTel" placeholder="Ingrese su teléfono" required="required" value="${persona.telefono}"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputDomicilio">Domicilio</label>
						<input name="domicilio" class="form-control" type="text" id="inputDomicilio" placeholder="Ingrese su domicilio" required="required" value="${persona.domicilio}"/>
					</div>
					
					<div class="form-group">
						<button type="submit" class="btn btn-success" id="btnSubmit" name="action" value="edit">
							<span class="glyphicon glyphicon-user"></span>
							Editar
						</button>
						
						<button type="submit" class="btn btn-danger" id="btnFichaClinica" name="action" value="ficha_clinica">
							<span class="glyphicon glyphicon-tint"></span>
							Editar ficha clínica
						</button>
					</div>
				</fieldset>
			</form:form>
		</div>
	</div>
	
	<!-- Modal -->
	<div id="modalChangePassword" class="modal fade" role="dialog">
	  <div class="modal-dialog">
	
	    <!-- Modal content-->
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal">&times;</button>
	        <h4 class="modal-title">Cambiar contraseña</h4>
	      </div>
	      <div class="modal-body" id="modal-body-change-password">
	      	<form:form method="POST" action="${pageContext.request.contextPath}/usuario/ajaxUpdatePassword" id="formModalPassword">
	      		<div class="form-group">
  					<div class="row">
  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<label for="input-modal-old-password">Contraseña actual:</label>
							<input type="password" class="form-control" id="input-modal-old-password" placeholder="Ingrese su contraseña actual" name="old-password-modal" required="required"/>
						</div>
					</div>
				</div>
				<div class="form-group">
  					<div class="row">
  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<label for="input-modal-new-password">Nueva contraseña:</label>
							<input type="password" class="form-control" id="input-modal-new-password" placeholder="Ingrese su nueva contraseña" name="new-password-modal" required="required"/>
						</div>
					</div>
				</div>
				<div class="form-group">
  					<div class="row">
  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
							<label for="input-modal-new-password-repeat">Ingrese nuevamente:</label>
							<input type="password" class="form-control" id="input-modal-new-password-repeat" placeholder="Repita su nueva contraseña" name="new-password-repeat-modal" required="required"/>
						</div>
					</div>
				</div>
			</form:form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">
	        	<span class="glyphicon glyphicon-remove"></span>
	        	Cerrar
	        </button>
	        <button type="button" class="btn btn-success" id="btnSubmitUploadPassword" name="action" value="updatePassword">
	        	<span class="glyphicon glyphicon-ok"></span>
	        	Cambiar Contraseña
	        </button>
	      </div><!-- End modal-footer -->
	    </div><!-- End modal-content -->
	
	  </div>
	</div><!-- End modal root -->
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
   			
			$("#btnSubmitUploadPassword").click(function(){
				
				var old_password_obtained = $("#input-modal-old-password").val();
				var new_password_obtained = $("#input-modal-new-password").val();
				var new_password_repeat_obtained = $("#input-modal-new-password-repeat").val();
				var form_action = $("#formModalPassword").attr('action');
				
				console.log(old_password_obtained);
				console.log(new_password_obtained);
				console.log(new_password_repeat_obtained);
				console.log(form_action);
				
				$.ajax({
					url			:	form_action,
					method		:	"GET",
					//{key : value}
					data		:	{	old_password			:	old_password_obtained, 
									 	new_password			:	new_password_obtained, 
									 	new_password_repeat 	:	new_password_repeat_obtained	},
					success		:	function(result){
						
						$("#alert-modal-change-password").remove();
						
						if(result == "success"){
							$("#modal-body-change-password").prepend(
									'<div class="alert alert-success alert-dismissible fade in" id="alert-modal-change-password">'
					    				+ '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>'
					    				+ '<strong>La contraseña ha sido cambiada con éxito!</strong>'
					  				+ '</div>');					
						} else if(result == "error"){
							$("#modal-body-change-password").prepend(
									'<div class="alert alert-danger alert-dismissible fade in" id="alert-modal-change-password">'
					    				+ '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>'
					    				+ '<strong>Se ha producido un error por algunos de estos motivos:</strong><br>'
					    				+ '<ul><li>Su actual contraseña es incorrecta.</li>'
					    				+ '<li>La nueva contraseña no coincide.</li></ul>'
					  				+ '</div>');
						}
						
					}//End success
					
					
				}); //End AJAX
				
			});		//End click function
			
			$('#modalChangePassword').on('hide.bs.modal', function() {
				$("#alert-modal-change-password").remove();
				
				$("#input-modal-old-password").val("");
				$("#input-modal-new-password").val("");
				$("#input-modal-new-password-repeat").val("");
			});
    	});
	</script>
</body>
</html>