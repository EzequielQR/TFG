<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesi�n</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<div class="main row">
			<form:form method="POST" modelAttribute="nuevaPersona" id="myForm" enctype="multipart/form-data">
				<fieldset>
					<legend>Crear Usuario</legend>
					
					<input type="hidden" name="blood_type" value="${ocr['bloodType']}">
					<input type="hidden" name="rh_factor" value="${ocr['rhFactor']}">
					<input type="hidden" name="cardiac_boolean" value="${ocr['cardiacBoolean']}">
					<input type="hidden" name="cardiac_details" value="${ocr['cardiacDetails']}">
					<input type="hidden" name="skin_boolean" value="${ocr['skinBoolean']}">
					<input type="hidden" name="skin_details" value="${ocr['skinDetails']}">
					<input type="hidden" name="circulation_boolean" value="${ocr['circulationBoolean']}">
					<input type="hidden" name="circulation_details" value="${ocr['circulationDetails']}">
					<input type="hidden" name="allergies_boolean" value="${ocr['allergiesBoolean']}">
					<input type="hidden" name="allergies_details" value="${ocr['allergiesDetails']}">
					<input type="hidden" name="diabetes_boolean" value="${ocr['diabetesBoolean']}">
					<input type="hidden" name="smooking_boolean" value="${ocr['smookingBoolean']}">
					<input type="hidden" name="pregnant_boolean" value="${ocr['pregnantBoolean']}">
					<input type="hidden" name="epilepsy_boolean" value="${ocr['epilepsyBoolean']}">
					<input type="hidden" name="medication_boolean" value="${ocr['medicationBoolean']}">
					<input type="hidden" name="medication_details" value="${ocr['medicationDetails']}">
					<input type="hidden" name="hypertension_boolean" value="${ocr['hypertensionBoolean']}">
					<input type="hidden" name="hiv_boolean" value="${ocr['hivBoolean']}">
					<input type="hidden" name="hepatitis_boolean" value="${ocr['hepatitisBoolean']}">
					<input type="hidden" name="hpv_boolean" value="${ocr['hpvBoolean']}">
					<input type="hidden" name="syphilis_boolean" value="${ocr['syphilisBoolean']}">
					
					<input type="hidden" name="usuarioRol" value="Cliente">
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="input-name">Nombre</label>
								<form:input path="nombre" class="form-control" type="text" id="input-name" placeholder="Ingrese su nombre" required="required" value="${ocr['name']}"/>
							</div>
							<div class="col-lg-6 col-md-6">
								<label for="input-apellido">Apellido</label>
								<form:input path="apellido" class="form-control" type="text" id="input-apellido" placeholder="Ingrese su apellido" required="required" value="${ocr['surname']}"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="tipoUser">Seleccione el rol</label>
								<select class="form-control" id="tipoUsuario" disabled="disabled">
									<c:forEach items="${listaRoles}" var="rol">
										<c:choose>
											<c:when test="${rol.nombre == 'Cliente'}">
												<option selected>${rol.nombre}</option>
											</c:when>
											<c:otherwise>
												<option>${rol.nombre}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputAlias">Alias</label>
								<input type="text" class="form-control" name="tatuadorAlias" id="inputAlias" placeholder="Ingrese el alias" disabled="disabled">
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
								<form:input path="correoElectronico" class="form-control" type="email" id="inputEmail" placeholder="Ingrese su correo electr�nico" required="required" value="${ocr['mail']}"/>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputTel">Tel�fono</label>
								<form:input path="telefono" class="form-control" type="text" id="inputTel" placeholder="Ingrese su tel�fono" required="required" value="${ocr['phone']}"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label for="inputDomicilio">Domicilio</label>
						<form:input path="domicilio" class="form-control" type="text" id="inputDomicilio" placeholder="Ingrese su domicilio" required="required" value="${ocr['address']}"/>
					</div>
					
					<div class="form-group">
						<button type="button" class="btn btn-info" data-toggle="modal" data-target="#modalConfirmation">
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
							Visualizar/Editar ficha cl�nica
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
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script type="text/javascript">
		//. class
		//# id
		$(document).ready(function(){
			//Comprobacion inicial
   			
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
			
    	});
	</script>
</body>
</html>