<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>enter booking details</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>

	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-8">
				<form action="/user/bookticket?userId=${loggedInUserId}"
					method="post">
					<div class="mt-5 card p-3 shadow">
						<div class="row">


							<div class="col-md-6">
								<div class="card">
									<div class="mx-3 my-3">
										<div class="text-center fs-5 fw-bold">Passangers</div>

										<div class="d-flex my-3">
											<div class="col-md-4">
												<label for="passangerName">passanger1</label>
											</div>
											<div class="col-md-8">
												<input class="form-control" type="text" id="passangerName"
													name="passangerName" readonly="readonly"
													value="${loggedInUser.firstName}  ${loggedInUser.lastName}"
													required>
											</div>
										</div>

										<div class="d-flex my-3">
											<div class="col-md-4">
												<label for="passanger2">passanger2</label>
											</div>
											<div class="col-md-8">
												<input class="form-control" type="text" id="passanger2"
													name="passanger2" placeholder="Optinal">
											</div>
										</div>
										<div class="d-flex my-3">
											<div class="col-md-4">
												<label for="passanger3">passanger3</label>
											</div>
											<div class="col-md-8">
												<input class="form-control" type="text" id="passanger3"
													name="passanger3" placeholder="Optinal">
											</div>
										</div>
										<div class="d-flex ">
											<div class="col-md-4">
												<label for="passanger4">passanger4</label>
											</div>
											<div class="col-md-8">
												<input class="form-control" type="text" id="passanger4"
													name="passanger4" placeholder="Optinal">
											</div>
										</div>
										<div>
											<input type="hidden" id="userId" name="userId"
												value="${userId}"> <input type="hidden"
												id="flightId" name="flightId" value="${flightId}">
										</div>
									</div>
								</div>
							</div>
							<div class="col-md-6">
								<div class="card p-3 mt-4">
									<div class="text-center fs-5 fw-bold mb-3 mt-3">Enter no
										of seat you want</div>


									<div>
										<div class="d-flex my-3">
											<div class="col-md-4">
												<label for="noOfSeat"> No of seats</label>
											</div>
											<div class="col-md-8">
												<input class="form-control" type="number" id="noOfSeat"
													name="noOfSeat" min="1" max="4" required>
											</div>
										</div>
									</div>

								</div>
								<div class="my-3 text-center mt-4">
									<button class="btn btn-warning mx-3" onclick=history.back()>Back</button>
									<button class="btn btn-warning " type="submit">Book
										Now</button>
								</div>
							</div>

						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
