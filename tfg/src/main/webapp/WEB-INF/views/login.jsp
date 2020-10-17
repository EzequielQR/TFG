<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
	<title>9420 - Control Comercial</title>
	<!--
	<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css">
	-->
	<link rel="icon" href="<c:url value="/resources/img/favicon.ico"/>">
	<link rel="stylesheet" href="<c:url value="/resources/bootstrap-3.3.7/css/bootstrap.min.css"/>">
	<style type="text/css">
		body {
		  /*SET RESPONSIVE BACKGROUND START*/ 
		  background: url(<c:url value="/resources/img/img-tattoo-bigV3.jpg"/>) no-repeat center center fixed; 
		  -webkit-background-size: cover;
		  -moz-background-size: cover;
		  -o-background-size: cover;
		  background-size: cover;
		 /*SET RESPONSIVE BACKGROUND FINISH*/
		 overflow: hidden;
		}
		#header {
	    background-color: black;
	    /*Opacity start*/
	    -ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=50)";
	    filter: alpha(opacity=80);
	    -moz-opacity: 0.80;
	    -khtml-opacity: 0.8;
	    opacity: 0.8;
	    /*Opacity end*/
	    color: white;
	    position: center;
	    top: 0;
	    left: 0;
	    width: 100%;
    	height: 80px;
    	padding: 0;
	    margin: 0;
        border-bottom: 1px solid #eee;

	    margin: 0px auto 50px auto;
	    text-align: center; 
	    font-family: Palatino Linotype;
	    letter-spacing: 1px; 
		}
	  .footer {
	  position: absolute;
	  bottom: 0;
	  width: 100%;
	  /* Set the fixed height of the footer here */
	  height: 60px;
	  line-height: 60px; /* Vertically center the text there */
	  background-color: #f5f5f5;
	 }
	.navbar-header {
    float: left;
    padding: 15px;
    text-align: center;
    width: 100%;
}
.navbar-brand {float:none;}
.navbar-img{float: none;}
</style>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
		  		<span class="navbar-img"><img src="<c:url value="/resources/img/img-snowflake48x48.png"/>"></span>
		    	<span class="navbar-brand">&nbsp;Control Comercial</span>
			</div>
		</div>
	</nav>
	<br><br><br><br><br><br><br><br><br>
	<div class="container col-lg-offset-5">
		<form action="${pageContext.request.contextPath}/login" method="POST">
			<div class="row">
				<div class="col-md-3 col-lg-3">
					<div class="input-group">
				        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
						<input id="inputUser" type="text" class="form-control" placeholder="Usuario" name="username">
					</div>
				</div>
			</div>	
			<br>
			<div class="row">
				<div class="col-md-3 col-lg-3">
					<div class="input-group">
     				    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
						<input id="inputPassword" type="password" class="form-control" placeholder="Contraseña" name="rawPassword">
					</div>
				</div>
			</div>
			<br>
			<b><button type="submit" class="btn btn-success">Iniciar Sesión</button></b>
		</form>
	</div>

	<nav class="navbar navbar-inverse navbar-fixed-bottom">
		<div class="container-fluid">
			<div class="navbar-header">
				<span class="text-muted">
		       		<span class="glyphicon glyphicon-info-sign">&nbsp;9420: Estudio Privado de Tatuajes&nbsp;</span>
		        	<span class="glyphicon glyphicon-map-marker">&nbsp;Ciudad de Córdoba: Paraná 487&nbsp;</span>
		        	<span class="glyphicon glyphicon-phone-alt">&nbsp;351-3432000&nbsp;</span>
		        </span>
			</div>
		</div>
	</nav>
	<script src="<c:url value="/resources/jquery-3.5.1/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/bootstrap-3.3.7/js/bootstrap.min.js"/>"></script>
</body>
</html>