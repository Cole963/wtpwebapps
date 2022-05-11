<%@include file = "include/importHomeAndCart.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
mainPageController mpd = new mainPageController(DbConnection.init());
List <mainPage> menuList = mpd.getAllMenu();
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scream Scrum Restaurant</title>
<%@include file= "include/header.jsp" %>

</head>
<body>

<%@include file = "include/navbar.jsp" %>

<div class = "container">
	<div class = "row text-center py-5">
	
	<% // out.print(DbConnection.init()); %>
	
	
		<!-- dividing the menu -------- -->
		<%
			if ( !menuList.isEmpty())
			{
				for (mainPage mp:menuList)
				{
					%>
						<div class ="col-md-3 col-sm-6 my-3 my-md-3">
							<form action = "mainpageDummy.jsp" method= "post">
								<div class = "card shadow">
									<div>
										<img src= "<%= mp.getImgURL() %>" alt = "imghere" class="img-fluid card-img-top">
									</div>
									<div class ="card-body">
										<h5 class="card-title"><%= mp.getMenuName() %></h5>
			<!-- 							
										<p class= "card-text">
											Delicious fried rice
										</p>
			-->
										<h5>
											<span class="price"><%= mp.getPrice() %>$ </span>
										</h5>
										<a href="add-to-cart?id=<%= mp.getId() %>" class="btn btn-warning my-3">Add to Cart <i class="fas fa-shopping-cart"></i></a>
									</div>
								</div>			
							</form>		
						</div>
					<%
				}
			}
		%>
		<!-- End of the dividing - -->
		
	</div>

</div>
</body>
</html>