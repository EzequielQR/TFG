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
					<li class="dropdown">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Usuarios<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/usuario/crear">Crear Usuario</a></li>
								<li><a href="${pageContext.request.contextPath}/usuario/mostrar">Visualizar Usuarios</a></li>
							</ul>
					</li>
					<li class="dropdown active">
						<a class="dropdown-toggle" data-toggle="dropdown" href="#">Productos<span class="caret"></span></a>
							<ul class="dropdown-menu">
								<li><a href="${pageContext.request.contextPath}/stock/crear">Registrar Producto</a></li>
								<li><a href="#">Visualizar Stock</a></li>
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
		<div class="alert alert-info alert-dismissible fade in">
    		<a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    		<strong>Información!</strong> Se va a visualizar en rojo los productos con stock bajo: Cantidad menor o igual a 5 unidades.
  		</div>
	
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
			      <th class="col-md-1">Código Producto</th>
			      <th class="col-md-2">Marca</th>
			      <th class="col-md-2">Tipo de Producto</th>
			      <th class="col-md-2">Detalle</th>
			      <th class="col-md-2">Cantidad</th>
			      <th class="col-md-1">Visualizar</th>
			      <th class="col-md-1">Editar Producto</th>
			      <th class="col-md-1">Eliminar Producto</th>
			    </tr>
			  </thead>
			  <tbody>
			  	<c:forEach items="${listaStock}" var="producto">
			  		<c:choose>
			  			<c:when test="${producto.cantidad <= 5}">
			  				<tr class="danger">
			  					<th>${producto.id}</th>
						  			<td>${producto.marca.nombre}</td>
						  			<td>${producto.tipoProducto.nombre}</td>
						  			<td>${producto.caracteristica}</td>
						  			<td>${producto.cantidad}</td>
									<td><a href="#" class="btn btn-default view_modal" data-id="${producto.id}"><span class="glyphicon glyphicon-eye-open"></span></a></td>
						      		<td><a href="<spring:url value="/stock/editar?id=${producto.id}"/>" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
						      		<td><a href="<spring:url value="/stock/eliminar?id-producto=${producto.id}"/>" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
			  				</tr>
			  			</c:when>
			  			<c:otherwise>
			  				<tr>
				  				<th>${producto.id}</th>
					  			<td>${producto.marca.nombre}</td>
					  			<td>${producto.tipoProducto.nombre}</td>
					  			<td>${producto.caracteristica}</td>
					  			<td>${producto.cantidad}</td>
					  			<td><a href="#" class="btn btn-default view_modal" data-id="${producto.id}"><span class="glyphicon glyphicon-eye-open"></span></a></td>
						      	<td><a href="<spring:url value="/stock/editar?id=${producto.id}"/>" class="btn btn-success"><span class="glyphicon glyphicon-pencil"></span></a></td>
						      	<td><a href="<spring:url value="/stock/eliminar?id-producto=${producto.id}"/>" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span></a></td>
				  			</tr>
			  			</c:otherwise>
			  		</c:choose>
			  	</c:forEach>
			  </tbody>			
		</table>
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
								<td><b>Marca</b></td>
								<td class="brand_modal"></td>
							</tr>
							<tr>
								<td><b>Tipo de Producto</b></td>
								<td class="type_product_modal"></td>
							</tr>
							<tr>
								<td><b>Detalle</b></td>
								<td class="detail_modal"></td>
							</tr>
							<tr>
								<td><b>Cantidad Disponible</b></td>
								<td class="quantity_modal"></td>
							</tr>
							<tr>
								<td><b>Usado en Turnos</b></td>
								<td class="product_has_appointments_modal"></td>
							</tr>
						</table>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-primary" data-dismiss="modal">
						<span class="glyphicon glyphicon-remove"></span>
						Cerrar
					</button>
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
	<script src="<c:url value="/resources/moment-2.27.0/js/moment.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/bootstrap-select.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-select-1.13.18/js/i18n/defaults-es_ES.min.js"/>"></script>
	<script src="<c:url value="/resources/jquery-timepicker-1.3.5/js/jquery.timepicker.min.js"/>"></script>
	<script src="<c:url value="/resources/datatables/js/datatables.min.js"/>"></script>
	<script type="text/javascript">
		//. class
		//# id
		$(document).ready(function(){
			//Comprobacion inicial
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
			
			$('.view_modal').click(function(){
				//Obtengo valor
				var product_id_obtained = $(this).attr("data-id");
					
					$.ajax({
						url: "ajaxcallprod",
						method: "get",
						//{key : value}
						data: {product_id : product_id_obtained},
						success: function(result){
							//The JSON you are receiving is in string. You have to convert it into JSON object.
							//Alert() only can display Strings.
							//For debug proposes, use console.log(data);
							
							moment.locale('es', {
								  months: 'Enero_Febrero_Marzo_Abril_Mayo_Junio_Julio_Agosto_Septiembre_Octubre_Noviembre_Diciembre'.split('_'),
								  monthsShort: 'Enero._Feb._Mar_Abr._May_Jun_Jul._Ago_Sept._Oct._Nov._Dec.'.split('_'),
								  weekdays: 'Domingo_Lunes_Martes_Miércoles_Jueves_Viernes_Sábado'.split('_'),
								  weekdaysShort: 'Dom._Lun._Mar._Mier._Jue._Vier._Sab.'.split('_'),
								  weekdaysMin: 'Do_Lu_Ma_Mi_Ju_Vi_Sa'.split('_')							
							});
							
							var obj1 = JSON.parse(result);
							console.log(obj1);
							
							$('.id_modal').html(obj1[0].id);
							$('.brand_modal').html(obj1[0].marca.nombre);
							$('.type_product_modal').html(obj1[0].tipoProducto.nombre);
							$('.detail_modal').html(obj1[0].caracteristica);
							$('.quantity_modal').html(obj1[0].cantidad);
							
							if(obj1[1] === undefined || obj1[1].length == 0){
								$('.product_has_appointments_modal').html("El producto seleccionado no fue usado en ningun turno");
							}
							else{
								var html = "<ul>";
								var index;
								
								for(index = 0; index < obj1[1].length; index++){
									html += "<li>" +
												moment(obj1[1][index].fechaInicio).format('dddd, DD/MMMM/YYYY, [Hora: ] HH:mm')
												+ " - "
												+ moment(obj1[1][index].fechaFin).format('HH:mm')
												+ "<br>" 
												+ obj1[1][index].descripcion
											"</li>";
								}
								
								html += "</ul>";
								$('.product_has_appointments_modal').html(html);
							}
							//Trigger modal via Javascript:
							$('#dataModal').modal("show");
						}
					});			
				});
			
    	});
	</script>
</body>
</html>