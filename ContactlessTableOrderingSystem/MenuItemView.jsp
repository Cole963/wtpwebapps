<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
            <link rel="stylesheet" href="CSS/style.css">
            <script src="JS/script.js"></script>

            <c:if test="${sessionScope.userActionMessage != null}">
                <script>
                    alert("<c:out value='${userActionMessage}' />");
                </script>
                <c:remove var="userActionMessage" />
            </c:if>
           	<%	
           		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
           		response.setHeader("Pragma", "no-cache");
           		
				if(session.getAttribute("username")==null)
				{
					response.sendRedirect("LoginForm.jsp");
				}
				else if(!(session.getAttribute("profile").equals("Restaurant Manager")))
				{	
					response.sendRedirect("index.jsp");
				}
			%>
        </head>
        <body>
            <header>
                <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                    <div>
                        <a href="" class="navbar-brand"> Scream Scrum Restaurant </a>
                    </div>

                    <ul class="navbar-nav">
                        <li>
                        	<a href="<%=request.getContextPath()%>/index.jsp" class="nav-link">Home</a>
                        </li>
                        <li>
                        	<a href="<%=request.getContextPath()%>/viewMenuItem" class="nav-link">Menu Items</a>
                        </li>
                    </ul>
                    
                    <ul class="navbar-nav ml-auto">
                    	<li>
                    		<a href="" class="nav-link disabled">${profile}</a>
                    	</li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                               ${username}
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                                <a class="dropdown-item" id="logout_btn" href="<%=request.getContextPath()%>/logout" onclick="return logout();" class="btn btn-outline-success my-2 my-sm-0" type="submit">
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
                    <h3 class="text-center">List of Menu Items</h3>
                    <hr>
                    <br>
                    <div class="container">
                    <div class="row">
	                    <div class="col-md-6">
							 <form action="searchMenuItem" method="post" onsubmit="return trimSearchInput();">
							 	<input id="searchInput" type="text" class="form-control" name="searchInput" placeholder="Search Menu Item by name..."/>
							</form>
						</div>
						<div class="col-md-6">
	                        <a href="<%=request.getContextPath()%>/newMenuItemForm" class="btn btn-outline-success my-2 my-sm-0" type="submit" style="float: right;"> + </a>
	                        <br></br>
	                    </div>
	                </div>
	                </div>
                    <br>
                    <table class="table table-bordered table-hover">
                        <thead>
                            <tr>
								<th>ID</th>
								<th>Name</th>
								<th>Price</th>
								<th>Picture</th>
								<th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
							<c:forEach var="item" items="${menuItemList}">
		
								<tr>
									<td><c:out value="${item.id}" /></td>
									<td><c:out value="${item.name}" /></td>
									<td><c:out value="${item.price}" /></td>
									<td>
										<img height = "100px" width = "200px" src = "<c:out value = "${item.picture}"/>" alt = "no image"/>
									</td>
									<!-- -->
									<td><a href="editMenuItemForm?id=<c:out value='${item.id}' />">Edit</a>
										&nbsp;&nbsp;&nbsp;&nbsp; <a
										href="deleteMenuItem?id=<c:out value='${item.id}' />">Delete</a></td>
		                        </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </body>

        </html>