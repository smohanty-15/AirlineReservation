
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Flight List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body>
	<h1 class="text-center bg-primary p-1 text-light">Flight List</h1>
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
				<th>Status</th>
				<th>Action</th>			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="flight" items="${flights}">
				<tr id="flightRow${flight.id}">
					<td>${flight.flightNumber}</td>
					<td>${flight.departureDate}</td>
					<td>${flight.source}</td>
					<td>${flight.destination}</td>
					<td>${flight.departureTime.toString().substring(0,10)} &nbsp  ${flight.departureTime.toString().substring(11,16)}</td>
					<td>${flight.arrivalTime.toString().substring(0,10)} &nbsp  ${flight.arrivalTime.toString().substring(11,16)}</td>
					<td>${flight.price}</td>
					<td>${flight.availableSeats}</td>
					<td>${flight.flightStatus}</td> 
					<td><a href="/admin/flight/edit/${flight.id}"><button type="button" class="btn btn-primary">Edit</button> </a></td>		
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>	
	<div class="text-center"><a href="/admin/dashboard" class="btn btn-secondary">Back to Dashboard</a></div>
</body>
</html>