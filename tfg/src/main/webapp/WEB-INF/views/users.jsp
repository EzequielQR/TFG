<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="es">
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>Welcome</title>
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	</head>
	<body>
		<section>
			<div class="jumbotron">
				<div class="container">
					<h1>Users</h1>
					<p>All the available users in our store</p>
				</div>
			</div>
		</section>
		
		<section class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3" style="padding-bottom:15px;">
					<div class="thumbnail">
						<div class="caption">
							<h3>${user.id}</h3>
							<p>${user.password}</p>
						</div>
					</div>				
				</div>
			</div>
		</section>
	</body>
</html>