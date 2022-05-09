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
	<div class="row">
		<div class="container">
			<h3 class="text-center">List of User Accounts</h3>
			<hr>
			<div class="container text-left">

				<a href="<%=request.getContextPath()%>/newUserAccountForm" class="btn btn-success">Add
					New User Account</a>
			</div>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Username</th>
						<th>Email</th>
						<th>User Profile</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="user" items="${userAccountList}">

						<tr>
							<td><c:out value="${user.id}" /></td>
							<td><c:out value="${user.name}" /></td>
							<td><c:out value="${user.username}" /></td>
							<td><c:out value="${user.email}" /></td>
							<td><c:out value="${user.userprofile}" /></td>
							<td><a href="editUserAccountForm?id=<c:out value='${user.id}' />">Edit</a>
								&nbsp;&nbsp;&nbsp;&nbsp; <a
								href="deleteUserAccount?id=<c:out value='${user.id}' />">Delete</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<br><br><br>
	<button>TEST</button>
	<br><br><br>
	<button>TEST</button>
	<br><br><br>
	<button>TEST</button>
	<h1>HELLO WORLD</h1>
	<br>
	<h1>TESTING agane</h1>
	<br>
	<h1>testing the restart AGAIN</h1>
	<br>
	<h1>TESTING PULL WITHOUT RESTART</h1>
</body>
</html>
