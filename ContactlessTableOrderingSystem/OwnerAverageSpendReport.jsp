<%@include file = "include/importHomeAndCart.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
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
				<li><a href="<%=request.getContextPath()%>/viewOwnerDrinksAndDishesReport"
					class="nav-link">Drinks and Dishes Report</a></li>
				<li><a href="<%=request.getContextPath()%>/viewOwnerFrequencyReport"
					class="nav-link">Customer Frequency Report</a></li>
					<li><a href="<%=request.getContextPath()%>/viewOwnerAverageSpendReport"
					class="nav-link">Customer Average Spending Report</a></li>
			</ul>	
					
		    <ul class="navbar-nav ml-auto">
      
      			<li class="nav-item dropdown">
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
			<h3 class="text-center">Customer Average Spending Report</h3>
			<hr>
			<br>
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Date</th>
						<th>Average Spending</th>
						<th>Number of Visitors</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ownerReport" items="${ownerReportList}">

						<tr>
							<td><c:out value="${ownerReport.id}" /></td>
							<td><c:out value="${ownerReport.date}" /></td>
							<td><c:out value="${ownerReport.avgSpend}" /></td>
							<td><c:out value="${ownerReport.noOfDistMobileNum}" /></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	
	<script>
	
	function logout() 
	{
	    return confirm("Are you sure you want to logout?");
	}
	</script>
</body>
</html>

