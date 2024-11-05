<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="/home">Akasa Airline</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					
					
						<li class="nav-item"><a href="/home/pnr"
						class="btn btn-primary mx-2">PNR</a></li>
				
				</ul>	
				<form action="/home/searchflight" class="d-flex">
					<input class="form-control me-2" type="search" placeholder="Source"
						aria-label="Search" name="source"> <input
						class="form-control me-2" type="search" placeholder="Destination"
						aria-label="Search" name="destination">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
			<div>
				<div class="d-flex">
					<a href="/user/register" class="btn btn-primary mx-2">Register</a>
					<!-- <a href="/user/login" class="btn btn-primary mx-2">Login</a> <a
						href="/admin/login" class="btn btn-primary mx-1">Admin</a> -->

					<div class="dropdown">
						<a class="btn btn-primary dropdown-toggle" href=""
							role="button" id="dropdownMenuLink" data-bs-toggle="dropdown"
							 aria-expanded="false">Login</a>

						<div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
							<a class="dropdown-item" href="/user/login">User</a> 
							<a class="dropdown-item" href="/admin/login">Admin</a>		
						</div>
					</div>

				</div>
			</div>
		</div>
	</nav>

	<img src="/image/Akasa-Air-1-scale.jpg"
		style="width: 100%; height: 91vh"
		alt="home page for akasa airline project">

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>