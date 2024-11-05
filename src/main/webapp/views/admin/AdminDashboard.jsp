
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin Dashboard</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
body {
	background-image: url('/image/Akasa-Air-1-scale.jpg');
	background-size: cover;
	background-position: center top;
}

.navbar-brand {
	font-size: 1.5rem;
	font-weight: bold;
}

.navbar-nav .nav-link {
	font-weight: bold;
}

.container {
	text-align: center;
	color: white;
}

.navbar-nav .nav-link {
	border: 1px solid #198754;
	color: #198754;
	padding: 10px 25px;
	border-radius: 20px;
}

.navbar-nav .nav-link:hover {
	background-color: green;
}
</style>
</head>
<body>

	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Akasa Airline</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav me-auto">
					<li class="nav-item ms-2"><a class="nav-link"
						href="/admin/dashboard">Dashboard</a></li>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/admin/flight/add">Add Flight</a></li>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/admin/flight/view">View Flight</a></li>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/admin/bookings">View All Flight Bookings</a></li>

				</ul>
				<ul class="navbar-nav ms-auto">
					<span class="navbar-text ms-2">Welcome,${loggedInAdmin.name}</span>
					<!-- Added "me-3" class for right margin -->
					<li class="nav-item"><a class="nav-link ms-2 me-2"
						href="logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>


</body>
</html>


