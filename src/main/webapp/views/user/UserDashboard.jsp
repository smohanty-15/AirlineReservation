<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>User Dashboard</title>
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
						href="/user/dashboard">Dashboard</a></li>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/user/flight/view">View Flights</a></li>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/user/viewbookings/${loggedInUserId}">Booking History</a></li>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/user/contactus">Contact Us</a></li>

				</ul>
				<ul class="navbar-nav ms-auto ">
					<span class="navbar-text ms-2">Welcome,
						${loggedInUser.firstName} ${loggedInUser.lastName} </span>
					<li class="nav-item ms-2"><a class="nav-link"
						href="/user/profile">Profile</a></li>
					<li class="nav-item ms-2 me-2"><a class="nav-link"
						href="logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="containers mt-3">
		<h1 class="text-center text-white">Welcome to Akasa Airline</h1>
	</div>
	<div class="container mt-3">
		<div class="row">
			<div class="mx-auto">
				<form action="/user/flight/search" method="GET"
					class="col-md-3 mx-auto align-items-center mb-2">
					<div class="row">
						<div class="col-5">
							<label for="source" class="col-form-label fs-5 fw-bold ">Source:</label>
						</div>
						<div class="col-7">
							<input type="text" id="source" name="source" class="form-control">
						</div>
					</div>
					<div class="row mt-3">
						<div class="col-5">
							<label for="destination" class="col-form-label fs-5 fw-bold">Destination:</label>
						</div>
						<div class="col-7">
							<input type="text" id="destination" name="destination"
								class="form-control">
						</div>
					</div>


					<div class="col-auto">
						<button type="submit" class="btn btn-primary mt-3">Search</button>
					</div>

				</form>
			</div>
		</div>
	</div>

</body>
</html>
