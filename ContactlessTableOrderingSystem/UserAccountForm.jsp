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
		
			var name = document.getElementById("name").value;
		
			if(name.length > 70){
				alert("Please enter a name that is not more than 70 characters");
				return false;
			}
			
			var username = document.getElementById("username").value;
	
			if(username.length > 45){
				alert("Please enter a username that is not more than 45 characters");
				return false;
			}
			
			var password = document.getElementById("password").value;
			
			
			if(password.length > 45){
				alert("Please enter a password that is not more than 45 characters");
				return false;
			}
				
			var email = document.getElementById("email").value;
			var at="@";
			var dot=".";
			var lat=email.indexOf(at);
			var lstr=email.length;
			var ldot=email.indexOf(dot);
			
			if(email == "" || email == null){
				alert("Email cannot be empty !");
				return false;
			}
			
			if(email.length > 70){
				alert("Please enter an email that is not more than 70 characters");
				return false;
			}
		
			if (email.indexOf(at)==-1 || email.indexOf(at)==0 ||email.indexOf(at)==lstr){
			   alert("Invalid Email !");
			   return false;
			}
		
		if (email.indexOf(dot)==-1 || email.indexOf(dot)==0 ||email.indexOf(dot)==lstr){
		    alert("Invalid Email !");
		    return false;
		}
		
		if (email.indexOf(at,(lat+1))!=-1){
		    alert("Invalid Email !");
		    return false;
		 }
	    
		 if (email.substring(lat-1,lat)==dot || str.substring(lat+1,lat+2)==dot){
		    alert("Invalid Email !");
		    return false;
		 }
		
		 if (email.indexOf(dot,(lat+2))==-1){
		    alert("Invalid Email !");
		    return false;
		 }
		
		 if (str.indexOf(" ")!=-1){
		    alert("Invalid Email !");
		    return false;
		 }
			
		 return true;
	}
	
	function logout() 
	{
	    return confirm("Are you sure you want to logout?");
	}
</script>

</head>
<body>
	<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color: green">
			<div>
				<a href="" class="navbar-brand"> Scream Scrum Restaurant </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/viewUserAccount"
					class="nav-link">User Accounts</a></li>
				<li><a href="<%=request.getContextPath()%>/viewUserProfile"
					class="nav-link">User Profiles</a></li>
			</ul>
			
			<ul class="navbar-nav ml-auto">
      
      			<li class="nav-item dropdown">
        			<a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          				<%= request.getSession().getAttribute("username") %>
        			</a>
        			<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
          				<a class="dropdown-item" id="logout_btn" a href="<%=request.getContextPath()%>/index" onclick= "return logout();" class="btn btn-outline-success my-2 my-sm-0" type="submit">Logout</a>
        			</div>
      			</li>
    		</ul>	
			
		</nav>
	</header>
	<br>
	<div class="container col-md-5">
		<div class="card">
			<div class="card-body">
				<c:if test="${userAccount != null}">
					<form action="editUserAccount" method="post">
				</c:if>
				<c:if test="${userAccount == null}">
					<form action="addUserAccount" method="post">
				</c:if>

				<caption>
					<h2>
					<c:if test="${userAccount != null}">
            			Edit User Account
            		</c:if>
						<c:if test="${userAccount == null}">
            			Add New User Account
            		</c:if>
					</h2>
				</caption>

				<c:if test="${userAccount != null}">
					<input type="hidden" name="id" value="<c:out value='${userAccount.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Name</label> <input type="text"
						value="<c:out value='${userAccount.name}' />" class="form-control"
						name="name" required="required" id ="name">
				</fieldset>

				<fieldset class="form-group">
					<label>Username</label> <input type="text"
						value="<c:out value='${userAccount.username}' />" class="form-control"
						name="username" required="required" id = "username">
				</fieldset>

				<fieldset class="form-group">
					<label>Password</label> <input type="password"
						value="<c:out value='${userAccount.password}' />" class="form-control"
						name="password" required="required" id="password">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Email</label> <input type="text"
						value="<c:out value='${userAccount.email}' />" class="form-control"
						name="email" required="required" id="email">
				</fieldset>
				
				<fieldset class="form-group">
					<label>User Profile</label> <input type="text"
						value="<c:out value='${userAccount.userprofile}' />" class="form-control"
						name="userprofile" required="required" id = "userprofile">
				</fieldset>

				<caption>
					<h2>
					<c:if test="${userAccount != null}">
            			<button type="submit" class="btn btn-outline-success my-2 my-sm-0" onclick= "return validate();" type="submit" style="float: right;">Edit</button>
            		</c:if>
						<c:if test="${userAccount == null}">
            			<button type="submit" class="btn btn-outline-success my-2 my-sm-0" onclick= "return validate();" type="submit" style="float: right;">Add</button>
            		</c:if>
					</h2>
				</caption>
				
				
				</form>
			</div>
		</div>
	</div>
</body>
</html>
