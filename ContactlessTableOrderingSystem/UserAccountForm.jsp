<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<title>Contactless Table Ordering System</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
</head>
<body>

	<header>
		<nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
			<div>
				<a href="" class="navbar-brand"> Scream Scrum Restaurant </a>
			</div>

			<ul class="navbar-nav">
				<li><a href="<%=request.getContextPath()%>/viewUserAccount"
					class="nav-link">User Accounts</a></li>
				<li><a href="<%=request.getContextPath()%>/viewUserProfile"
					class="nav-link">User Profiles</a></li>
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
						name="name" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Username</label> <input type="text"
						value="<c:out value='${userAccount.username}' />" class="form-control"
						name="username" required="required">
				</fieldset>

				<fieldset class="form-group">
					<label>Password</label> <input type="password"
						value="<c:out value='${userAccount.password}' />" class="form-control"
						name="password" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>Email</label> <input type="text"
						value="<c:out value='${userAccount.email}' />" class="form-control"
						name="email" required="required">
				</fieldset>
				
				<fieldset class="form-group">
					<label>User Profile</label> <input type="text"
						value="<c:out value='${userAccount.userprofile}' />" class="form-control"
						name="userprofile" required="required">
				</fieldset>

				<button type="submit" class="btn btn-success">Save</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
