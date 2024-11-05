<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Confirm Booking</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
body {
	padding: 20px;
	background-color: #f8f9fa;
}

.booking-box {
	background-color: #fff;
	border-radius: 10px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	padding: 30px;
	margin-top: 50px;
}
</style>
</head>
<body>
	<div class="container mt-5">
		<div class="row justify-content-center">
			<div class="col-md-7">
				<div class="booking-box">
					<h2 class="text-center mb-4">Flight Details</h2>
					<div class="row">
						<div class="col-md-6">
							<p><strong>Flight Number:</strong> ${flight.flightNumber}</p>
							<p><strong>Source:</strong> ${flight.source}</p>
							<p><strong>Departure Time:</strong> ${flight.departureTime.toString().substring(0,10)} &nbsp  ${flight.departureTime.toString().substring(11,16)}</p>
						</div>
						<div class="col-md-6">
							<p><strong>Departure Date:</strong> ${flight.departureDate}</p>
							<p><strong>Destination:</strong> ${flight.destination}</p>
							<p><strong>Arrival Time:</strong> ${flight.arrivalTime.toString().substring(0,10)} &nbsp  ${flight.arrivalTime.toString().substring(11,16)}</p>
                       </div>
					</div>
					<div class="text-center">
						<p><strong>Price:</strong> ${flight.price}</p>
						<p><strong>Number of Seats:</strong> ${noOfSeat}</p>
						<p><strong>Total Price:</strong> ${flight.price * noOfSeat}</p>
					</div>
					<div class="text-center mt-4">
						<form action="/user/confirmBooking" method="post">
							<input type="hidden" name="flightId" value="${flight.id}">
							<input type="hidden" name="userId" value="${user.id}"> <input
								type="hidden" name="passanger2" value="${passanger2}"> <input
								type="hidden" name="passanger3" value="${passanger3}"> <input
								type="hidden" name="passanger4" value="${passanger4}"> <input
								type="hidden" name="noOfSeat" value="${noOfSeat}">
							<button type="submit" class="btn btn-primary">Confirm Booking</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div> 
	
	 <!-- // to be verified scr -->

	<!-- Bootstrap JS and jQuery (for Bootstrap features) -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
