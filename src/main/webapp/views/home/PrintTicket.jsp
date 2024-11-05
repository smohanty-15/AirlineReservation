<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>print ticket</title>
<!-- Bootstrap CSS -->
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">

</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-9">
				<div class="mt-5 card p-3 shadow">
					<div class="col">

						<div class="mt-2 card p-3 ">

							<div class="col">
								<div class="row">
									<div class="col-md-4">
										<div class="card ">
											<p class="mx-3 mt-2">
												<strong>PNR :</strong> ${bookingDetails.pnr}
											</p>
											<p class="mx-3">
												<strong>Status:</strong> ${bookingDetails.bookingStatus}
											</p>
											<p class="mx-3">
												<strong>Flight No:</strong>
												${bookingDetails.flight.flightNumber}
											</p>
										</div>
									</div>
									<div class="col-md-8">
										<div class="row mx-3">
											<div class="col-md-5">
												<h5>
													<strong>${bookingDetails.flight.source}</strong>
												</h5>
												<p class="mt-3">
													<strong>
														${bookingDetails.flight.departureTime.toString().substring(11,16)}</strong>
												</p>
												<p>
													<strong>
														${bookingDetails.flight.departureTime.toString().substring(0,10)}</strong>
												</p>

											</div>
											<div class="col-md-2">---></div>
											<div class="col-md-5">

												<h5>
													<strong>${bookingDetails.flight.destination}</strong>
												</h5>

												<p class="mt-3">
													<strong>${bookingDetails.flight.arrivalTime.toString().substring(11,16)}</strong>
												<p>
													<strong>${bookingDetails.flight.arrivalTime.toString().substring(0,10)}
													</strong>
												</p>

											</div>
										</div>
									</div>
								</div>
								<hr>
								<div class="row">

									<div class="col-md-4">Regular Fare
										${bookingDetails.flight.price}</div>
									<div class="col-md-4">
										check-in luggage-> <strong>
											${15*bookingDetails.noOfSeat}Kg </strong> (15Kg per person)
									</div>
									<div class="col-md-4">
										carry-on luggage-> <strong>
											${7*bookingDetails.noOfSeat}Kg</strong> (7Kg per person)
									</div>

								</div>
								<hr>
								<div class="row  ">
									<div class="col-md-10  mx-5">
										<!-- if else condition accoding to the no of passanger -->
										<c:if test="${bookingDetails.noOfSeat eq 1}">
											<div>
												<table class="table">
													<thead>
														<tr>
															<th scope="col">Sl No</th>
															<th scope="col">Name</th>
															<th scope="col">Seat No</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">1</th>
															<td>${bookingDetails.user.firstName}
																${bookingDetails.user.lastName}</td>
															<td>${bookingDetails.fromSeatNo}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:if>
										<c:if test="${bookingDetails.noOfSeat eq 2}">
											<div>
												<table class="table">
													<thead>
														<tr>
															<th scope="col">Sl No</th>
															<th scope="col">Name</th>
															<th scope="col">Seat No</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">1</th>
															<td>${bookingDetails.user.firstName}
																${bookingDetails.user.lastName}</td>
															<td>${bookingDetails.fromSeatNo}</td>
														</tr>
														<tr>
															<th scope="row">2</th>
															<td>${bookingDetails.passanger2}</td>
															<td>${1+bookingDetails.fromSeatNo}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:if>
										<c:if test="${bookingDetails.noOfSeat eq 3}">
											<div>
												<table class="table">
													<thead>
														<tr>
															<th scope="col">Sl No</th>
															<th scope="col">Name</th>
															<th scope="col">Seat No</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">1</th>
															<td>${bookingDetails.user.firstName}
																${bookingDetails.user.lastName}</td>
															<td>${bookingDetails.fromSeatNo}</td>
														</tr>
														<tr>
															<th scope="row">2</th>
															<td>${bookingDetails.passanger2}</td>
															<td>${1+bookingDetails.fromSeatNo}</td>
														</tr>
														<tr>
															<th scope="row">3</th>
															<td>${bookingDetails.passanger3}</td>
															<td>${2+bookingDetails.fromSeatNo}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:if>
										<c:if test="${bookingDetails.noOfSeat eq 4}">
											<div>
												<table class="table">
													<thead>
														<tr>
															<th scope="col">Sl No</th>
															<th scope="col">Name</th>
															<th scope="col">Seat No</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<th scope="row">1</th>
															<td>${bookingDetails.user.firstName}
																${bookingDetails.user.lastName}</td>
															<td>${bookingDetails.fromSeatNo}</td>
														</tr>
														<tr>
															<th scope="row">2</th>
															<td>${bookingDetails.passanger2}</td>
															<td>${1+bookingDetails.fromSeatNo}</td>
														</tr>
														<tr>
															<th scope="row">3</th>
															<td>${bookingDetails.passanger3}</td>
															<td>${2+bookingDetails.fromSeatNo}</td>
														</tr>
														<tr>
															<th scope="row">4</th>
															<td>${bookingDetails.passanger4}</td>
															<td>${3+bookingDetails.fromSeatNo}</td>
														</tr>
													</tbody>
												</table>
											</div>
										</c:if>

									</div>

								</div>
							</div>
						</div>

						<div class="mt-2 card p-3 ">
							<div class="row">
								<div class="col-md-6">You have paid INR
									${bookingDetails.flight.price * bookingDetails.noOfSeat}</div>
								<div class="col-md-6">Contact email ID
									:${bookingDetails.user.email}</div>

							</div>
						</div>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="text-center mt-2">
		<a href="/home">
			<button type="submit" class="btn btn-primary">Done</button>
		</a>
	</div>
</body>
</html>







