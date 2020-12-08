<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	<link rel="stylesheet" href="<c:url value="/resources/bootstrap-select-1.13.18/css/bootstrap-select.min.css"/>"/>
	<link rel="stylesheet" href="<c:url value="/resources/jquery-timepicker-1.3.5/css/jquery.timepicker.min.css"/>">
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
				<div class="form-group">
					<form:form method="POST" id="myForm">
						<fieldset>
							<legend>Crear Producto</legend>
							<input type="hidden" name="idProduct" value="${product.id}">
							
								<div class="form-group">
									<div class="row">
									
										<div class="col-lg-9 col-md-9 col-sm-7 col-xs-5">
								    		<label for="input-marca">Seleccione marca:</label>
								    		<select class="form-control selectpicker" id="input-marca" name="brand-id" data-live-search="true" title="Buscar por nombre de marca" required="required">
								    			<c:forEach items="${listaMarcas}" var="marca">
								    				<c:choose>
														<c:when test="${marca.nombre == product.marca.nombre}">
															<option selected value="${marca.id}">${marca.nombre}</option>
														</c:when>
														<c:otherwise>
															<option value="${marca.id}">${marca.nombre}</option>
														</c:otherwise>			    				
								    				</c:choose>
												</c:forEach>
								    		</select>
							    		</div>
							    		
							    		<div class="col-lg-3 col-md-3 col-sm-1 col-xs-1">
							    			<label for="input-agregar-marca">&nbsp;</label><br>
							    			<button type="button" class="btn btn-success" id="input-agregar-marca" data-toggle="modal" data-target="#createBrandModal">
							    				<span class="glyphicon glyphicon-plus"></span>
							    				Añadir nueva marca
							    			</button>
							    		</div>
							    		
							    	</div>
	  							</div>
	  							
	  							<div class="form-group">
									<div class="row">
									
										<div class="col-lg-9 col-md-9 col-sm-7 col-xs-5">
								    		<label for="input-producto">Seleccione producto:</label>
								    		<select class="form-control selectpicker" id="input-producto" name="product-id" data-live-search="true" title="Buscar por nombre de producto" required="required">
								    			<c:forEach items="${listaProductos}" var="productos">
								    				<c:choose>
								    					<c:when test="${productos.nombre == product.tipoProducto.nombre}">
								    						<option selected value="${productos.id}">${productos.nombre}</option>
								    					</c:when>
								    					<c:otherwise>
								    						<option value="${productos.id}">${productos.nombre}</option>
								    					</c:otherwise>
								    				</c:choose>
												</c:forEach>
								    		</select>
							    		</div>
							    		
							    		<div class="col-lg-3 col-md-3 col-sm-1 col-xs-1">
							    			<label for="input-agregar-producto">&nbsp;</label><br>
							    			<button type="button" class="btn btn-success" id="input-agregar-producto" data-toggle="modal" data-target="#createProductModal">
							    				<span class="glyphicon glyphicon-plus"></span>
							    				Añadir nuevo producto
							    			</button>
							    		</div>
							    		
							    	</div>
	  							</div>
	
								<div class="form-group">
								 	<div class="row">
									 	<div class="col-lg-9 col-md-9 col-sm-7 col-xs-5">
								  			 <label for="input-cantidad">Cantidad Actual:</label>
								  			 <input type="number" class="form-control" id="input-cantidad" placeholder="Inserte la cantidad de productos ingresada al local (solo números)" name="quantity" required="required" autocomplete="off" value="${product.cantidad}">
										</div>
										
										<div class="col-lg-3 col-md-3 col-sm-3 col-xs-3">
								  			 <label for="input-color-ink">Color Tinta:</label>
								  			 <input type="text" class="form-control" id="input-color-ink" placeholder="Inserte el color de la tinta" name="color-ink" autocomplete="on" value="${product.tipoProducto.nombre == 'Tinta' ? product.caracteristica : 'No'}">
										</div>
									</div>
								</div>
	  							
	  							<div class="form-group">
	  								<div class="row">
	  									<div class="col-lg-9 col-md-9 col-sm-7 col-xs-5">
											<label for="input-cantidad-minima">Cantidad Mínima Aceptable:</label>
											<input type="number" class="form-control" id="input-cantidad-minima" placeholder="Inserte la cantidad minima aceptable (solo números)" name="quantity_min" required="required" autocomplete="off" value="${product.cantidadMinima}">						
	  									</div>
	  								</div>
	  							</div>
	  							
	  							<div class="form-group">
	  								<div class="row">
	  									<div class="col-lg-9 col-md-9 col-sm-7 col-xs-5">
					  			 			<label for="input-descripcion">Descripción:</label>
											<textarea class="form-control" rows="3" id="input-descripcion" placeholder="Inserte la descripción" name="description"><c:if test="${product.tipoProducto.nombre != 'Tinta'}"><c:out value='${fn:trim(product.caracteristica)}'></c:out></c:if></textarea>
										</div>
									</div>
								</div>
	  							<div class="form-group">
	  								<button type="submit" class="btn btn-primary" id="btnSubmit" name="action" value="save">
										<span class="glyphicon glyphicon-pencil"></span>
										Editar
									</button>
	  							</div>
	  							
						</fieldset>
					</form:form>
				</div>
			</div>
		</div>
	
		 <!-- Modal -->
		<div class="modal fade" id="createBrandModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Crear Marca</h4>
		        </div>
		        <div class="modal-body">
		        
		        	<div class="form-group">
	  					<div class="row">
	  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	  							
	  							<form:form method="POST" action="redirectToCreationBrand" id="formModalBrand">
	  								<input type="hidden" name="idProduct" value="${product.id}">
					  				<label for="input-modal-marca">Marca:</label>
									<input type="text" class="form-control" id="input-modal-marca" placeholder="Ingrese la marca" name="marca-modal" required="required"/>
								</form:form>
							
							</div>
						</div>
					</div>
					
		        </div>
		        <div class="modal-footer">
		        
	        		<button type="button" class="btn btn-default" data-dismiss="modal">
	          			<span class="glyphicon glyphicon-remove"></span>
	          			Cerrar
	          		</button>
	          		<button type="button" class="btn btn-primary" id="btnSubmitBrandModal" name="action" value="createBrand">
	          			<span class="glyphicon glyphicon-plus"></span>
	          			Agregar Marca
	          		</button>
					
		        </div>
		      </div>
		      
		    </div>
		</div>
		
		<!-- Modal -->
		<div class="modal fade" id="createProductModal" role="dialog">
		    <div class="modal-dialog">
		    
		      <!-- Modal content-->
		      <div class="modal-content">
		        <div class="modal-header">
		          <button type="button" class="close" data-dismiss="modal">&times;</button>
		          <h4 class="modal-title">Crear Producto</h4>
		        </div>
		        <div class="modal-body">
		        
		        	<div class="form-group">
	  					<div class="row">
	  						<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
	  						
	  							<form:form method="POST" action="redirectToCreationProduct" id="formModalProduct">
	  								<input type="hidden" name="idProduct" value="${product.id}">
					  				<label for="input-modal-producto">Producto:</label>
									<input type="text" class="form-control" id="input-modal-producto" placeholder="Ingrese el producto" name="producto-modal" required="required"/>
								</form:form>
							
							</div>
						</div>
					</div>
					
		        </div>
		        <div class="modal-footer">
		        
					<button type="button" class="btn btn-default" data-dismiss="modal">
		          		<span class="glyphicon glyphicon-remove"></span>
		          		Cerrar
		          	</button>
		          	<button type="submit" class="btn btn-primary" id="btnSubmitProductModal" name="action" value="createProduct">
		          		<span class="glyphicon glyphicon-plus"></span>
		          		Agregar Producto
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
				
				//Cuando el select cambia de estado, se evalua la condicion
				$("#input-producto").change(function(){
					if($("#input-producto option:selected").text().toUpperCase() === 'TINTA'){
						$("#input-color-ink").prop("disabled", false);
						$("#input-descripcion").prop("disabled", true);
					} else{
						$("#input-color-ink").prop("disabled", true);
						$("#input-descripcion").prop("disabled", false);
					}
				});
				
				//This will fire the change event, hence, will check the conditions 
				$("#input-producto").trigger('change');
				
				$('#btnSubmitBrandModal').click(function(){
					
					if($('#input-modal-marca').val().trim().length === 0) {
						$('#input-modal-marca').val("")
						$('#input-modal-marca').css('border', '2px solid red');
					} else {
						$('#formModalBrand').submit();
					}
				});
				
				$('#btnSubmitProductModal').click(function(){
					
					if($('#input-modal-producto').val().trim().length === 0) {
						$('#input-modal-producto').val("")
						$('#input-modal-producto').css('border', '2px solid red');
					} else {
						$('#formModalProduct').submit();
					}
					
				});
				
				//hide.bs.modal: This event is fired immediately when the hide instance method has been called. 
				//				 When modal "hide" event starts.
				//hidden.bs.modal: This event is fired when the modal has finished being hidden from the user (will 
						           //wait for CSS transitions to complete).
				//				When modala "hide" event finished.
				
				$('#createBrandModal').on('hide.bs.modal', function() {
					$('#input-modal-marca').css('border', '');//Remove CSS property
				});
				
				$('#createProductModal').on('hide.bs.modal', function() {
					$('#input-modal-producto').css('border', '');//Remove CSS property
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
	</sec:authorize>
	<sec:authorize access="hasRole('CUSTOMER')">
		<% response.sendRedirect(request.getContextPath() + "/error403"); %>
	</sec:authorize>
</body>
</html>