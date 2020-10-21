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
	<link rel="stylesheet" href="<c:url value="/resources/datatables/css/datatables.min.css"/>">
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
								<li><a href="#">Visualizar Usuarios</a></li>
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
					<li>
						<a href="javascript:;" onclick="document.getElementById('logout-form').submit();"><span class="glyphicon glyphicon-log-out"></span>&nbsp;Cerrar Sesión</a>
						<form action="${pageContext.request.contextPath}/logout" method="POST" id="logout-form"></form>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<br>
	<div class="container">
		<section class="main row">
			<div class="input-group">
				<input type="text" class="form-control" id="myInputTextField" placeholder="Buscar palabras claves. Ej.: Tinta, aguja, puntera...">
					<div class="input-group-btn">
						<button class="btn btn-success" type="submit">
							<span class="glyphicon glyphicon-search"></span>
						</button>
					</div>
			</div>
			<br>
			<table id="table_id" class ="table table-bordered table-striped table-hover">
				<thead>
				    <tr class="warning">
				      <th class="col-md-1">Código</th>
				      <th class="col-md-2">Rol</th>
				      <th class="col-md-2">Apellido y Nombre</th>
				      <th class="col-md-2">Teléfono</th>
				      <th class="col-md-1">Detalles</th>
				      <th class="col-md-1">Editar Usuario</th>
				      <th class="col-md-1">Eliminar Usuario</th>
				    </tr>
				  </thead>
				  <tbody>
				  	<c:forEach items="${personas}" var="persona">
					    <tr>
					      <th>${persona.id}</th>
					      <td>${persona.rol.nombre}</td>
					      <td>${persona.apellido}, ${persona.nombre}</td>
					      <td>${persona.telefono}</td>
					      <td><a href="#" class="btn btn-default view_modal" data-id="${persona.id}"><span class="glyphicon glyphicon-eye-open"></span></a></td>
					      <td><a href="<spring:url value="/usuario/editar?id=${persona.id}"/>" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
					      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
					    </tr>
				 	 </c:forEach>
				  </tbody>
			</table>
		</section>
	</div>
	<div class="modal fade" id ="dataModal">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Información Adicional</h4>
				</div>
				<br>
				<div class="modal-body" id="modal_detail">
					<div class="table-responsive">
						<table class="table table-bordered">
							<tr>
								<td><b>ID</b></td>
								<td class="id_modal"></td>
							</tr>
							<tr>
								<td><b>Rol</b></td>
								<td class="rol_modal"></td>
							</tr>
							<tr>
								<td><b>Nombre de Usuario</b></td>
								<td class="usuario_modal"></td>
							</tr>
							<tr>
								<td><b>Pseudónimo</b></td>
								<td class="pseudonimo_modal"></td>
							</tr>
							<tr>
								<td><b>Apellido</b></td>
								<td class="apellido_modal"></td>
							</tr>
							<tr>
								<td><b>Nombre</b></td>
								<td class="nombre_modal"></td>
							</tr>
							<tr>
								<td><b>Tipo Documento</b></td>
								<td class="tipo_doc_modal"></td>
							</tr>
							<tr>
								<td><b>Número Documento</b></td>
								<td class="num_doc_modal"></td>
							</tr>
							<tr>
								<td><b>Domicilio</b></td>
								<td class="domicilio_modal"></td>
							</tr>
							<tr>
								<td><b>Teléfono</b></td>
								<td class="tel_modal"></td>
							</tr>
							<tr>
								<td><b>Correo electrónico</b></td>
								<td class="correo_modal"></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
				<form:form method="POST" action="fichaClinicaDetalle">
					<button type="submit" class="btn btn-danger" id="btnFichaClinica" name="id_cliente" value="">
							<span class="glyphicon glyphicon-tint"></span>
							Ver ficha clínica
					</button>
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>
				</form:form>
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
	<script src="<c:url value="/resources/datatables/js/datatables.min.js"/>"></script>
	<script type="text/javascript">
	//. class
	//# id
    $(document).ready(function(){
    	
		$('#table_id').DataTable({
			//default dom: 'lrtp'
			//l: "Show [10/25/50/100] entries"
			//p: "Pagination"
			//t: hide the DEFAULT search input without disabling the search functionality.
			dom: 'rtp',
			language: {
                zeroRecords		:	"Ningún registro concuerda con la búsqueda",
                paginate		:	{
                	next		:	"Siguiente",
                	previous	:	"Anterior"
                }
            }
		});
		
		$('#myInputTextField').keyup(function(){
			$('#table_id').DataTable().search($(this).val()).draw() ;
		});
    	
		$('.view_modal').click(function(){
		//Obtengo valor
		var person_id_obtained = $(this).attr("data-id");
			
			$.ajax({
				url: "ajaxcall",
				method: "get",
				//{key : value}
				data: {person_id : person_id_obtained},
				success: function(result){
					//The JSON you are receiving is in string. You have to convert it into JSON object.
					//Alert() only can display Strings.
					//For debug proposes, use console.log(data);
					
					var obj1 = JSON.parse(result);
					console.log(obj1);
					
					$('.id_modal').html(obj1.id);
					$('.rol_modal').html(obj1.persona.rol.nombre);

					if(obj1.persona.rol.nombre.toUpperCase() === "CLIENTE"){
						$('.usuario_modal').html("El rol actual no admite usuarios.");
						$('#btnFichaClinica').val(obj1.id);
						$('#btnFichaClinica').prop('disabled', false);
					} else {
						$('.usuario_modal').html(obj1.usuario.nombre);
						$('#btnFichaClinica').val(0);
						$('#btnFichaClinica').prop('disabled', true);
					}
					
					if(obj1.persona.rol.nombre.toUpperCase() === "TATUADOR"){
						$('.pseudonimo_modal').html(obj1.pseudonimo);
					} else {
						$('.pseudonimo_modal').html("El rol actual no admite pseudónimos.");
					}
					
					$('.apellido_modal').html(obj1.persona.apellido);
					$('.nombre_modal').html(obj1.persona.nombre);
					$('.tipo_doc_modal').html(obj1.persona.tipoDocumento.nombre);
					$('.num_doc_modal').html(obj1.persona.numeroDocumento);
					$('.domicilio_modal').html(obj1.persona.domicilio);
					$('.tel_modal').html(obj1.persona.telefono);
					$('.correo_modal').html(obj1.persona.correoElectronico);
					//Trigger modal via Javascript:
					$('#dataModal').modal("show");
				}
			});			
		});
		
		//$('#btnFichaClinica').click(function() {
		//	var id_cliente = $('#btnFichaClinica').val();
		//	$(location).attr('href', '/tfg/ficha-clinica/mostrar?id_cliente=' + id_cliente);
		//});
		
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
				    				+ '<strong>Error:<br>'
				    				+ '<ul><li>Su actual contraseña es incorrecta.</li>'
				    				+ '<li>La nueva contraseña no coincide.</li></ul></strong>'
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