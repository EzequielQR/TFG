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
								<li><a href="#">Visualizar Turnos</a></li>
							</ul>
					</li>
					<li class="dropdown active">
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
					<li><a href="#"><span class="glyphicon glyphicon-log-out"></span> Cerrar Sesi�n</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container">
		<form:form method="POST" modelAttribute="nuevaFichaClinica" id="myForm">
			<div class="well">
				<fieldset>
					<legend>Ficha Cl�nica: General</legend>
					<input type="hidden" name="id_customer" value="${id_cliente}">
					<input type="hidden" name="id_clinical_record" value="${id_ficha_clinica}">
					
					<div class="form-group">
						<div class="row">
							<div class="col-lg-6 col-md-6">
								<label for="inputName">Nombre</label>
								<input type="text" class="form-control" id="inputName" value="${nombre}" disabled="disabled"/>
							</div>
							
							<div class="col-lg-6 col-md-6">
								<label for="inputApellido">Apellido</label>
								<input type="text" class="form-control" id="inputApellido" value="${apellido}" disabled="disabled"/>
							</div>
						</div>
					</div>
					
					<div class="form-group">
						<label>Tipo de Sangre</label><br>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="A" required="required">A</label>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="B" required="required">B</label>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="AB" required="required">AB</label>
						<label class="radio-inline"><input type="radio" name="blood_type" id="" value="0" required="required">0</label>
					</div>
					
					<div class="form-group">
						<label>Factor RH</label><br>
						<label class="radio-inline"><input type="radio" name="rh_blood" id="" value="+" required="required">+</label>
						<label class="radio-inline"><input type="radio" name="rh_blood" id="" value="-" required="required">-</label>
					</div>

					<div class="form-group">
						<label for="inputAlergias">Alergias</label>
						<input type="text" class="form-control" name="allergies" id="inputAlergias" placeholder="Ingrese alergias"/>
					</div>

					<div class="form-group">
						<label for="inputCardiacos">Problemas Cardiacos</label>
						<input type="text" class="form-control" name="cardiac_problems" id="inputCardiacos" placeholder="Ingrese problemas cardiacos"/>
					</div>
					
					<div class="form-group">
						<label for="inputGralComment">Comentarios Generales</label>
						<input type="text" class="form-control" name="gral_comment" id="inputGralComment" placeholder="Ingrese comentarios"/>
					</div>
					
				</fieldset>
			</div><!-- End well tag -->
			
			<div class="well">
				<fieldset>
					<legend>Ficha Cl�nica: Piel</legend>
					
					<div class="form-group">
						<label>Psoriasis</label><br>
						<label class="radio-inline"><input type="radio" name="psoriasis" id="" value="true" required="required">Si</label>
						<label class="radio-inline"><input type="radio" name="psoriasis" id="" value="false" required="required">No</label>
					</div>
					
					<div class="form-group">
						<label>Eccema</label><br>
						<label class="radio-inline"><input type="radio" name="eczema" id="" value="true" required="required">Si</label>
						<label class="radio-inline"><input type="radio" name="eczema" id="" value="false" required="required">No</label>
					</div>
					
					<div class="form-group">
						<label>Queloide</label><br>
						<label class="radio-inline"><input type="radio" name="keloid" id="" value="true" required="required">Si</label>
						<label class="radio-inline"><input type="radio" name="keloid" id="" value="false" required="required">No</label>
					</div>
					
					<div class="form-group">
						<label for="inputSkinComment">Comentarios Piel</label>
						<input type="text" class="form-control" name="skin_comment" id="inputSkinComment" placeholder="Ingrese comentarios Piel"/>
					</div>
					
				</fieldset>
			</div><!-- End well tag -->
			
			<div class="well">
				<fieldset>
					<legend>Ficha Cl�nica: ETS</legend>
					
					<div class="form-group">
						<label>VIH</label><br>
						<label class="radio-inline"><input type="radio" name="hiv" id="" value="true" required="required">Si</label>
						<label class="radio-inline"><input type="radio" name="hiv" id="" value="false" required="required">No</label>
					</div>
					
					<div class="form-group">
						<label>Sifilis</label><br>
						<label class="radio-inline"><input type="radio" name="syphilis" id="" value="true" required="required">Si</label>
						<label class="radio-inline"><input type="radio" name="syphilis" id="" value="false" required="required">No</label>
					</div>
					
					<div class="form-group">
						<label>Hepatitis B</label><br>
						<label class="radio-inline"><input type="radio" name="hepatitis_b" id="" value="true" required="required">Si</label>
						<label class="radio-inline"><input type="radio" name="hepatitis_b" id="" value="false" required="required">No</label>
					</div>
					
					<div class="form-group">
						<label>HPV</label><br>
						<label class="radio-inline"><input type="radio" name="hpv" id="" value="true" required="required">Si</label>
						<label class="radio-inline"><input type="radio" name="hpv" id="" value="false" required="required">No</label>
					</div>
					
					<div class="form-group">
						<label for="inputStdComment">Comentarios ETS</label>
						<input type="text" class="form-control" name="std_comment" id="inputStdComment" placeholder="Ingrese comentarios ETS"/>
					</div>
					
				</fieldset>
			</div><!-- End well tag -->
			
			<div class="form-group">
				<button type="submit" class="btn btn-danger" id="btnFichaClinica" name="action" value="ficha_clinica">
					<span class="glyphicon glyphicon-tint"></span>
					Agregar ficha cl�nica
				</button>
			</div>
			
		</form:form>
	</div><!-- End div tag  -->
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
</body>
</html>