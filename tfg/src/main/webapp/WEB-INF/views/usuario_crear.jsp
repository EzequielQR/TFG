<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
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
	<sec:authorize access="hasAnyRole('ADMIN', 'TATTOOIST', 'MANAGER', 'RECEPTIONIST')">
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
						<li class="dropdown active">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Usuarios<span class="caret"></span></a>
								<ul class="dropdown-menu">
									<li><a href="#">Crear Usuario</a></li>
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
						<li><a href="${pageContext.request.contextPath}/backup">Back-up</a></li>
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
				<form:form method="POST" modelAttribute="nuevaPersona" id="myForm" enctype="multipart/form-data">
					<fieldset>
						<legend>Crear Usuario</legend>
						
						<div class="form-group">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<label for="input-name">Nombre</label>
									<form:input path="nombre" class="form-control" type="text" id="input-name" placeholder="Ingrese su nombre" required="required"/>
								</div>
								
								<div class="col-lg-6 col-md-6">
									<label for="input-apellido">Apellido</label>
									<form:input path="apellido" class="form-control" type="text" id="input-apellido" placeholder="Ingrese su apellido" required="required"/>
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<label for="tipoUser">Seleccione el rol</label>
									<select class="form-control" id="tipoUsuario" name="usuarioRol">
										<c:forEach items="${listaRoles}" var="rol">
											<option>${rol.nombre}</option>
										</c:forEach>
									</select>
								</div>
								
								<div class="col-lg-6 col-md-6">
									<label for="inputAlias">Alias</label>
									<input type="text" class="form-control" name="tatuadorAlias" id="inputAlias" placeholder="Ingrese el alias">
								</div>
							</div>
						</div>
						
						<div class="form-group">
							<div class="row">
								<div class="col-lg-6 col-md-6">
									<label for="tipoDoc">Seleccione el tipo de documento</label>
									<select class="form-control" id="tipoDocumento" name="usuarioDocumento">
										<c:forEach items="${listaTipoDocumentos}" var="documento">
											<option>${documento.nombre}</option>
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
							<button type="button" id="btnOCR" class="btn btn-info" data-toggle="modal" data-target="#modalConfirmation">
								<span class="glyphicon glyphicon-eye-open"></span>
								OCR
							</button>
						</div>
						
						<div class="form-group">
							<button type="submit" class="btn btn-success" id="btnSubmit" name="action" value="save">
								<span class="glyphicon glyphicon-user"></span>
								Agregar
							</button>
							
							<button type="submit" class="btn btn-danger" id="btnFichaClinica" name="action" value="ficha_clinica">
								<span class="glyphicon glyphicon-tint"></span>
								Agregar ficha cl�nica
							</button>
						</div>
					</fieldset>
				</form:form>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="modalConfirmation" role="dialog">
			<div class="modal-dialog">
			    
				<!-- Modal content-->
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title">Usar OCR (Reconocimiento �ptico de Caracteres)</h4>
					</div>
					<div class="modal-body">
						
						<form:form method="POST" id="form-document" enctype="multipart/form-data" action="processDocument">
							<div class="form-group">
								<label for="fileSelected">Archivo:</label>
								<input type="file" name="selected-file" id="fileSelected">
								<p class="help-block">M�ximo: 20MB</p>
							</div>
						</form:form>
					
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default" data-dismiss="modal" id="cancelBtnFormDocument">
							<span class="glyphicon glyphicon-remove"></span>
							No
						</button>
						<button type="button" class="btn btn-success" id="submitBtnFormDocument">
							<span class="glyphicon glyphicon-ok"></span>
							Si
						</button>
					</div>
				</div>
			      
			</div>
		</div>
		
		<!-- Modal -->
		<div id="modalChangePassword" class="modal fade" role="dialog">
		  <div class="modal-dialog">
		
		    <!-- Modal content-->
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal">&times;</button>
		        <h4 class="modal-title">Cambiar contrase�a</h4>
		      </div>
		      <div class="modal-body" id="modal-body-change-password">
		      	<form:form method="POST" action="${pageContext.request.contextPath}/usuario/ajaxUpdatePassword" id="formModalPassword">
		      		<div class="form-group">
	  					<div class="row">
	  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<label for="input-modal-old-password">Contrase�a actual:</label>
								<input type="password" class="form-control" id="input-modal-old-password" placeholder="Ingrese su contrase�a actual" name="old-password-modal" required="required"/>
							</div>
						</div>
					</div>
					<div class="form-group">
	  					<div class="row">
	  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<label for="input-modal-new-password">Nueva contrase�a:</label>
								<input type="password" class="form-control" id="input-modal-new-password" placeholder="Ingrese su nueva contrase�a" name="new-password-modal" required="required"/>
							</div>
						</div>
					</div>
					<div class="form-group">
	  					<div class="row">
	  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<label for="input-modal-new-password-repeat">Ingrese nuevamente:</label>
								<input type="password" class="form-control" id="input-modal-new-password-repeat" placeholder="Repita su nueva contrase�a" name="new-password-repeat-modal" required="required"/>
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
		        	Cambiar Contrase�a
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
	   				$("#btnOCR").prop('disabled', false);
				} else {
					$("#btnFichaClinica").prop('disabled', true);
					$("#btnOCR").prop('disabled', true);
				}
				
				//Cuando el select cambia de estado, se evalua la condicion
				$("#tipoUsuario").change(function(){
					if($("#tipoUsuario option:selected").text().toUpperCase() === 'TATUADOR'){
		   				$("#inputAlias").prop('required', true);
		   				$("#inputAlias").prop('disabled', false);
					} else {
		   				$("#inputAlias").prop('required', false);
		   				$("#inputAlias").prop('disabled', true);
					}
					
					if($("#tipoUsuario option:selected").text().toUpperCase() === 'CLIENTE'){
		   				$("#btnFichaClinica").prop('disabled', false);
		   				$("#btnOCR").prop('disabled', false);
					} else {
						$("#btnFichaClinica").prop('disabled', true);
						$("#btnOCR").prop('disabled', true);
					}
				})
				
				$("#fileSelected").change(function(){
					var fileName = $("#fileSelected").val().split('\\').pop();
					$(".name-file-selected").html(fileName);
					
					$("#file-path").val($("#fileSelected").val());
					
					$("#modalConfirmation").modal("show");
				});
				
				$("#cancelBtnFormDocument").click(function(){
					$("#fileSelected").val("");
				});
				
				$("#submitBtnFormDocument").click(function(){
					$("#form-document").submit();
				});
				
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
						    				+ '<strong>La contrase�a ha sido cambiada con �xito!</strong>'
						  				+ '</div>');					
							} else if(result == "error"){
								$("#modal-body-change-password").prepend(
										'<div class="alert alert-danger alert-dismissible fade in" id="alert-modal-change-password">'
						    				+ '<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>'
						    				+ '<strong>Se ha producido un error por algunos de estos motivos:</strong><br>'
						    				+ '<ul><li>Su actual contrase�a es incorrecta.</li>'
						    				+ '<li>La nueva contrase�a no coincide.</li></ul>'
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
	</sec:authorize>
	<sec:authorize access="hasRole('CUSTOMER')">
		<% response.sendRedirect(request.getContextPath() + "/error403"); %>
	</sec:authorize>
</body>
</html>