<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
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
				<sec:authorize access="hasAnyRole('ADMIN', 'TATTOOIST', 'MANAGER', 'RECEPTIONIST')">
					<a class="navbar-left" href="${pageContext.request.contextPath}/home"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
				</sec:authorize>
				<sec:authorize access="hasRole('CUSTOMER')">
					<a class="navbar-left" href="#"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
				</sec:authorize>
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
						<li><a href="${pageContext.request.contextPath}/backup">Back-up</a></li>
					</sec:authorize>
					<sec:authorize access="hasRole('CUSTOMER')">
						<li><a href="${pageContext.request.contextPath}/usuario/editar">Datos Personales</a></li>
						<li class="dropdown active">
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Ficha Cl�nica<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="#">Visualizar</a></li>
										<li><a href="${pageContext.request.contextPath}/ficha-clinica/editar?id-cliente=${param['id-cliente']}">Editar</a></li>
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
		
		<a href="<spring:url value="/ficha-clinica/editar?id-cliente=${cliente.id}"/>" class="btn btn-success" role="button">
			<span class="glyphicon glyphicon-pencil"></span>
			Editar Ficha Cl�nica
		</a>
		<sec:authorize access="hasAnyRole('ADMIN', 'TATTOOIST', 'MANAGER', 'RECEPTIONIST')">
			<a href="<spring:url value="/ficha-clinica/eliminar?id-cliente=${cliente.id}"/>" class="btn btn-danger" role="button">
				<span class="glyphicon glyphicon-trash"></span>
				Eliminar Ficha Cl�nica
			</a>
		</sec:authorize>
		<br><br>
		
		<div class="panel-group" id="accordion">
		
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse1">
						Ficha cl�nica: General</a>
					</h4>
				</div>
				<div id="collapse1" class="panel-collapse collapse in">
					<div class="panel-body">
					
						<table class ="table table-bordered table-striped table-hover">
							<thead>
				    			<tr class="warning">
				    				<th class="col-md-2">Apellido y Nombre</th>
				      				<th class="col-md-2">Grupo Sangu�neo</th>
				      				<th class="col-md-1">Factor RH</th>
				      				<th class="col-md-3">Alergias</th>
				      				<th class="col-md-2">Problemas Card�acos</th>
				      				<th class="col-md-2">Comentarios</th>
				    			</tr>
				  			</thead>
				  			<tbody>
					    		<tr>
					    			<td>${cliente.persona.apellido}, ${cliente.persona.nombre}</td>
					      			<td>${cliente.fichaClinica.grupoSanguineo}</td>
					      			<td>${cliente.fichaClinica.factorRh}</td>
					      			<td>${empty cliente.fichaClinica.alergias ? 'No aplica' : cliente.fichaClinica.alergias}</td>
					      			<td>${empty cliente.fichaClinica.problemasCardiacos ? 'No aplica' : cliente.fichaClinica.problemasCardiacos}</td>
					      			<td>${empty cliente.fichaClinica.comentario ? 'No aplica' : cliente.fichaClinica.comentario}</td>
					    		</tr>
					    		<!-- Use 'empty' keyword for check if a String is null or empty -->
				  			</tbody>
						</table>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse2">
						Ficha clinica: Piel</a>
					</h4>
				</div>
				<div id="collapse2" class="panel-collapse collapse">
					<div class="panel-body">
					
						<table class ="table table-bordered table-striped table-hover">
							<thead>
				    			<tr class="warning">
				      				<th class="col-md-1">Psoriasis</th>
				      				<th class="col-md-1">Eccema</th>
				      				<th class="col-md-1">Queloide</th>
				      				<th class="col-md-9">Comentarios</th>
				    			</tr>
				  			</thead>
				  			<tbody>
					    		<tr>
					      			<td>${cliente.fichaClinica.fichaClinicaDetallePiel.psoriasis == true ? 'Si' : 'No'}</td>
					      			<td>${cliente.fichaClinica.fichaClinicaDetallePiel.eccema == true ? 'Si' : 'No'}</td>
					      			<td>${cliente.fichaClinica.fichaClinicaDetallePiel.queloide == true ? 'Si' : 'No'}</td>
					      			<td>${empty cliente.fichaClinica.fichaClinicaDetallePiel.comentario ? 'No aplica' : cliente.fichaClinica.fichaClinicaDetallePiel.comentario }</td>
					    		</tr>
				  				<!-- Use 'empty' keyword for check if a String is null or empty -->
				  			</tbody>
						</table>
						
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" href="#collapse3">
						Ficha cl�nica: ETS</a>
					</h4>
				</div>
				<div id="collapse3" class="panel-collapse collapse">
					<div class="panel-body">
					
						<table class ="table table-bordered table-striped table-hover">
							<thead>
				    			<tr class="warning">
				      				<th class="col-md-1">VIH</th>
				      				<th class="col-md-1">Sifilis</th>
				      				<th class="col-md-2">Hepatitis B</th>
				      				<th class="col-md-1">HPV</th>
				      				<th class="col-md-7">Comentarios</th>
				    			</tr>
				  			</thead>
				  			<tbody>
					    		<tr>
					      			<td>${cliente.fichaClinica.fichaClinicaDetalleEts.vih == true ? 'Si' : 'No'}</td>
					      			<td>${cliente.fichaClinica.fichaClinicaDetalleEts.sifilis == true ? 'Si' : 'No'}</td>
					      			<td>${cliente.fichaClinica.fichaClinicaDetalleEts.hepatitisB == true ? 'Si' : 'No'}</td>
					      			<td>${cliente.fichaClinica.fichaClinicaDetalleEts.hpv == true ? 'Si' : 'No'}</td>
					      			<td>${empty cliente.fichaClinica.fichaClinicaDetalleEts.comentario ? 'No aplica' : cliente.fichaClinica.fichaClinicaDetalleEts.comentario }</td>
					    		</tr>
					    		<!-- Use 'empty' keyword for check if a String is null or empty -->
				  		</tbody>
					</table>
					
				</div>
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
</body>
</html>