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
	                   	<c:if test="${sessionScope.profile == 'User Admin'}">
	                        <li>
	                        	<a href="<%=request.getContextPath()%>/viewUserAccount" class="nav-link">User Accounts</a>
	                        </li>
	                        <li>
	                        	<a href="<%=request.getContextPath()%>/viewUserProfile" class="nav-link">User Profiles</a>
	                        </li>
	            		</c:if>
	            		<c:if test="${sessionScope.profile == 'Restaurant Manager'}">
	                        <li>
	                        	<a href="<%=request.getContextPath()%>/viewMenuItem" class="nav-link">Menu Items</a>
	                        </li>
	            		</c:if>
                    </ul>
                    
                    <c:if test="${sessionScope.username != null}">
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
                    </c:if>
                    <c:if test="${sessionScope.username == null}">
                    <ul class="navbar-nav ml-auto">
                    	<li>
                    		<a class="nav-link" href="<%=request.getContextPath()%>/LoginForm.jsp">Staff Login</a>
                    	</li>
                    </ul>
                    </c:if>
                </nav>
            </header>
            <br>
            <div class="row">
                <div class="container">
                    <h3 class="text-center">Home Page for all users</h3>
                    <hr>
                </div>
            </div>
        </body>

        </html>