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
				<a class="navbar-left" href="#"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></a>
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
								<li><a href="#">Registrar Producto</a></li>
								<li><a href="${pageContext.request.contextPath}/stock/mostrar">Visualizar Stock</a></li>
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
		<div class="main row">
			<div class="form-group">
				<form:form method="POST" id="myForm">
					<fieldset>
						<legend>Crear Producto</legend>
						
							<div class="form-group">
								<div class="row">
								
									<div class="col-lg-9 col-md-9 col-sm-7 col-xs-5">
							    		<label for="input-marca">Seleccione marca:</label>
							    		<select class="form-control selectpicker" id="input-marca" name="brand-id" data-live-search="true" title="Buscar por nombre de marca" required="required">
							    			<c:forEach items="${listaMarcas}" var="marca">
												<option value="${marca.id}">${marca.nombre}</option>
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
												<option value="${productos.id}">${productos.nombre}</option>
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
							  			 <label for="input-cantidad">Cantidad:</label>
							  			 <input type="number" class="form-control" id="input-cantidad" placeholder="Inserte la cantidad de productos ingresada al local (solo números)" name="quantity" required="required" autocomplete="off">
									</div>
									
									<div class="col-lg-3 col-md-3 col-sm-1 col-xs-1">
							  			 <label for="input-color-ink">Color tinta:</label>
							  			 <input type="text" class="form-control" id="input-color-ink" placeholder="Inserte el color de la tinta" name="color-ink" autocomplete="on">
									</div>
								</div>
							</div>
  							
  							<div class="form-group">
  								<div class="row">
  									<div class="col-lg-9 col-md-9 col-sm-7 col-xs-5">
				  			 			<label for="input-descripcion">Descripción:</label>
										<textarea class="form-control" rows="3" id="input-descripcion" placeholder="Inserte la descripción" name="description"></textarea>
									</div>
								</div>
							</div>
  							
  							<div class="form-group">
  								<button type="submit" class="btn btn-primary" id="btnSubmit" name="action" value="save">
									<span class="glyphicon glyphicon-plus"></span>
									Agregar
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
			//hidden.bs.modal: This event is fired when the modal has finished being hidden from the user (will 
					           //wait for CSS transitions to complete).
			
			$('#createBrandModal').on('hide.bs.modal', function() {
				$('#input-modal-marca').css('border', '');//Remove CSS property
			});
			
			$('#createProductModal').on('hide.bs.modal', function() {
				$('#input-modal-producto').css('border', '');//Remove CSS property
			});
			
		});
	</script>
</body>
</html>