<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

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
		
	<!-- Modal  to Add Event -->
	<div id="createEventModal" class="modal fade" role="dialog">
		 <div class="modal-dialog">
			 <!-- Modal content-->
			 <div class="modal-content">
				 <div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal">×</button>
					 <h4 class="modal-title">Add Event</h4>
				 </div>
				 <div class="modal-body">
					 <div class="control-group">
						 <label class="control-label" for="inputPatient">Event:</label>
						 <div class="field desc">
							 <input class="form-control" id="title" name="title" placeholder="Event" type="text" value="">
						 </div>
					 </div>
					 
					 <input type="hidden" id="startTime"/>
					 <input type="hidden" id="endTime"/>
					 
					 <div class="control-group">
						 <label class="control-label" for="when">When:</label>
						 	<div class="controls controls-row" id="when" style="margin-top:5px;">
						 	</div>
					 </div>
				 </div>
				 <div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
					 <button type="submit" class="btn btn-primary" id="submitButton">Save</button>
				 </div>
			 </div>
		 </div>
	</div>

	<!-- Modal to Event Details -->
	<div id="calendarModal" class="modal fade">
		<div class="modal-dialog">
			 <div class="modal-content">
				 <div class="modal-header">
					 <button type="button" class="close" data-dismiss="modal">×</button>
					 <h4 class="modal-title">Event Details</h4>
				 </div>
				 <div id="modalBody" class="modal-body">
					 <h4 id="modalTitle" class="modal-title"></h4>
					 <div id="modalWhen" style="margin-top:5px;"></div>
				 </div>
				 <input type="hidden" id="eventID"/>
				 <div class="modal-footer">
					 <button class="btn" data-dismiss="modal" aria-hidden="true">Cancel</button>
					 <button type="submit" class="btn btn-danger" id="deleteButton">Delete</button>
				 </div>
			 </div>
		</div>
	</div>
		
	<!-- 
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.7.0/moment.min.js"></script>
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	
	<script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/4.2.0/core/main.min.js"></script>
	-->
	
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
		    	
		    	weekends : true // will NOT hide Saturdays and Sundays
		    })
		});
	</script>
</body>
</html>