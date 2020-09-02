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
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css"/>
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
								<li><a href="#">Crear Turno</a></li>
								<li><a href="#">Visualizar Turnos</a></li>
							</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Usuarios<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Crear Usuario</a></li>
								<li><a href="#">Visualizar Usuarios</a></li>
							</ul>
					</li>
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="#">Registrar Producto</a></li>
								<li><a href="#">Visualizar Stock</a></li>
							</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li><a href="#"><span class="glyphicon glyphicon-user"></span> ${nombre}</a></li>
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesión</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container">
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
	<div class="modal fade" id="calendarModal" role="dialog">
		<div class="modal-dialog">
		
			<!-- MODAL CONTENT -->
			<div class="modal-content">
			
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">&times;</button>
					<h4 class="modal-title">Event Details</h4>
				</div>
				
				<div class="modal-body" id="modalBody">
					<h4 id="modalTitle" class="modal-title"></h4>
					<div id="modalWhen" style="margin-top:5px;"></div>
				</div>
				
				<input type="hidden" id="eventID"/>
				
				<div class="modal-footer">
				    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="submit" class="btn btn-danger" id="deleteButton">Delete</button>
				</div>
				
			 </div>
			 
		</div>
	</div>
		
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.27.0/moment.min.js"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
	
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
		    	
		    	//eventClick function: When we click in a day, an event will trigger.
		    	
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
							
							$('#date_picked_hidden').val(date.format());
							$('#date_picked_show').text(date.format());
							$('#createEventModal').modal("show");
  				}
		    })
		});
	</script>
</body>
</html>