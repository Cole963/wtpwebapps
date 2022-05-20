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

<link rel="stylesheet" href="//code.jquery.com/ui/1.13.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.1/jquery-ui.js"></script>


	
	<script>
	
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
          				<a class="dropdown-item" id="logout_btn" href="<%=request.getContextPath()%>/index" onclick= "return logout();" class="btn btn-outline-success my-2 my-sm-0" type="submit">
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
			<h3 class="text-center">Customer Drinks and Dishes Report</h3>
			<hr>
			<br>
			<a class="btn btn-outline-success my-2 my-sm-0" id="monthly" display="inline" style="float: right"> Monthly </a>
			<a class="btn btn-outline-success my-2 my-sm-0" id="weekly" display="inline" style="float: right"> Weekly </a>
			<a class="btn btn-outline-success my-2 my-sm-0" href="<%=request.getContextPath()%>/viewOwnerDrinksAndDishesDailyReport" display="inline" style="float: right"> Daily </a>
		
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>ID</th>
						<th>Menu Item</th>
						<th>Quantity</th>
						<th>Date</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="ownerReport" items="${ownerReportList}">

						<tr id="ownerReport">
							<td><c:out value="${ownerReport.id}" /></td>
							<td><c:out value="${ownerReport.name}" /></td>
							<td><c:out value="${ownerReport.quantity}" /></td>
							<td><c:out value="${ownerReport.date}" /></td>	
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
</body>
</html>
