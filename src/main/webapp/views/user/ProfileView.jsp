<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        
        .profile-section {
            max-width: 600px; 
            margin: auto;
            padding: 15px;
            background-color: #f8f9fa; /* Light gray background */
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
        }

        .profile-section .card {
            border: none; /* Remove default card border */
            background-color: #ffffff; /* White background */
            border-radius: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-section .card-body {
            padding: 30px;
        }

        .profile-section .card-title {
            font-size: 30px;
            margin-bottom: 20px;
            text-align: center;
            color: black;
        }

        .profile-section p {
            font-size: 18px;
            margin-bottom: 15px;
            color: black;
        }
    </style>
</head>

<body>
    <div class="container" style="height: 90vh;">
        <div class="profile-section ">
            <div class="card">
                <div class="card-body d-flex align-items-center">
                    <div>
                        <h5 class="card-title">Profile</h5>
                        <p><strong>First Name:</strong> ${loggedInUser.firstName} </p>  
                         <p><strong>Last Name:</strong> ${loggedInUser.lastName}</p>
                       
                        <p><strong>Email:</strong> ${loggedInUser.email}</p>
                        <p><strong>Age:</strong> ${loggedInUser.age}</p>
                        <p><strong>Gender:</strong> ${loggedInUser.gender}</p>
                        <p><strong>Country:</strong> ${loggedInUser.country}</p>
                    </div>
                    <div class="ms-auto">
                        <img src="/image/user_photo.jpg" class="img-fluid rounded-circle mb-3" alt="User Photo">
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="text-center">
		<a href="/user/dashboard" class="btn btn-secondary">Back to
			Dashboard</a>
	</div>

</body>
</html>
