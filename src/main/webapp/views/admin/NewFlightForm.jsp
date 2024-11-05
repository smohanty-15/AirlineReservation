<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>add flight form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-4 mt-5">
				<div class="card p-4">
					<h2 class="text-center mb-4">Add Flight Details</h2>
					<form action="/admin/addflight" method="post">

						<div class="mb-3">
							<label for="flightNumber" class="form-label">Flight
								Number</label> <input type="text" class="form-control" id="flightNumber"
								name="flightNumber" required>
						</div>

						<div class="mb-3">
							<label for="departureDate" class="form-label">Date Of
								Departure</label> <input type="date" class="form-control"
								id="departureDate" name="departureDate" required>
						</div>


						<div class="mb-3">
							<label for="source" class="form-label">Source Airport</label> <input
								type="text" class="form-control" id="source" name="source"
								required>
						</div>

						<div class="mb-3">
							<label for="destination" class="form-label">Destination
								Airport</label> <input type="text" class="form-control" id="destination"
								name="destination" required>
						</div>

						<div class="mb-3">
							<label for="departureTime" class="form-label">Departure
								Time</label> <input type="datetime-local" class="form-control"
								id="departureTime" name="departureTime" required>
						</div>

						<div class="mb-3">
							<label for="arrivalTime" class="form-label">Arrival Time</label>
							<input type="datetime-local" class="form-control"
								id="arrivalTime" name="arrivalTime" required>
						</div>

						<div class="mb-3">
							<label for="price" class="form-label">Seat Fare</label> <input
								type="number" class="form-control" id="price" name="price"
								required>
						</div>
						
						<div class="mb-3">
							<label for="availableSeats" class="form-label">Available Seats</label> <input
								type="number" class="form-control" id="availableSeats" name="availableSeats"
								required>
						</div>

						<div class="d-grid mb-3">
							<button type="submit" class="btn btn-primary">Add Flight</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>