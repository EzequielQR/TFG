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
				<a class="navbar-left" href="${pageContext.request.contextPath}/home"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
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
				<fieldset>
					<legend>Crear Turno</legend>
					
					<div class="form-group">
				        <div class="row">
				            
				            <div class="col-lg-6 col-md-6">
				                <label for="input-name">Turno iniciado:</label>
				                <input type="text" class="form-control" id="input-name"
				                placeholder="${nombre}" disabled="disabled"/>
				            </div>
				            
				            <div class="col-lg-6 col-md-6">
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
				        
				        </div><!-- End row -->
    			  </div><!-- End form-group -->
					
					<!-- Padre-->
					<div class="form-group">
						<div class="row">
						
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<label for="input-timepicker-hour-start">Hora inicio:&nbsp;</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-dashboard"></span>
									</div>
								    <input type="text" class="form-control input-timepicker" id="input-timepicker-hour-start" placeholder="Seleccione hora" name="hour_start" required="required" autocomplete="off">
							    </div>
							</div>
							
							
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<label for="input-timepicker-hour-end">Hora fin:&nbsp;</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-dashboard"></span>
									</div>
								    <input type="text" class="form-control input-timepicker" id="input-timepicker-hour-end" placeholder="Seleccione hora" name="hour_end" required="required" autocomplete="off">
							    </div>
							</div>
							
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<label for="input-pago">Seña:&nbsp;</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span>$</span>
									</div>
									<input type="number" class="form-control" id="input-pago" placeholder="Ingrese solo números" name="advance_payment" required="required">
								</div>
							</div>
		
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
					    		<label for="input-prioridad">Prioridad:&nbsp;</label>
					    		<select class="form-control selectpicker" id="input-prioridad" name="priority_id">
					      			<c:forEach items="${listaPrioridades}" var="prioridad">
										<option value="${prioridad.id}">${prioridad.nombre}</option>
									</c:forEach>
					    		</select>
		  					</div>
		  					
						</div> <!-- End row -->
					</div> <!-- End form-group -->
					
					<div class="form-group">
			    		<label for="input-tatuador">Tatuador:</label>
			    		<select class="form-control selectpicker" id="input-tatuador" name="tattooist_id">
			    			<c:forEach items="${listaTatuadores}" var="tattooist">
								<option value="${tattooist.id}">${tattooist.pseudonimo}</option>
							</c:forEach>
			    		</select>
  					</div>

					<!-- Para realizar la búsqueda se utiliza Bootstrap-Select-->
					<div class="form-group">
			    		<label for="input-estilo">Estilo de tatuaje:</label>
			    		<select class="form-control selectpicker" id="input-estilo" name="tattoo_style_id" data-live-search="true" title="Buscar por estilo de tatuaje" required="required">
			    			<c:forEach items="${listaEstiloTatuajes}" var="estilos">
								<option value="${estilos.id}">${estilos.nombre}</option>
							</c:forEach>
			    		</select>
  					</div>

  					<!-- Para realizar la búsqueda se utiliza Bootstrap-Select-->
  					<div class="form-group">
  						<label for="input-cliente">Cliente:</label>
	  					<select class="form-control selectpicker" id="input-cliente" name="customer_id" data-live-search="true" title="Buscar por nombre, apellido o número de documento" required="required">
							<c:forEach items="${listaClientes}" var="client">
								<option value="${client.id}" data-tokens="${client.persona.numeroDocumento}">
									${client.persona.apellido}, ${client.persona.nombre}
								</option>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
		  			 	<label for="input-descripcion">Descripción:</label>
						<textarea class="form-control" rows="5" id="input-descripcion" placeholder="Inserte la descripción" name="description"></textarea>
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
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/bootstrap-select.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/i18n/defaults-es_ES.min.js"/>"></script>
	<script src="<c:url value="/resources/jquery-timepicker-1.3.5/js/jquery.timepicker.min.js"/>"></script>
	<script type="text/javascript">
		//. class
		//# id
		$(document).ready(function(){
			//Comprobacion inicial
			$('.my-select').selectpicker();
			$('.input-timepicker').timepicker({
			    timeFormat: 'HH:mm',
			    interval: 30,
			    minTime: '10:00',
			    maxTime: '20:30',
			    dynamic: false,
			    dropdown: true,
			    scrollbar: true
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