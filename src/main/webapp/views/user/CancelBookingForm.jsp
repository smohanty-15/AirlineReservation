<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Cancel Booking</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
.card {
	margin: auto;
	margin-top: 50px;
	width: 50%;
	padding: 20px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="card">
			<div class="card-body">
				<h2 class="card-title text-center">Cancel Booking</h2>
				<form method="post"
					action="/user/booking/cancel/${booking.bookingId}">
					<p class="text-center">Are you sure you want to cancel this
						booking?</p>
					<div class="text-center">
						<input type="submit" class="btn btn-danger"
							value="Yes, Cancel Booking">
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
