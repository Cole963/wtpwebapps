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
		
			var profile = document.getElementById("profile").value;
		
			if(profile.length > 45){
				alert("Please enter a profile that is not more than 45 characters");
				return false;
			}
			
			var description = document.getElementById("description").value;
	
			if(description.length > 70){
				alert("Please enter a description that is not more than than 70 characters");
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
				<c:if test="${userProfile != null}">
					<form action="editUserProfile" method="post">
				</c:if>
				<c:if test="${userProfile == null}">
					<form action="addUserProfile" method="post">
				</c:if>

				<caption>
					<h2>
					<c:if test="${userProfile != null}">
            			Edit User Profile
            		</c:if>
						<c:if test="${userProfile == null}">
            			Add New User Profile
            		</c:if>
					</h2>
				</caption>

				<c:if test="${userProfile != null}">
					<input type="hidden" name="id" value="<c:out value='${userProfile.id}' />" />
				</c:if>

				<fieldset class="form-group">
					<label>Profile</label> <input type="text"
						value="<c:out value='${userProfile.profile}' />" class="form-control"
						name="profile" required="required" id ="profile">
				</fieldset>

				<fieldset class="form-group">
					<label>Description</label> <input type="text"
						value="<c:out value='${userProfile.description}' />" class="form-control"
						name="description" id = "description">
				</fieldset>

				<caption>
					<h2>
					<c:if test="${userProfile != null}">
            			<button type="submit" class="btn btn-outline-success my-2 my-sm-0" onclick= "return validate();" type="submit" style="float: right;">Edit</button>
            		</c:if>
						<c:if test="${userProfile == null}">
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
