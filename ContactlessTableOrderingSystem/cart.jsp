<%@include file = "include/importHomeAndCart.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your shopping cart</title>

<%@include file= "include/header.jsp" %>

</head>
<body>

<%@include file = "include/navbar.jsp" %>
<div class ="container">
	<div class = "d-flex py-3">
		<h3 class = "ml-auto">Total Price: $ ${ (total>0) ? dcf.format(total) : 0} </h3>
		<a class="ml-auto btn btn-success" id ="checkoutButton" href ="cart-check-out"> Check Out </a>
	</div>
	<table class= "table table-loght">
		<thead>
			<tr>
				<th scope="col">Name</th>
				<th scope="col">Price</th>
				<th scope="col">Quantity</th>
				<th scope="col">Remove from cart</th>
			</tr>
		</thead>
		<tbody>
		<%
			if(cart_list != null)
			{
				for(cart c :cartList)
				{%>
					<tr>
					<td><%= c.getMenuName() %></td>
					<td><%= dcf.format(c.getPrice()) %>$</td>
					<td>
							<form action="" method ="post" class="form-inline" id="formQuantity">
								<input type="hidden" name= "id" value = "<%= c.getId() %>" class = "form-input">
								<div class = "form-group d-flex justify-content-between">
									<a class="btn btn-sm btn-decre" href ="quantity-inc-dec?action=dec&id=<%= c.getId() %>"><i class="fas fa-minus-square"></i></a>
									<input type ="text" name="quantity" class= "form-control" value= "<%= c.getQuantity() %>" readonly>
									<a class="btn btn-sm btn-incre" href ="quantity-inc-dec?action=inc&id=<%= c.getId() %>"><i class="fas fa-plus-square"></i></a>
								</div>
							</form>
					</td>
					<td>
						<a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%= c.getId() %>">Remove</a>
					</td>				
				</tr>
				<%}
			}
		%>
			
		</tbody>
	</table>
</div>

</body>
</html>