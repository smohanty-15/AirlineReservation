<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="UTF-8">
<title>Booking List</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<style>
h3{
	color: red;
	
}
</style>
</head>
<body>
	<h1 class="text-center bg-primary p-1 text-light">Booking History List</h1>
	
	     <!--   warning message -->
	<c:if test="${not empty failedMsg }">
		<div class="text-center mt-4 mb-4">
		     <h3><---------${failedMsg}--------></h3>
		</div>
		<c:remove var="failedMsg"/>
	</c:if>
	
	<table border="1" class="table table-light table-striped mt-4">
		<thead>
			<tr>
				<th>Name</th>
				<th>Flight Number</th>
				<th>Date of Journy</th>
				<th>Bording Point</th>
				<th>Departure Time</th>
				<th>Arrival Time</th>
				<th>seat nos</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${viewbookings}" var="booking">
				<tr>
					<td>${booking.user.firstName}${booking.user.lastName}</td>
					<td>${booking.flight.flightNumber}</td>
					<td>${booking.flight.departureDate}</td>
					<td>${booking.flight.source}</td>
					<td>${booking.flight.departureTime.toString().substring(0,10)} &nbsp  ${booking.flight.departureTime.toString().substring(11,16)}</td>
					<td>${booking.flight.arrivalTime.toString().substring(0,10)} &nbsp  ${booking.flight.arrivalTime.toString().substring(11,16)}</td>
					<td>${booking.fromSeatNo}- ${booking.toSeatNo}</td>
					<td>${booking.bookingStatus}</td>

					<td><div class="d-flex ">
					
							<c:if test="${booking.bookingStatus=='CANCELLED' }">
								<a class="disabled"><button type="button"
										class="btn btn-secondary mx-2">Cancelled</button> </a>
							</c:if>
							
							<c:if test="${booking.bookingStatus=='FLIGHTCANCELLED' }">
								<a class="disabled"><button type="button"
										class="btn btn-secondary mx-2">Cancelled</button> </a>
							</c:if>
							
							<c:if test="${booking.bookingStatus=='CONFIRMED' }">
								<a href="/user/print/ticket/${booking.bookingId}"><button
										type="button" class="btn btn-success mx-2">Print</button> </a>
							</c:if>

							<c:if test="${booking.bookingStatus=='CONFIRMED' }">
								<a href="/user/booking/cancel/${booking.bookingId}"><button
										type="button" class="btn btn-danger">Cancel</button> </a>
							</c:if>
						</div></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br>
	<div class="text-center">
	<a href="/user/dashboard" class="btn btn-secondary" >Back to Dashboard</a>
	</div>
</body>
</html>
