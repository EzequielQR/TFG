<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
							<a class="dropdown-toggle" data-toggle="dropdown" href="#">Ficha Clínica<span class="caret"></span></a>
									<ul class="dropdown-menu">
										<li><a href="${pageContext.request.contextPath}/ficha-clinica/mostrar?id-cliente=${param['id-cliente']}">Visualizar</a></li>
										<li><a href="#">Editar</a></li>
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
		<form:form method="POST" modelAttribute="nuevaFichaClinica" id="myForm">
			<div class="well">
				<fieldset>
					<legend>Ficha Clínica: General</legend>
					<input type="hidden" name="id_customer" value="${cliente.id}">
					<input type="hidden" name="id_clinical_record" value="${cliente.fichaClinica.id}">
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="input-name">Nombre</label>
								<input type="text" class="form-control" id="input-name" value="${cliente.persona.nombre}" disabled="disabled"/>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="input-apellido">Apellido</label>
								<input type="text" class="form-control" id="input-apellido" value="${cliente.persona.apellido}" disabled="disabled"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label>Tipo de Sangre</label><br>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="A" required="required" ${cliente.fichaClinica.grupoSanguineo == 'A' ? 'checked="checked"' : ''} >A</label>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="B" required="required" ${cliente.fichaClinica.grupoSanguineo == 'B' ? 'checked="checked"' : ''} >B</label>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="AB" required="required" ${cliente.fichaClinica.grupoSanguineo == 'AB' ? 'checked="checked"' : ''} >AB</label>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="0" required="required" ${cliente.fichaClinica.grupoSanguineo == '0' ? 'checked="checked"' : ''} >0</label>
					</div>
					
					<div class="form-group">
						<label>Factor RH</label><br>
						<label class="radio-inline"><input type="radio" name="rh_blood" id="" value="+" required="required" ${cliente.fichaClinica.factorRh == '+' ? 'checked="checked"' : ''} >+</label>
						<label class="radio-inline"><input type="radio" name="rh_blood" id="" value="-" required="required" ${cliente.fichaClinica.factorRh == '-' ? 'checked="checked"' : ''} >-</label>
					</div>

					<div class="form-group">
						<label for="inputAlergias">Alergias</label>
						<input type="text" class="form-control" name="allergies" id="inputAlergias" placeholder="Ingrese alergias" value="${cliente.fichaClinica.alergias}"/>
					</div>

					<div class="form-group">
						<label for="inputCardiacos">Problemas Cardiacos</label>
						<input type="text" class="form-control" name="cardiac_problems" id="inputCardiacos" placeholder="Ingrese problemas cardiacos" value="${cliente.fichaClinica.problemasCardiacos}"/>
					</div>
					
					<div class="form-group">
						<label for="inputGralComment">Comentarios Generales</label>
						<input type="text" class="form-control" name="gral_comment" id="inputGralComment" placeholder="Ingrese comentarios" value="${cliente.fichaClinica.comentario}"/>
					</div>
					
				</fieldset>
			</div><!-- End well tag -->
			
			<div class="well">
				<fieldset>
					<legend>Ficha Clínica: Piel</legend>
					
					<div class="form-group">
						<label>Psoriasis</label><br>
						<label class="radio-inline"><input type="radio" name="psoriasis" id="" value="true" required="required" ${cliente.fichaClinica.fichaClinicaDetallePiel.psoriasis == true ? 'checked="checked"' : ''} >Si</label>
						<label class="radio-inline"><input type="radio" name="psoriasis" id="" value="false" required="required" ${cliente.fichaClinica.fichaClinicaDetallePiel.psoriasis == false ? 'checked="checked"' : ''} >No</label>
					</div>
					
					<div class="form-group">
						<label>Eccema</label><br>
						<label class="radio-inline"><input type="radio" name="eczema" id="" value="true" required="required" ${cliente.fichaClinica.fichaClinicaDetallePiel.eccema == true ? 'checked="checked"' : ''} >Si</label>
						<label class="radio-inline"><input type="radio" name="eczema" id="" value="false" required="required" ${cliente.fichaClinica.fichaClinicaDetallePiel.eccema == false ? 'checked="checked"' : ''} >No</label>
					</div>
					
					<div class="form-group">
						<label>Queloide</label><br>
						<label class="radio-inline"><input type="radio" name="keloid" id="" value="true" required="required" ${cliente.fichaClinica.fichaClinicaDetallePiel.queloide == true ? 'checked="checked"' : ''} >Si</label>
						<label class="radio-inline"><input type="radio" name="keloid" id="" value="false" required="required" ${cliente.fichaClinica.fichaClinicaDetallePiel.queloide == false ? 'checked="checked"' : ''} >No</label>
					</div>
					
					<div class="form-group">
						<label for="inputSkinComment">Comentarios Piel</label>
						<input type="text" class="form-control" name="skin_comment" id="inputSkinComment" placeholder="Ingrese comentarios Piel" value="${cliente.fichaClinica.fichaClinicaDetallePiel.comentario}"/>
					</div>
					
				</fieldset>
			</div><!-- End well tag -->
			
			<div class="well">
				<fieldset>
					<legend>Ficha Clínica: ETS</legend>
					
					<div class="form-group">
						<label>VIH</label><br>
						<label class="radio-inline"><input type="radio" name="hiv" id="" value="true" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.vih == true ? 'checked="checked"' : ''} >Si</label>
						<label class="radio-inline"><input type="radio" name="hiv" id="" value="false" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.vih == false ? 'checked="checked"' : ''} >No</label>
					</div>
					
					<div class="form-group">
						<label>Sifilis</label><br>
						<label class="radio-inline"><input type="radio" name="syphilis" id="" value="true" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.sifilis == true ? 'checked="checked"' : ''} >Si</label>
						<label class="radio-inline"><input type="radio" name="syphilis" id="" value="false" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.sifilis == false ? 'checked="checked"' : ''} >No</label>
					</div>
					
					<div class="form-group">
						<label>Hepatitis B</label><br>
						<label class="radio-inline"><input type="radio" name="hepatitis_b" id="" value="true" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.hepatitisB == true ? 'checked="checked"' : ''} >Si</label>
						<label class="radio-inline"><input type="radio" name="hepatitis_b" id="" value="false" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.hepatitisB == false ? 'checked="checked"' : ''} >No</label>
					</div>
					
					<div class="form-group">
						<label>HPV</label><br>
						<label class="radio-inline"><input type="radio" name="hpv" id="" value="true" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.hpv == true ? 'checked="checked"' : ''} >Si</label>
						<label class="radio-inline"><input type="radio" name="hpv" id="" value="false" required="required" ${cliente.fichaClinica.fichaClinicaDetalleEts.hpv == false ? 'checked="checked"' : ''} >No</label>
					</div>
					
					<div class="form-group">
						<label for="inputStdComment">Comentarios ETS</label>
						<input type="text" class="form-control" name="std_comment" id="inputStdComment" placeholder="Ingrese comentarios ETS" value="${cliente.fichaClinica.fichaClinicaDetalleEts.comentario}"/>
					</div>
					
				</fieldset>
			</div><!-- End well tag -->
			
			<div class="form-group">
				<button type="submit" class="btn btn-danger" id="btnFichaClinica" name="action" value="ficha_clinica">
					<span class="glyphicon glyphicon-tint"></span>
					Editar ficha clínica
				</button>
			</div>
			
		</form:form>
	</div><!-- End div tag  -->
	
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