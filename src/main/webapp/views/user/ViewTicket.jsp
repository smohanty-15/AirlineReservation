<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Booking</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
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
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8">
                <div class="booking-box">
                    <h2 class="text-center mb-4">Ticket Details</h2>
                        <div class="row">
                        <div class="col-md-9 text-primary"> <p><strong>PNR :</strong> ${booking.pnr}</p></div>
                        <div class="col-md-3  text-success"> <p><strong>Status:</strong> ${booking.bookingStatus}</p></div>
                        </div>
                        
                        <div class="row">
                        <div class="col-md-6">                         
                            <p><strong>Flight Number:</strong> ${booking.flight.flightNumber}</p>
                            <p><strong>Source:</strong> ${booking.flight.source}</p>
                            <p><strong>Departure Time:</strong> ${booking.flight.departureTime.toString().substring(0,10)} &nbsp  ${booking.flight.departureTime.toString().substring(11,16)}</p>
                            <p><strong>First Name:</strong> ${booking.user.firstName} ${booking.user.lastName}</p>
                        </div>	
                        <div class="col-md-6">                       
                            <p><strong>Departure Date:</strong> ${booking.flight.departureDate}</p>
                            <p><strong>Destination:</strong> ${booking.flight.destination}</p>
                            <p><strong>Arrival Time:</strong> ${booking.flight.arrivalTime.toString().substring(0,10)} &nbsp  ${booking.flight.arrivalTime.toString().substring(11,16)}</p>
                        	<p><strong>Conctact :</strong> ${booking.user.email}</p>                     
                        </div>
                     </div>
                  <div class="row">
                      <div class="col-md-3"><p><strong>Age  : </strong>${booking.user.age}</p></div> 
                      <div class="col-md-3"><p><strong>Gender:</strong> ${booking.user.gender}</p></div> 
                      <div class="col-md-6"><p><strong>Country:</strong> ${booking.user.country}</p></div> 
                  </div>
                     <br>
                     <br>
                     <div class="text-center " class="col-md-8">
                             <p><strong>Total Seats:</strong> ${booking.noOfSeat}</p>        
                             <p><strong>Total Price:</strong> ${booking.flight.price * booking.noOfSeat}</p>
                           	
                    </div>




	<!-- if else condition accoding to the no of passanger -->
	          <c:if test="${booking.noOfSeat eq 1}">
	                 <div><table class="table">
							<thead><tr><th scope="col">Sl No</th><th scope="col">Name</th><th scope="col">Seat No</th></tr>
							</thead>
							<tbody><tr><th scope="row">1</th><td>${booking.user.firstName}         ${booking.user.lastName}</td><td>${booking.fromSeatNo}</td></tr>
                               	</tbody></table></div>
	         </c:if>
	         <c:if test="${booking.noOfSeat eq 2}">
	                 <div><table class="table">
							<thead><tr><th scope="col">Sl No</th><th scope="col">Name</th><th scope="col">Seat No</th></tr>
							</thead>
							<tbody><tr><th scope="row">1</th><td>${booking.user.firstName}         ${booking.user.lastName}</td><td>${booking.fromSeatNo}</td></tr>
                                   <tr><th scope="row">2</th><td>${booking.passanger2}</td><td>${1+booking.fromSeatNo}</td></tr>
							</tbody></table></div>
	         </c:if>
	         <c:if test="${booking.noOfSeat eq 3}">
	                 <div><table class="table">
							<thead><tr><th scope="col">Sl No</th><th scope="col">Name</th><th scope="col">Seat No</th></tr>
							</thead>
							<tbody><tr><th scope="row">1</th><td>${booking.user.firstName}         ${booking.user.lastName}</td><td>${booking.fromSeatNo}</td></tr>
                                   <tr><th scope="row">2</th><td>${booking.passanger2}</td><td>${1+booking.fromSeatNo}</td></tr>
								   <tr><th scope="row">3</th><td>${booking.passanger3}</td><td>${2+booking.fromSeatNo}</td></tr>
							</tbody></table></div>
	         </c:if>
	         <c:if test="${booking.noOfSeat eq 4}">
	                 <div><table class="table">
							<thead><tr><th scope="col">Sl No</th><th scope="col">Name</th><th scope="col">Seat No</th></tr>
							</thead>
							<tbody><tr><th scope="row">1</th><td>${booking.user.firstName}         ${booking.user.lastName}</td><td>${booking.fromSeatNo}</td></tr>
                                   <tr><th scope="row">2</th><td>${booking.passanger2}</td><td>${1+booking.fromSeatNo}</td></tr>
								   <tr><th scope="row">3</th><td>${booking.passanger3}</td><td>${2+booking.fromSeatNo}</td></tr>
								  <tr><th scope="row">4</th><td>${booking.passanger4}</td><td>${3+booking.fromSeatNo}</td></tr>
							</tbody></table></div>
	         </c:if>
	



					<div class="text-center ">
                        <a href="/user/viewbookings/${loggedInUserId}"> <button type="submit" class="btn btn-primary">Back</button></a>
                    </div>             
            </div>
        </div>
    </div>
 </div>

</body>
</html>
