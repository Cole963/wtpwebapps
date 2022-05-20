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

            <c:if test="${sessionScope.error != null}">
                <script>
                    alert("<c:out value='${error}' />");
                </script>
                <c:remove var="error" />
            </c:if>
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
                    </ul>
                    <ul class="navbar-nav ml-auto">
                    	<li>
                    		<a class="nav-link" href="<%=request.getContextPath()%>/LoginForm.jsp">Staff Login</a>
                    	</li>
                    </ul>
                </nav>
            </header>
            <br>
            <div class="container col-md-4">
                <div class="card">
                    <div class="card-body">
	                    <form id="loginForm" action="login" method="post"  onsubmit="return loginValidation();">
		                    <h2>Login</h2>
		                    
		                    <fieldset class="form-group">
		                        <label>Username</label>
		                        <input type="text" class="form-control" name="username" id="username">
		                        <i class="fa fa-check-circle"></i>
		                        <i class="fa fa-exclamation-circle"></i>
		                        <small>Error</small>
		                    </fieldset>
		                    <fieldset class="form-group">
		                        <label>Password</label>
		                        <input type="password" class="form-control" name="password" id="password">
		                        <i class="fa fa-check-circle"></i>
		                        <i class="fa fa-exclamation-circle"></i>
		                        <small>Error</small>
		                    </fieldset>
		                    
							<div class="btn-toolbar pull-right">
			            		<button type="submit" class="btn btn-outline-success my-2 my-sm-0 mr-3">Login</button>
		  					 </div>
	                     </form>
                    </div>
                </div>
            </div>
        </body>
       	</html>