<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>new user Registration form</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-md-4 mt-5">
				<div class="card p-4">
					<h2 class="text-center mb-4">User Registration</h2>

					<c:if test="${not empty duplicateMessage}">
						<h6 class="text-danger text-center">${duplicateMessage}</h6>
						<c:remove var="duplicateMessage" />
					</c:if>

					<form action="/user/registeruser" method="post">

						<div class="mb-3">
							<label for="firstName" class="form-label">First Name</label> <input
								type="text" class="form-control" id="firstName" name="firstName"
								required>
						</div>

						<div class="mb-3">
							<label for="lastName" class="form-label">Last Name</label> <input
								type="text" class="form-control" id="lastName" name="lastName"
								required>
						</div>

						<div class="mb-3">
							<label for="email" class="form-label">Email</label> <input
								type="email" class="form-control" id="email" name="email"
								required>
						</div>


						<div class="mb-3">
							<label for="password" class="form-label">password</label> <input
								type="password" class="form-control" id="password"
								name="password" required>
						</div>

						<div class="mb-3">
							<label for="age" class="form-label">Age</label> <input
								type="number" class="form-control" id="age" name="age" required>
						</div>


						<div class="mb-3">
							<label for="gender" class="form-label">Gender</label> <select
								class="form-select" id="gender" name="gender" required>
								<option value="">Select Gender</option>
								<option value="male">Male</option>
								<option value="female">Female</option>
								<option value="other">Other</option>
							</select>
						</div>

						<div class="mb-3">
							<label for="country" class="form-label">Country</label> <select
								class="form-select" id="country" name="country" required>
								<option value="">Select Country</option>
								<option value="India">India</option>
								<option value="Pakistan">Pakistan</option>
								<option value="Nepal">Nepal</option>
								<option value="Bangladesh">Bangladesh</option>
								<option value="SriLanka">SriLanka</option>
							</select>
						</div>

						<div class="d-grid mb-3">
							<button type="submit" class="btn btn-primary">Register</button>
						</div>
					</form>
					<div class="text-center">
						Existing user? <a href="login"> Login Here</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>