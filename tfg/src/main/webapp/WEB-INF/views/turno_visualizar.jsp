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
	<link rel="stylesheet" href="<c:url value="/resources/fullcalendar-3.10.2/css/fullcalendar.min.css"/>">
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
					<li class="dropdown active">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Turnos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Crear/Visualizar Turnos</a></li>
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
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>
		
		<div class="container">
		
			<div class="alert alert-info alert-dismissible fade in">
			<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  				<c:forEach items="${listTatuadores}" var="tattooist">
  					<span class="badge" style="background-color: ${tattooist.color}">&nbsp;</span>&nbsp;${tattooist.pseudonimo}&nbsp;&nbsp;
  				</c:forEach>
			</div>
			
			<section class="main row">
				<div id="calendar"></div>
			</section>
		</div>
		
	<!-- Modal to ADD an appointment -->
	<div class="modal fade" id="createEventModal" role="dialog">
		 <div class="modal-dialog modal-sm">
		 
			 <!-- Modal content-->
			 <div class="modal-content">
				 
				 <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Agregar Turno</h4>
				 </div>
				 
				 <div class="modal-body">
				 	<p>Crear un turno para la fecha:&nbsp;<strong id="date_picked_show"></strong></p>
				 </div>
				 
				 <div class="modal-footer">
					<form:form method="POST" action="redirectToCreation">
						<input type="hidden" id="date_picked_hidden" name="fecha-elegida">
						<button type="submit" class="btn btn-primary" id="submitButton">
								Si
						</button>
						<button type="button" class="btn btn-default" data-dismiss="modal">No</button>
					</form:form>
				 </div>
			 </div>
			 
		 </div>
	</div>

	<!-- Modal to SEE event details -->
	<div class="modal fade" id="detailsAppointmentModal" role="dialog">
		<div class="modal-dialog">
		
			<!-- MODAL CONTENT -->
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Detalles del turno</h4>
				</div>
				
				<div class="modal-body" id="modal_detail">
					<div class="table-responsive">
						<table class="table table-bordered">
							<tr>
								<td><b>ID</b></td>
								<td class="id_modal"></td>
							</tr>
							<tr>
								<td><b>Fecha</b></td>
								<td class="date_modal"></td>
							</tr>
							<tr>
								<td><b>Hora Inicio - Hora Fin</b></td>
								<td class="hour_modal"></td>
							</tr>
							<tr>
								<td><b>Prioridad</b></td>
								<td class="priority_modal"></td>
							</tr>
							<tr>
								<td><b>Tatuador</b></td>
								<td class="tatuador_modal"></td>
							</tr>
							<tr>
								<td><b>Cliente</b></td>
								<td class="customer_modal"></td>
							</tr>
							<tr>
								<td><b>Teléfono Cliente</b></td>
								<td class="customer_phone_number_modal"></td>
							</tr>
							<tr>
								<td><b>Seña</b></td>
								<td class="advance_payment_modal"></td>
							</tr>
							<tr>
								<td><b>Tipo Tatuaje</b></td>
								<td class="style_tattoo_modal"></td>
							</tr>
							<tr>
								<td><b>Descripción</b></td>
								<td class="description_modal"></td>
							</tr>
							<tr>
								<td><b>Imagen</b></td>
								<td class="reference_image_modal"></td>
							</tr>
						</table>
					</div>
				</div>
				
				<div class="modal-footer">
					<form:form method="POST" action="actionDetailsAppointment">
						<input type="hidden" id="appointmentHiddenId" name="id-appointment"/>
					    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
					    <button type="submit" class="btn btn-info" id="editButton" name="btn-action" value="edit">Editar</button>
						<button type="submit" class="btn btn-warning" id="deleteButton" name="btn-action" value="delete">Borrar</button>
					</form:form>
				</div>
				
			 </div>
			 
		</div>
	</div>
	
	<!-- Modal to show a warning notification -->
	<div class="modal fade" id="sunday-events" role="dialog">
		 <div class="modal-dialog modal-sm">
		 
			 <!-- Modal content-->
			 <div class="modal-content">
				 
				 <div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Advertencia</h4>
				 </div>
				 
				 <div class="modal-body">
				 	<p id="paragraph-body-modal-sunday"></p>
				 </div>
				 
				 <div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">Volver</button>
				 </div>
			 </div>
			 
		 </div>
	</div>
		
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/moment-2.27.0/js/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/fullcalendar-3.10.2/js/fullcalendar.min.js"/>"></script>
	
	<!-- .class -->
	<!-- # id -->
	<script type="text/javascript">
		$(document).ready(function() {
		    // Page is now ready, initialize the calendar with JS Code.
		    $('#calendar').fullCalendar({
		    	
		    	monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],

	            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],

	            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],

	            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
		    	
	            weekends : true, // will NOT hide Saturdays and Sundays
	            
	            timeFormat: 'HH:mm',
	            
	            firstDay : 1,	// Sunday=0, Monday=1, Tuesday=2, etc.

	            //Determines if the events can be dragged and resized. Enables/disables both at the same time.
	            //If you don't want both, use editable in conjunction with: 'eventStartEditable' and
	            //'eventDurationEditable'.
	            editable : true,
	            
	            eventStartEditable : true,	//Permite/no permite mover los eventos dentro del calendario.
	            
	            eventDurationEditable : false, //Permite/No permite el resize de eventos.
	            
		    	events : 'populateCalendar',
		    	//[
		    	//	{
		    	//		id : 1,
		    	//		title : "Primer evento",
		    	//		start : "2020-08-26", //Date in ISO 8601. Required.
		    	//		url : "http://www.google.com",
		    	//		color : "red",
		    	//		editable : true //True: Podemos mover el evento en cualquier dia del calendar.
		    	//	},
		    	//	{
		    	//		id : 2,
		    	//		title : "Segundo evento",
		    	//		start : "2020-08-27",
		    	//		url : "http://www.google.com",
		    	//		color : "blue",
		    	//		editable : true
		    	//	},
		    	//],
		
		    	
		    	//dayClick function: When we click in a day, an event will trigger. Si hago click en UN EVENTO
		    	//NO SE VA a disparar la funcion.
		    	
		    	//date: Holds a MomentJS for the clicked day, ergo, I can use MomentJS functions. See official
		    		  //page for more functions.
		    	//jsEvent: Holds the native JavaScript event with low-level info.
		    	//view: Is the current View Object.
		    	//view.name: in FullCalendar we have some view name: Views by month, View by week, view by day
		    	//y View por lista.
		    	//view.title: Titulo de la vista.
		    	dayClick : function(date, jsEvent, view) {
		    		
		    		console.log('Clicked on: ' + date.format());
					console.log('Coordinates: ' + jsEvent.pageX + ',' + jsEvent.pageY);
					console.log('Current view: ' + view.name);
							
					//momentJS: isoWeekday()  returns 1-7 where 1 is Monday and 7 is Sunday
							
					console.log(date.isoWeekday());

					if(date.isoWeekday() == 7){
						$('#paragraph-body-modal-sunday').text("La creación de turnos para los días domingos ha sido deshabilitada.");
						$('#sunday-events').modal("show");
					} else {
						$('#date_picked_hidden').val(date.format());
						$('#date_picked_show').text(date.format());
						$('#createEventModal').modal("show");
					}
							
  				},
		    
		    	eventClick : function(event, jsEvent, view) {
		    		
		    		console.log($.fullCalendar.moment(event.start).format('dddd, DD/MMMM/YYYY, HH:mm'));
		    		
		    		startTime = $.fullCalendar.moment(event.start).format('dddd, DD/MMMM/YYYY, HH:mm');
		    		endTime = $.fullCalendar.moment(event.end).format('HH:mm');
	                
					var when = startTime + ' - ' + endTime;
				    
				    $.ajax({
				    	url : "ajaxAppointmentDetails",
				    	method : "get",
				    	data : {id_appointment : event.id},	//{key : value}
				    	success : function(result){
							//The JSON you are receiving is in string. You have to convert it into JSON object.
							//Alert() only can display Strings.
							//For debug proposes, use console.log(data);
							var obj = JSON.parse(result);
							console.log(obj);
							
							var fecha = $.fullCalendar.moment(event.start).format('dddd, DD/MMMM/YYYY');
							
							var horaInicio = moment(event.start).format('HH:mm');
							var horaFin = moment(event.end).format('HH:mm');
							var rangoHora = horaInicio + ' - ' + horaFin;
							
							
							$('#appointmentHiddenId').val(obj.id);
							
							$('.id_modal').html(obj.id);
							$('.date_modal').html(fecha);
							$('.hour_modal').html(rangoHora);
							$('.priority_modal').html(obj.prioridad.nombre);
							$('.tatuador_modal').html(obj.tatuador.pseudonimo);
							$('.customer_modal').html(obj.cliente.persona.apellido + ', ' + obj.cliente.persona.nombre);
							$('.customer_phone_number_modal').html(obj.cliente.persona.telefono);
							$('.advance_payment_modal').html('$ ' + obj.senia);
							$('.style_tattoo_modal').html(obj.tipoTatuaje.nombre);
							$('.description_modal').html(obj.descripcion);
							
							if(!obj.imagenURL)	
								$('.reference_image_modal').html("El turno seleccionado no dispone de una imagen de referencia.");
							else
								$('.reference_image_modal').html("<a href='" + obj.imagenURL+ "' class='btn btn-block btn-success' target='_blank'><span class='glyphicon glyphicon-picture'></span>&nbsp;Ver imagen de referencia</a>");
							
							$('#detailsAppointmentModal').modal("show");							
				    	}
				    });
		    	},
  				
		    	//eventDropInfo: is an Event Object that hold the event information (date, title, etc)
		    	//delta: is a Duration Object that represents the amount of time the event was moved by.
		    	//revertFunc: is a function that, if called, reverts the events start/end date to values before
		    				  //the drag.
  				eventDrop : function(eventDropInfo, delta, revertFunc){
  					console.log(eventDropInfo);
  					
  					//momentJS: isoWeekday()  returns 1-7 where 1 is Monday and 7 is Sunday
  					if(eventDropInfo.start.isoWeekday() == 7){
  						$('#paragraph-body-modal-sunday').text("No es posible mover el turno seleccionado para el día domingo.");
  						$('#sunday-events').modal("show");
  						revertFunc();
  					} else {
  						$.ajax({
  							url : "ajaxUpdateDraggedEvent",
  							method : "get",
  							//data : {key : value}
  							data : {id_appointment : eventDropInfo.id, picked_date : eventDropInfo.start.format()},
  							success : function(result){
  								//The JSON you are receiving is in string. You have to convert it into JSON object.
  								//Alert() only can display Strings.
  								//For debug proposes, use console.log(data);
  								
  								//var obj = JSON.parse(result);
								//console.log(obj);
  								
								if(result == "success")
  									console.log("Se ejecuto con éxito la función AJAX.");
								else if (result == "not-available"){
									console.log("Is not an available slot");
									revertFunc();
									$('#paragraph-body-modal-sunday').html
									("No se puede mover el turno para el día seleccionado, por algunos de los siguientes motivos:<br><br>" +
									"<ul><li>Existe suporposición de turnos.</li><li>Existe pocas horas de diferencia entre turnos del mismo día.</li></ul>");
									
									$('#sunday-events').modal("show");
								} else {
									console.log("Parse error");
									revertFunc();
									$('#paragraph-body-modal-sunday').text
									("Hubo un error de parseo. Intentelo nuevamente.");
									
									$('#sunday-events').modal("show");
								}
  								
  							}
  						});
  					}
  				}
  				
		    })
		});
	</script>
</body>
</html>