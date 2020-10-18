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
					<legend>Editar Turno</legend>
					
					<input type="hidden" name="fecha-elegida" value="<fmt:formatDate pattern='yyyy-MM-dd' value='${turno.fechaInicio}'/>">
					
					<div class="form-group">
				        <div class="row">
				            
				            <div class="col-lg-6 col-md-6">
				                <label for="input-name">Turno iniciado:</label>
				                <input type="text" class="form-control" id="input-name"
				                placeholder="Ezequiel Quispe Reyes" disabled="disabled"/>
				            </div>
				            
				            <div class="col-lg-6 col-md-6">
				            	<label for="input-fecha">Fecha:&nbsp;</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-calendar"></span>
									</div>
									<input type="text" class="form-control" id="input-fecha" 
									value="<fmt:formatDate pattern='dd/MMM/yyyy' value ='${turno.fechaInicio}'/>" disabled="disabled">
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
								    <input type="text" class="form-control input-timepicker" 
								    id="input-timepicker-hour-start" placeholder="Seleccione hora"
								    name="hour_start" required="required" 
								    value="<fmt:formatDate pattern='HH:mm' value ='${turno.fechaInicio}'/>">
							    </div>
							</div>
							
							
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<label for="input-timepicker-hour-end">Hora fin:&nbsp;</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span class="glyphicon glyphicon-dashboard"></span>
									</div>
								    <input type="text" class="form-control input-timepicker" id="input-timepicker-hour-end"
								    placeholder="Seleccione hora" name="hour_end" required="required"
								    value="<fmt:formatDate pattern='HH:mm' value ='${turno.fechaFin}'/>">
							    </div>
							</div>
							
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
								<label for="input-pago">Seña:&nbsp;</label>
								<div class="input-group">
									<div class="input-group-addon">
										<span>$</span>
									</div>
									<input type="number" class="form-control" id="input-pago" placeholder="Ingrese solo números" name="advance_payment" required="required" value="${turno.senia}">
								</div>
							</div>
		
							<div class="col-lg-3 col-md-3 col-sm-3 col-xs-6">
					    		<label for="input-prioridad">Prioridad:&nbsp;</label>
					    		<select class="form-control selectpicker" id="input-prioridad" name="priority_id">
					      			<c:forEach items="${listaPrioridades}" var="prioridad">
					      				<c:choose>
					      					<c:when test="${prioridad.nombre == turno.prioridad.nombre}">
					      						<option selected value="${prioridad.id}">${prioridad.nombre}</option>
					      					</c:when>
					      					<c:otherwise>
												<option value="${prioridad.id}">${prioridad.nombre}</option>					      						
					      					</c:otherwise>
					      				</c:choose>
									</c:forEach>
					    		</select>
		  					</div>
		  					
						</div> <!-- End row -->
					</div> <!-- End form-group -->
					
					<div class="form-group">
			    		<label for="input-tatuador">Tatuador:</label>
			    		<select class="form-control selectpicker" id="input-tatuador" name="tattooist_id">
			    			<c:forEach items="${listaTatuadores}" var="tattooist">
			    				<c:choose>
			    					<c:when test="${tattooist.pseudonimo == turno.tatuador.pseudonimo}">
			    						<option selected value="${tattooist.id}">${tattooist.pseudonimo}</option>
			    					</c:when>
			    					<c:otherwise>
										<option value="${tattooist.id}">${tattooist.pseudonimo}</option>			    					
			    					</c:otherwise>
			    				</c:choose>
							</c:forEach>
			    		</select>
  					</div>

					<!-- Para realizar la búsqueda se utiliza Bootstrap-Select-->
					<div class="form-group">
			    		<label for="input-estilo">Estilo de tatuaje:</label>
			    		<select class="form-control selectpicker" id="input-estilo" name="tattoo_style_id" data-live-search="true" title="Buscar por estilo de tatuaje" required="required">
			    			<c:forEach items="${listaEstiloTatuajes}" var="estilos">
			    				<c:choose>
			    					<c:when test="${estilos.nombre == turno.tipoTatuaje.nombre}">
			    						<option selected value="${estilos.id}">${estilos.nombre}</option>
			    					</c:when>
			    					<c:otherwise>
										<option value="${estilos.id}">${estilos.nombre}</option>			    					
			    					</c:otherwise>
			    				</c:choose>
							</c:forEach>
			    		</select>
  					</div>

  					<!-- Para realizar la búsqueda se utiliza Bootstrap-Select-->
  					<div class="form-group">
  						<label for="input-cliente">Cliente:</label>
	  					<select class="form-control selectpicker" id="input-cliente" name="customer_id" data-live-search="true" title="Buscar por nombre, apellido o número de documento" required="required">
							<c:forEach items="${listaClientes}" var="client">
								<c:choose>
									<c:when test="${client.id == turno.cliente.id}">
										<option selected value="${client.id}" data-tokens="${client.persona.numeroDocumento}">
											${client.persona.apellido}, ${client.persona.nombre}
										</option>
									</c:when>
									<c:otherwise>
										<option value="${client.id}" data-tokens="${client.persona.numeroDocumento}">
											${client.persona.apellido}, ${client.persona.nombre}
										</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
					</div>
					
					<div class="form-group">
		  			 	<label for="input-descripcion">Descripción:</label>
						<textarea class="form-control" rows="5" id="input-descripcion" placeholder="Inserte la descripción" name="description">${turno.descripcion}</textarea>
					</div>
					
					<div class="form-group">
					
						<button type="submit" class="btn btn-primary" id="btnSubmit" name="action" value="edit">
							<span class="glyphicon glyphicon-pencil"></span>
							Editar
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
    	});
	</script>
</body>
</html>