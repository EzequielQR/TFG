<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>9420 - Control Comercial</title>
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
								<li><a href="#">Crear Turno</a></li>
								<li><a href="#">Visualizar Turno</a></li>
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
	<br><br>
	<div class="container">
		<section class="main row">
			<table class ="table table-bordered table-striped table-hover">
				<thead>
				    <tr>
				      <th class="col-md-1">Código</th>
				      <th class="col-md-2">Rol</th>
				      <th class="col-md-2">Apellido y Nombre</th>
				      <th class="col-md-2">Teléfono</th>
				      <th class="col-md-1">Detalles</th>
				      <th class="col-md-1">Editar Usuario</th>
				      <th class="col-md-1">Inhabilitar Usuario</th>
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
					      <td><a href="#" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
					      <td><a href="#" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
					    </tr>
				 	 </c:forEach>
				  </tbody>
			</table>
		</section>
	</div>
	<div id ="dataModal" class="modal fade">
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
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">Cerrar</button>	
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
					} else {
						$('.usuario_modal').html(obj1.usuario.nombre);
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
					//Trigger modal via Javascript:
					$('#dataModal').modal("show");
				}
			});			
		});
	});
	</script>
</body>
</html>