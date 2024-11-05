<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Lists in Home Page</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<br>
	<h1 class="text-center bg-primary text-light">Available Flights</h1>
	<table border="1" class="table table-light table-striped mt-4">
		<thead>
			<tr>
				<th>Flight Number</th>
				<th>Date</th>
				<th>Source</th>
				<th>Destination</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>
				<th>Seat Fare</th>
				<th>Seats Available</th>
				<th>Book Tickets</th>

			</tr>
		</thead>
		<tbody>

			<c:forEach items="${flightssearchhome}" var="fl">

				<td>${fl.flightNumber}</td>
				<td>${fl.departureDate}</td>
				<td>${fl.source}</td>
				<td>${fl.destination}</td>
				<td>${fl.departureTime}</td>
				<td>${fl.arrivalTime}</td>
				<td>${fl.price}</td>
				<td>${fl.availableSeats}</td>
				<td><a class="btn btn-primary" href="/user/login"
					role="button">BookTicket</a></td>

			</c:forEach>
		</tbody>
	</table>
	<br>
	<div class="text-center">
	<a class="btn btn-secondary" href="/home" role="button">Back to HomePage</a>
	<a class="btn btn-primary" href="/user/login" role="button">Login here to Book a Ticket</a>
    </div>
</body>
</html>