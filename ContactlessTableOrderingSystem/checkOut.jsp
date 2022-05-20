<%@include file = "include/importHomeAndCart.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check out</title>
<%@include file= "include/header.jsp" %>
</head>
<body>
<%@include file = "include/navbarCheckOut.jsp" %>

<div class ="container">

	<h3 class = "centeredText">Thank you for your Orders</h3>

	<table class= "table table-loght">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Quantity</th>
				<th scope="col">Total Price</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(cart_list != null)
			{
				for(cart c :cartList)
				{%>
					<tr>
					<td><%= c.getName() %></td>
					<td><%= c.getQuantity() %> </td>
					<td><%= dcf.format(c.getPrice()) %>$</td>	
				</tr>
				<%}
			}
		
		// this code will clear the arraylist (item inside the cart))
		cart_list.clear();
		%>
			
		</tbody>
	</table>
	
	<table class= "table table-loght">
		<thead>
			<tr>
				<th scope="col"></th>
				<th scope="col" class = "centeredText">Sub Total</th>
				<th scope="col" class = "centeredText">$ ${ (total>0) ? dcf.format(total) : 0}</th>
			</tr>
		</thead>
	</table>
	
</div>

</body>
</html>