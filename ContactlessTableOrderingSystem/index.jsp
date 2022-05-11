<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Contactless Table Ordering System</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">


<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet" />
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>

<script>
	function validate() {
		
			
			var username = document.getElementById("username").value;
	
			if(username.length > 45){
				alert("Please enter a username that is less than 45 characters");
				return false;
			}
			
			var password = document.getElementById("password").value;
			
			
			if(password.length > 45){
				alert("Please enter a password that is less than 45 characters");
				return false;
			}
			
			var format = /[ `!@#$%^&*()_+\-=\[\]{};':"\\|,.<>\/?~]/;
			if (format.test(password)){
				alert("Please enter a password with no special characters");
				return false;
			}
			
		 return true;
	}
	
</script>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">
			<div>
				<a href="<%=request.getContextPath()%>/index" class="navbar-brand"> Scream Scrum Restaurant </a>
			</div>

			
		</nav>
	</header>
	<br>
	<div class="container col-md-3"  style="float: right">
		<div class="card">
			<div class="card-body" >
				<form action="login" method="post">

				<caption>
					<h2>
            			Login
					</h2>
				</caption>

				<table style="width: 100%">
					<tr>
						<td>Username</td>
						<td><input type="text" name="username" /></td>
					</tr>
					<tr>
						<td>Password</td>
						<td><input type="password" name="password"/></td>
						<span style="color: red"> ${message} </span>
					</tr>
				</table>

				<br></br>
            	<button type="submit" class="btn btn-outline-success my-2 my-sm-0" onclick= "return validate();" type="submit" style="float: right;">Login</button>
				
				</form>

			</div>
		</div>
	</div>
	
</body>
</html>
