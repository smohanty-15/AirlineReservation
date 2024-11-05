<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>edit flight details</title>
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
					<h2 class="text-center mb-2">Edit Flight Details</h2>
					<h4 class="text-center mb-2">Flight
						No-${editFlight.flightNumber}</h4>

					<form action="/admin/editFlight/${editFlight.id}" method="post">

						<div class="mb-3">

							<input type="hidden" class="form-control" id="flightNumber"
								name="flightNumber" value="${editFlight.flightNumber}" required>
						</div>

						<div class="mb-3">
							<label for="departureDate" class="form-label">Date</label> <input
								type="date" class="form-control" id="departureDate"
								name="departureDate" value="${editFlight.departureDate}"
								required>
						</div>

						<div class="mb-3">
							<label for="source" class="form-label">Source Airport</label> <input
								type="text" class="form-control" id="source" name="source"
								value="${editFlight.source}" required>
						</div>

						<div class="mb-3">
							<label for="destination" class="form-label">Destination
								Airport</label> <input type="text" class="form-control" id="destination"
								name="destination" value="${editFlight.destination}" required>
						</div>

						<div class="mb-3">
							<label for="departureTime" class="form-label">Departure
								Time</label> <input type="datetime-local" class="form-control"
								id="departureTime" name="departureTime"
								value="${editFlight.departureTime}" required>
						</div>



						<div class="mb-3">
							<label for="arrivalTime" class="form-label">Arrival Time</label>
							<input type="datetime-local" class="form-control"
								id="arrivalTime" name="arrivalTime"
								value="${editFlight.arrivalTime}" required>
						</div>


						<div class="mb-3">
							<input hidden="hidden" type="number" class="form-control"
								id="availableSeats" name="availableSeats"
								value="${editFlight.availableSeats}" required>
						</div>



						<div class="mb-3">
							<label for="price" class="form-label">Seat Fare</label> <input
								type="number" class="form-control" id="price" name="price"
								value="${editFlight.price}" required>
						</div>




						<div class="mb-3">
							<label for="flightStatus">Flight Status</label> <select
								class="form-control" id="flightStatus" name="flightStatus">
								<option value="${editFlight.flightStatus}" selected="selected">Select
									Status</option>
								<option value="SCHEDULED">SCHEDULED</option>
								<option value="CANCELLED">CANCELLED</option>
							</select>
						</div>



						<div class="d-grid mb-3">
							<button type="submit" class="btn btn-primary">Save
								Flight Details</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>










