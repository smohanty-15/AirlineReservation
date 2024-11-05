<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flight Lists after search</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<h1 class="text-center bg-primary p-1 text-light">List of Availabe
		Flights After Searching</h1>
	<table border="1" class="table table-success table-striped mt-4">
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
			<c:forEach items="${searchflights}" var="fl">
				<tr>
					<td>${fl.flightNumber}</td>
					<td>${fl.departureDate}</td>
					<td>${fl.source}</td>
					<td>${fl.destination}</td>
					<td>${fl.departureTime.toString().substring(0,10)}&nbsp
						${fl.departureTime.toString().substring(12,16)}</td>
					<td>${fl.arrivalTime.toString().substring(0,10)}&nbsp
						${fl.arrivalTime.toString().substring(12,16)}</td>
					<td>${fl.price}</td>
					<td>${fl.availableSeats}</td>
					<td><c:if test="${fl.availableSeats <= 0 }">
							<a class="disabled">
								<button type="button" class="btn btn-secondary ">BookTicket</button>
							</a>
						</c:if> <c:if test="${fl.availableSeats > 0  }">
							<a
								href="/user/bookticket-seat?flightId=${fl.id}&userId=${loggedInUserId}">
								<button type="button" class="btn btn-primary">BookTicket</button>
							</a>
						</c:if></td>

				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div class="text-center">
		<a href="/user/dashboard" class="btn btn-secondary">Back to
			Dashboard</a>
	</div>
</body>
</html>
