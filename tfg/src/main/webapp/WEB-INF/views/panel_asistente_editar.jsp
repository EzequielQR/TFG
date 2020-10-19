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
	
		<h1 style="text-align:center">
			Asistente de dise�o de tatuajes:&nbsp;<strong><c:out value="${estilo}"/>.</strong>
			<small><c:out value="${query}"/></small>
		</h1>
		<br>
		<form:form class="form-horizontal" method="GET">
		
			<input type="hidden" name="id-turno" value="${idTurno}">
			<input type="hidden" name="estilo" value="${estilo}">
			<input type="hidden" name="img" value="${imgTurno}">
			
			<div class="form-group">
				<label for="input-search" class="col-lg-2 col-md-2 col-sm-2 col-xs-2 control-label">B�squeda:</label>
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
		
			<c:if test="${imgTurno != 'null'}">
				<div class="col-xs-6 col-md-4 col-lg-4">
					<div class="panel panel-info">
						<div class="panel-heading" style="text-align: center;"><strong>Imagen Seleccionada</strong></div>
	            		<div class="panel-body">
	            			<a href='<c:out value="${imgTurno}"/>' target="_blank">
		                		<img style="width:365px;height:294px" src='<c:out value="${imgTurno}"/>' class="img-responsive img-rounded">
		                	</a>
		            	</div>
		            	<div class="panel-footer">
		            		<a href="<c:url value="/panel-asistente/guardar?id-turno=${idTurno}&img=${imgTurno}"/>"
				           	class="btn btn-lg btn-block btn-success"> 
				           		<span class="glyphicon glyphicon-ok"></span>&nbsp;Elegir
				           	</a>
		            	</div>
	        		</div>
				</div>
			</c:if>

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
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/bootstrap-select.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/i18n/defaults-es_ES.min.js"/>"></script>
	<script src="<c:url value="/resources/jquery-timepicker-1.3.5/js/jquery.timepicker.min.js"/>"></script>
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
					    				+ '<strong>Error:<br>'
					    				+ '<ul><li>Su actual contrase�a es incorrecta.</li>'
					    				+ '<li>La nueva contrase�a no coincide.</li></ul></strong>'
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