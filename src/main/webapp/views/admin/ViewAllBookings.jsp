<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<h1 class="text-center bg-primary p-1 text-light">All Booking List</h1>
	<table border="1" class="table table-light table-striped mt-4">
		<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Flight Number</th>
				<th>Date of Journy</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>
				<th>Amount Paid</th>
				<th>BookingSatus</th>


			</tr>
		</thead>
		<tbody>
			<c:forEach items="${viewbookings}" var="booking">
				<tr>
					<td>${booking.bookingId}</td>
					<td>${booking.user.firstName} ${booking.user.lastName}</td>
					<td>${booking.flight.flightNumber}</td>
					<td>${booking.flight.departureDate}</td>
					<td>${booking.flight.source}</td>
					<td>${booking.flight.destination}</td>
					<td>${booking.flight.departureTime.toString().substring(0,10)} &nbsp  ${booking.flight.departureTime.toString().substring(11,16)}</td>
					<td>${booking.flight.arrivalTime.toString().substring(0,10)} &nbsp  ${booking.flight.arrivalTime.toString().substring(11,16)}</td>
					<td>${booking.flight.price* booking.noOfSeat}</td>
					<td>${booking.bookingStatus}</td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<div class="text-center"><a href="/admin/dashboard" class="btn btn-secondary">Back to Dashboard</a></div>
	
</body>
</html>
