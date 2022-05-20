<%@include file = "include/importHomeAndCart.jsp" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%
mainPageController mpd = new mainPageController(DbConnection.init());

String name = request.getParameter("name");

List <mainPage> menuList = mpd.getAllMenu();

//out.println(name);
if (name != null)
{
	menuList = mpd.searchMenu(request.getParameter("name"));
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Scream Scrum Restaurant</title>
<%@include file= "include/header.jsp" %>

</head>
<body>

	<c:if test="${sessionScope.userActionMessage != null }">
		<script>
			alert("<c:out value = "${userActionMessage}" />");
		</script>
		<c:remove var="userActionMessage"/>
	</c:if>



<%@include file = "include/navbar.jsp" %>

<div class = "container" align = "center">
			<input type="text" name="name" class="searchMenu" id="searchMenu" placeholder = "Which food do you want to eat?">
</div>

<!-- OLD search 
<div class ="container" align ="center">
		<form class="ml-auto" action = "homePage.jsp" method = "get" class ="form-inline">
			<input type="text" name="name" class="searchMenu" id="searchMenu" placeholder = "What food do you want to find">
			<button type = "submit" class="btn btn-success" id = "checkoutButton">Search Now</button>
		</form>
</div>
-->

<div class = "container">
	<div class = "row text-center py-5">
	
		<!-- dividing the menu -------- -->
		<%
			if ( !menuList.isEmpty())
			{
				for (mainPage mp:menuList)
				{
					%>
						<div class ="col-md-3 col-sm-6 my-3 my-md-3">
							<form action = "homePage.jsp" method= "post">
								<div class = "card shadow">
									<div>
										<img src= "<%= mp.getPicture() %>" alt = "imghere" class="img-fluid card-img-top">
									</div>
									<div class ="card-body">
										<h5 class="card-title"><%= mp.getName() %></h5>
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


<script>
// This script is used to retrieve the input from the <input> and pass it as parameter on url
//setup before functions
var typingTimer;                //timer identifier
var doneTypingInterval = 750 ;  //time in ms, 3-4 second 
var mainUrl = "homePage.jsp?name="

//on keyup, start the countdown
$('#searchMenu').keyup(function()
{
    clearTimeout(typingTimer);
    if ($('#searchMenu').val) 
    {
        typingTimer = setTimeout(function()
        {
            //do stuff here 
             var param = $('#searchMenu').val();
             document.location.href = mainUrl + param;
        }, doneTypingInterval);
    }
});

</script>
</body>


</html>