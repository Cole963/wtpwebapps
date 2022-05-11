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
          				<a class="dropdown-item" id="logout_btn" a href="<%=request.getContextPath()%>/index" onclick= "return logout();" class="btn btn-outline-success my-2 my-sm-0" type="submit">
          					Logout
          				</a>
        			</div>
      			</li>
    		</ul>		
					
		</nav>
		
	</header>
	<br>
	<div class="row">
		<div class="container">
			<h3 class="text-center">List of User Profiles</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/newUserProfileForm" class="btn btn-outline-success my-2 my-sm-0" type="submit" style="float: right;"> + </a>
				<br></br>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Profile</th>
						<th>Description</th>
						<th>Action</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="userProfile" items="${userProfileList}">

						<tr>
							<td><c:out value="${userProfile.id}" /></td>
							<td><c:out value="${userProfile.profile}" /></td>
							<td><c:out value="${userProfile.description}" /></td>
							<td><a href="editUserProfileForm?id=<c:out value='${userProfile.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; 
								<a href="deleteUserProfile?id=<c:out value='${userProfile.id}' /> " onclick= "return confirmDelete();">Delete</a></td>
								
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<script>
	function confirmDelete() 
	{
	    return confirm("Are you sure you want to delete this user profile?");
	}
	
	function logout() 
	{
	    return confirm("Are you sure you want to logout?");
	}
	</script>
</body>
</html>
