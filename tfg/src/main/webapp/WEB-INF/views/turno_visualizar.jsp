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
	<link rel="stylesheet" href="<c:url value="/resources/fullcalendar-3.10.2/css/fullcalendar.min.css"/>">
</head>
<body>
	<sec:authorize access="hasAnyRole('ADMIN', 'TATTOOIST', 'MANAGER', 'RECEPTIONIST')">
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
						<li><a href="${pageContext.request.contextPath}/backup">Back-up</a></li>
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
	  				<c:forEach items="${listTatuadores}" var="tattooist">
	  					<span class="badge" style="background-color: ${tattooist.color}">&nbsp;</span>&nbsp;${tattooist.pseudonimo}&nbsp;&nbsp;
	  				</c:forEach>
				</div>
				
				<div class="col-lg-2 col-md-3 col-sm-3 col-xs-3">
					<label for="school_selector">Filtrar por Tatuador:</label>
					<select class="form-control" id="school_selector">
	  					<option value="all">Todos</option>
	  					<c:forEach items="${listTatuadores}" var="tattooist">
	  						<option value="${tattooist.color}">${tattooist.pseudonimo}</option>
	  					</c:forEach>
					</select>
				</div>
				<br>
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
			<div class="modal-dialog" id="detailsAppointmentDialog">
			
				<!-- MODAL CONTENT -->
				<div class="modal-content">
				
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal">&times;</button>
						<h4 class="modal-title" id="title-modal-appointment">Detalles del turno</h4>
					</div>
					
					<ul class="nav nav-tabs" id="tabContent">
	    				<li class="active"><a href="#details-tab" data-toggle="tab" id="tab-details"><strong>Detalles</strong></a></li>
	    				<li><a href="#add-supplies-tab" data-toggle="tab" id="tab-add-supplies"><strong>Añadir Insumos Utilizados</strong></a></li>
						<li><a href="#delete-supplies-tab" data-toggle="tab" id="tab-delete-supplies"><strong>Eliminar Insumos Utilizados</strong></a></li>
					</ul>
					
					<div class="modal-body">
						<div class="tab-content">
							<div class="tab-pane active" id="details-tab"><!-- DETAILS TAB -->
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
											<td><b>Imagen de Referencia</b></td>
											<td class="reference_image_modal"></td>
										</tr>
										<tr>
											<td><b>Insumos Utilizados</b></td>
											<td class="used_products_modal"></td>
										</tr>
										<tr>
											<td><b>Turno Iniciado Por</b></td>
											<td class="appointment_created_by"></td>
										</tr>
										<tr>
											<td><b>Foto Post-Sesión</b></td>
											<td class="photo_post"></td>
										</tr>
									</table>
								</div>
							</div><!-- Tab 1: Details -->
							<div class="tab-pane" id="add-supplies-tab">
	
								<div class="form-group">
									<div class="row">
										<table id="table_id_1" class ="table table-condensed table-bordered table-striped table-hover" style="width:100%;">
											<caption style="text-align:center;"><strong>Insumos en Stock</strong></caption>
											<thead>
												<tr class="warning">
													<th class="col-md-1">ID</th>
													<th class="col-md-1">Marca</th>
													<th class="col-md-2">Tipo Producto</th>
											      	<th class="col-md-3">Caracteristica</th>
											      	<th class="col-md-1">Cantidad Disponible</th>
											      	<th class="col-md-1">Agregar Producto</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							
								<div class="form-group">
									<div class="row">
										<table id="table_id_2" class ="table table-condensed table-bordered table-striped table-hover" style="width:100%;">
											<caption style="text-align:center;"><strong>Insumos Registrados</strong></caption>
											<thead>
												<tr class="warning">
													<th class="col-md-1">ID</th>
													<th class="col-md-1">Marca</th>
											      	<th class="col-md-2">Tipo Producto</th>
											      	<th class="col-md-3">Caracteristica</th>
											      	<th class="col-md-2">Eliminar Producto</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
								
							</div><!-- Tab 2: Add supplies -->
							<div class="tab-pane" id="delete-supplies-tab"><!-- Tab 3: Delete supplies -->
								<div class="form-group">
									<div class="row">
										<table id="table_id_3" class ="table table-condensed table-bordered table-striped table-hover" style="width:100%;">
											<caption style="text-align:center;"><strong>Insumos Utilizados</strong></caption>
											<thead>
												<tr class="warning">
													<th class="col-md-1">ID</th>
													<th class="col-md-1">Marca</th>
													<th class="col-md-2">Tipo Producto</th>
											      	<th class="col-md-3">Caracteristica</th>
											      	<th class="col-md-1">Cantidad Disponible en Stock</th>
											      	<th class="col-md-1">Eliminar Producto</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							
								<div class="form-group">
									<div class="row">
										<table id="table_id_4" class ="table table-condensed table-bordered table-striped table-hover" style="width:100%;">
											<caption style="text-align:center;"><strong>Insumos Eliminados</strong></caption>
											<thead>
												<tr class="warning">
													<th class="col-md-1">ID</th>
													<th class="col-md-1">Marca</th>
											      	<th class="col-md-2">Tipo Producto</th>
											      	<th class="col-md-3">Caracteristica</th>
											      	<th class="col-md-2">Deshacer acción</th>
												</tr>
											</thead>
											<tbody>
											</tbody>
										</table>
									</div>
								</div>
							</div><!-- Tab 3: Delete supplies -->
						</div><!-- Tab content root -->
					</div><!-- Modal body -->
					
					<div class="modal-footer">
						
						<!-- Form linked to TAB 1 -->
						<form:form method="POST" action="actionDetailsAppointment" id="form-details-appointment">
							<input type="hidden" id="appointmentHiddenId" name="id-appointment"/>
						    <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
						    <button type="submit" class="btn btn-info" id="editButtonTab1" name="btn-action" value="edit">Editar Turno</button>
							<button type="submit" class="btn btn-warning" id="deleteButtonTab1" name="btn-action" value="delete">Borrar Turno</button>
						</form:form>
						
						<!-- Form linked to TAB 2 -->
						<form:form method="POST" action="actionAddproductsToAppointment" id="form-add-products-appointment">
							<input type="hidden" id="appointmentHiddenTab2" name="id-appointment">
							<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
							<button type="submit" class="btn btn-info" id="editButtonTab2" name="btn-action" value="add">Agregar Insumos</button>
						</form:form>
						
						<!-- Form linked to TAB 3 -->
						<form:form method="POST" action="actionDeleteproductsToAppointment" id="form-delete-products-appointment">
							<input type="hidden" id="appointmentHiddenTab3" name="id-appointment">	
							<button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
							<button type="submit" class="btn btn-warning" id="editButtonTab3" name="btn-action" value="edit">Eliminar Insumos</button>
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
		<script src="<c:url value="/resources/fullcalendar-3.10.2/js/fullcalendar.min.js"/>"></script>
	
		<!-- .class -->
		<!-- # id -->
		<script type="text/javascript">
			$(document).ready(function() {
				
				$('#form-add-products-appointment').hide();
				$('#editButtonTab2').hide();
				
				$('#form-delete-products-appointment').hide();
				$('#editButtonTab3').hide();
				
				$('#form-delete-products-appointment').hide();
				
				$(document).on('click', '.remove-photo', function eventDeletePhotoPostSession(){
					var idAppointment = $('.id_modal').text();
					
					$.ajax({
						url			:	"ajaxDeletePhotoPostSession",
						method		:	"GET",
						//{key : value}
						data		:	{id_appointment	: idAppointment}, 
						success		:	function(result){
							
							console.log(result);
	
							if("success" === result){
								$('.photo_post').html('El turno seleccionado no dispone de una foto post-sesión.<br>'
									    + 'Puede agregar la foto, al editar el turno.');
							}
							else{
								console.log(result);
							}
							
						}//End success
						
					}); //End AJAX
				});
				
				$(document).on('click', '.row-add-product', function eventClickRowAdd(){
					
					//$(this).hide();
					$(this).attr('disabled', true);
					$(this).prop('disabled', true);
					
					$('#editButtonTab2').show();
	
					// get the current row
			         var $row = $(this).closest("tr");
					 var $indexRow = $row.index();
					
					//FIND() = CHILDREN()
			         var $id = $row.find("td:nth-child(1)").text();
			         var $brand = $row.find("td:nth-child(2)").text();
			         var $typeProduct = $row.find("td:nth-child(3)").text();
			         var $charasterstic = $row.find("td:nth-child(4)").text();
			         var $quantity = $row.find("td:nth-child(5)").text();
	
			         if($quantity >= 1){
			        	 $quantity = parseInt($quantity) - 1;
			        	 $indexRow = $indexRow + 1;
			        	 
			        	 $("#table_id_1 tr:eq(" + $indexRow + ") td:eq(4)").text($quantity);
			        	 
			        	 $("#table_id_2").append('<tr>'
									+  '<td>' + 	$id 			+ '</td>'
									+  '<td>' + 	$brand 			+ '</td>'
									+  '<td>' + 	$typeProduct 	+ '</td>'
									+  '<td>' +		$charasterstic	+ '</td>'
									+  '<td><button type="button" class="btn btn-danger row-delete-product"><span class="glyphicon glyphicon-minus"></span></button></td>'
									+ '</tr>');
			        	 
			        	 //Add hidden input to form.
			        	 $("#form-add-products-appointment").append
			        	 						('<input type="hidden" id="tab2_hide" name="prodId[]" value="'+ $id +'">');
			        	 //End: Add hidden input to form.
			        	 
			        	 console.log($("#form-add-products-appointment").serializeArray());
			         }
			         else
			        	 console.log("No existe stock para el producto seleccionado.");
			        	 
				});
				
				
				$(document).on('click', '.row-delete-product', function(e){
					var $row_deleted = $(this).closest("tr");
					$(this).closest("tr").remove();									//remove row
					
					var $id_product = $row_deleted.find("td:nth-child(1)").text();	//Getting a specific <td> value
					
					//Start: Add 1 to master table	&& show button
					$('#table_id_1 tr').each(function(){
				        if($(this).find('td').eq(0).text() == $id_product){
				            $quantity = $(this).find("td:nth-child(5)").text();
				            $quantity = parseInt($quantity) + 1;
				            
				            $(this).find("td:nth-child(5)").text($quantity);
				            $(this).find("td:nth-child(6)").html
				            	('<a href="#" class="btn btn-success row-add-product"><span class="glyphicon glyphicon-plus"></span></a>');
				        }
				    }); 
					//End: Add 1 to master table	&& show button
					
					//Check if second table is empty, if is empty, remove form submission button
					if($('#table_id_2 tbody').children().length == 0)
						$('#editButtonTab2').hide();
					else
						$('#editButtonTab2').show();
					//End: Check if second table is empty, if is empty, remove form submission button
					
					//Delete hidden input of form.
					$("#form-add-products-appointment input[type='hidden'][name='prodId[]']").each(function(){
						if($(this).val() == $id_product){
							$(this).remove();
							return false;				//(return;=continue)	(return false;=break;)
						}
					});
					//End: delete hidden input of form.
					
		        	console.log($("#form-add-products-appointment").serializeArray());
				});
				
				$(document).on('click', '.row-add-product-tab3', function eventClickRowAddTab3(){
					
					$(this).attr('disabled', true);
					$(this).prop('disabled', true);
					
					$('#editButtonTab3').show();
					
					// get the current row
			        var $row = $(this).closest("tr");
					var $indexRow = $row.index();
					 
					//FIND() = CHILDREN()
			        var $id = $row.find("td:nth-child(1)").text();
			        var $brand = $row.find("td:nth-child(2)").text();
			        var $typeProduct = $row.find("td:nth-child(3)").text();
			        var $charasterstic = $row.find("td:nth-child(4)").text();
			        var $quantity = $row.find("td:nth-child(5)").text();
			        
			        $quantity = parseInt($quantity) + 1;
		        	$indexRow = $indexRow + 1;
					
		        	$("#table_id_3 tr:eq(" + $indexRow + ") td:eq(4)").text($quantity);
	
		        	$("#table_id_4").append('<tr>'
							+  '<td>' + 	$id 			+ '</td>'
							+  '<td>' + 	$brand 			+ '</td>'
							+  '<td>' + 	$typeProduct 	+ '</td>'
							+  '<td>' +		$charasterstic	+ '</td>'
							+  '<td><button type="button" class="btn btn-danger row-delete-product-tab3"><span class="glyphicon glyphicon-repeat"></span></button></td>'
							+ '</tr>');
		        	
		        	//Add hidden input to form.
		        	$("#form-delete-products-appointment").append
		        	 						('<input type="hidden" id="tab3_hide" name="prodId[]" value="'+ $id +'">');
		        	//End: Add hidden input to form.
		        	 
		        	console.log($("#form-delete-products-appointment").serializeArray());
				});
				
				$(document).on('click', '.row-delete-product-tab3', function(e){
					
					var $row_deleted = $(this).closest("tr");
					$(this).closest("tr").remove();									//remove row
					
					var $id_product = $row_deleted.find("td:nth-child(1)").text();	//Getting a specific <td> value
					
					//Start: Add 1 to master table	&& show button
					$('#table_id_3 tr').each(function(){
				        if($(this).find('td').eq(0).text() == $id_product){
				            $quantity = $(this).find("td:nth-child(5)").text();
				            $quantity = parseInt($quantity) + 1;
				            
				            $(this).find("td:nth-child(5)").text($quantity);
				            $(this).find("td:nth-child(6)").html
				            	('<a href="#" class="btn btn-danger row-add-product-tab3"><span class="glyphicon glyphicon-minus"></span></a>');
				        }
				    }); 
					//End: Add 1 to master table	&& show button
					
					//Check if second table is empty, if is empty, remove form submission button
					if($('#table_id_4 tbody').children().length == 0)
						$('#editButtonTab3').hide();
					else
						$('#editButtonTab3').show();
					//End: Check if second table is empty, if is empty, remove form submission button
					
					//Delete hidden input of form.
					$("#form-delete-products-appointment input[type='hidden'][name='prodId[]']").each(function(){
						if($(this).val() == $id_product){
							$(this).remove();
							return false;				//(return;=continue)	(return false;=break;)
						}
					});
					//End: delete hidden input of form.
					
		        	console.log($("#form-delete-products-appointment").serializeArray());
				});
				
				$('#tab-details').click(function(){
					$('#detailsAppointmentDialog').removeClass("modal-lg");
					$('#form-details-appointment').show();
					$('#form-add-products-appointment').hide();
					$('#form-delete-products-appointment').hide();
				});
				
				$('#tab-add-supplies').click(function(){
					$('#detailsAppointmentDialog').addClass("modal-lg");
					$('#form-details-appointment').hide();
					$('#form-add-products-appointment').show();
					$('#form-delete-products-appointment').hide();
				});
				
				$('#tab-delete-supplies').click(function(){
					$('#detailsAppointmentDialog').addClass("modal-lg");
					$('#form-details-appointment').hide();
					$('#form-add-products-appointment').hide();
					$('#form-delete-products-appointment').show();
				});
				
			    // Page is now ready, initialize the calendar with JS Code.
			    $('#calendar').fullCalendar({
			    	
			    	header : {
			    				left: '',
			            		center: 'title',
			            		right: 'today prev,next'
			       			 },
			    	
			    	monthNames: ['Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio', 'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre'],
	
		            monthNamesShort: ['Ene', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
	
		            dayNames: ['Domingo', 'Lunes', 'Martes', 'Miércoles', 'Jueves', 'Viernes', 'Sábado'],
	
		            dayNamesShort: ['Dom', 'Lun', 'Mar', 'Mié', 'Jue', 'Vie', 'Sáb'],
		            
		            buttonText:	{today:'Mes actual'},
			    	
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
								$('#appointmentHiddenTab2').val(obj.id);
								$('#appointmentHiddenTab3').val(obj.id);
								
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
								$('.appointment_created_by').html(obj.usuario.nombre);
								
								if(!obj.imagenURL)	
									$('.reference_image_modal').html("El turno seleccionado no dispone de una imagen de referencia.");
								else
									$('.reference_image_modal').html("<a href='" + obj.imagenURL+ "' class='btn btn-block btn-success' target='_blank'><span class='glyphicon glyphicon-picture'></span>&nbsp;Ver imagen de referencia</a>");
								
								if(!obj.listaProductosUtilizados || obj.listaProductosUtilizados.length == 0)
									$('.used_products_modal').html("El turno seleccionado no registra insumos utilizados.");
								else{
									var htmlUsedProducts = "<ul>";
									var index;
									
									for(index = 0; index < obj.listaProductosUtilizados.length; index++){
										htmlUsedProducts += "<li>" 
															+ obj.listaProductosUtilizados[index].marca.nombre
															+ ":&nbsp;"
															+ obj.listaProductosUtilizados[index].tipoProducto.nombre
															+ ".&nbsp;Caracteristica:&nbsp;"
															+ obj.listaProductosUtilizados[index].caracteristica
															+ "</li>";						
									}
									
									htmlUsedProducts += "</ul>"
									
									$('.used_products_modal').html(htmlUsedProducts);
								}
								
								if(obj.publicId)
									$('.photo_post').html('<a href="' + obj.publicId + '" class="btn btn-success" target="_blank">'
												+ '<span class="glyphicon glyphicon-picture"></span>&nbsp;Ver Imagen Post-Sesión'
												+ '</a>'
												+ '&nbsp;'
												+ '<button type="button" class="btn btn-danger remove-photo">'
												+ '<span class="glyphicon glyphicon-remove"></span>&nbsp;Eliminar Imagen'
												+ '</button>');
								else
									$('.photo_post').html('El turno seleccionado no dispone de una foto post-sesión.<br>'
													    + 'Puede agregar la foto, al editar el turno.');
								
								
								var tab3Index;
								var htmlTab3 = "<tr>";
								
								for(tab3Index = 0; tab3Index < obj.listaProductosUtilizados.length; tab3Index++){
									htmlTab3 +=  "<tr>"
												 	+ "<td>" + obj.listaProductosUtilizados[tab3Index].id + "</td>"
												 	+ "<td>" + obj.listaProductosUtilizados[tab3Index].marca.nombre + "</td>"
												 	+ "<td>" + obj.listaProductosUtilizados[tab3Index].tipoProducto.nombre + "</td>"
												 	+ "<td>" + obj.listaProductosUtilizados[tab3Index].caracteristica + "</td>"
												 	+ "<td>" + obj.listaProductosUtilizados[tab3Index].cantidad + "</td>"
												 	+ '<td><a href="#" class="btn btn-danger row-add-product-tab3"><span class="glyphicon glyphicon-minus"></span></a></td>'
												+ "</tr>";
								}
								
								$("#table_id_3").append(htmlTab3);
								
					    	}
					    });
					    //Ajax 1
					    
					    
					  	//Ajax 2
						var idAppointm = event.id;
						console.log(idAppointm);
					  	
						$.ajax({
						   	url : "ajaxCreateTableTab2",
						   	method : "get",
						   	data : {id_appointment : idAppointm},	//{key : value}
						   	success : function(result){
								//The JSON you are receiving is in string. You have to convert it into JSON object.
								//Alert() only can display Strings.
								//For debug proposes, use console.log(data);
									
								if(result == 'not-found-available-products'){
									console.log("No existen productos disponibles");
								}
								else{
									var obj = JSON.parse(result);
									var index;
									var html = "<tr>";
										
									for(index = 0; index < obj.length; index++){
										html +=   		"<td>" + obj[index].id + "</td>"
													+	"<td>" + obj[index].marca.nombre + "</td>"
													+	"<td>" + obj[index].tipoProducto.nombre + "</td>"
													+   "<td>" + obj[index].caracteristica + "</td>"
													+   "<td>" + obj[index].cantidad + "</td>"
													+   '<td><a href="#" class="btn btn-success row-add-product"><span class="glyphicon glyphicon-plus"></span></a></td>'
												  + "</tr>"
									}
										
									$("#table_id_1").append(html);
								}
						   	}
						});
						//End Ajax 2
					    
					    $('#detailsAppointmentModal').modal("show");
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
	  				},
	  				eventRender: function eventRender( event, element, view ) {
	  					return $('#school_selector').val() === 'all' || 
	  							[event.color].indexOf($('#school_selector').val()) >= 0;
	  				}
			    })
			    
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
				
				$('#detailsAppointmentModal').on('hide.bs.modal', function() {
		            $(this).removeData('bs.modal');
				    $(this).data('bs.modal', null);
				    
				    $("#table_id_1 tbody tr").remove();
				    $("#table_id_2 tbody tr").remove();
				    $("#table_id_3 tbody tr").remove();
				    $("#table_id_4 tbody tr").remove();
				    
				    $("#form-add-products-appointment input[type='hidden'][name='prodId[]']").remove();
				    $('#editButtonTab2').hide();
				    
				    $("#form-delete-products-appointment input[type='hidden'][name='prodId[]']").remove();
				    $('#editButtonTab3').hide();
				    
				    $("#tab-details").trigger("click");
				});
				
				$('#school_selector').on('change',function(){
				    $('#calendar').fullCalendar('rerenderEvents');
				});
				
			});
		</script>
	</sec:authorize>
	<sec:authorize access="hasRole('CUSTOMER')">
		<% response.sendRedirect(request.getContextPath() + "/error403"); %>
	</sec:authorize>
</body>
</html>