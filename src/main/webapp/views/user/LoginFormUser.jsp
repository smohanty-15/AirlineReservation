<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>user login form</title>
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
					<h2 class="text-center mb-4">Login</h2>

					<c:if test="${not empty errorMessage }">
						<div class="text-center">
							<h6 class="text-danger text-center">${errorMessage}</h6>
						</div>
						<c:remove var="errorMessage" />
					</c:if>
					<c:if test="${not empty successMessage}">
						<h6 class="text-success text-center">${successMessage}</h6>
						<c:remove var="successMessage" />
					</c:if>
					<form action="/user/loginuser" method="post">
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

						<div class="text-center mb-3">
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</form>

					<div class="text-center">
						New user? <a href="register"> Register Here</a>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>