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
				<div class="card p-4 shadow">
					<h2 class="text-center mb-4">PNR</h2>

					
					<form action="/home/pnrcheck" method="post">
						<div class="mb-3">
							<label for="pnr" class="form-label">pnr</label> <input
								type="number" class="form-control" id="pnr" name="pnr"
								required>
						</div>

						

						<div class="text-center mb-3">
							<button type="submit" class="btn btn-primary">Login</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>

</body>
</html>