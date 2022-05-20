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
			<%
	       		response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
	       		response.setHeader("Pragma", "no-cache");
       		
				if(session.getAttribute("username")==null)
				{
					response.sendRedirect("LoginForm.jsp");
				}
				else if(!(session.getAttribute("profile").equals("User Admin")))
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
                        	<a href="<%=request.getContextPath()%>/viewUserAccount" class="nav-link">User Accounts</a>
                        </li>
                        <li>
                        	<a href="<%=request.getContextPath()%>/viewUserProfile" class="nav-link">User Profiles</a>
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
            <div class="container col-md-5">
                <div class="card">
                    <div class="card-body">
                        <c:if test="${userAccount != null}">
                            <form id="userAccountForm" action="editUserAccount" method="post" onsubmit="return userAccountFormValidation();">
                        </c:if>
                        <c:if test="${userAccount == null}">
                            <form id="userAccountForm" action="addUserAccount" method="post" onsubmit="return userAccountFormValidation();">
                        </c:if>
                
                    <h2>
					<c:if test="${userAccount != null}">
            			Edit User Account
            		</c:if>
						<c:if test="${userAccount == null}">
            			Add New User Account
            		</c:if>
					</h2>
                  
                        <c:if test="${userAccount != null}">
                            <input type="hidden" name="id" value="<c:out value='${userAccount.id}' />" />
                        </c:if>

                        <fieldset class="form-group">
                            <label>Name</label>
                            <input type="text" value="<c:out value='${userAccount.name}' />" class="form-control" name="fullname" id="fullname">
                            <i class="fa fa-check-circle"></i>
                            <i class="fa fa-exclamation-circle"></i>
                            <small>Error</small>
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Username</label>
                            <input type="text" value="<c:out value='${userAccount.username}' />" class="form-control" name="username" id="username">
                            <i class="fa fa-check-circle"></i>
                            <i class="fa fa-exclamation-circle"></i>
                            <small>Error</small>
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Password</label>
                            <input type="password" value="<c:out value='${userAccount.password}' />" class="form-control" name="password" id="password">
							<i class="fa fa-check-circle"></i>
                            <i class="fa fa-exclamation-circle"></i>
                            <small>Error</small>
                        </fieldset>

                        <fieldset class="form-group">
                            <label>Email</label>
                            <input type="text" value="<c:out value='${userAccount.email}' />" class="form-control" name="email" id="email">
                        	<i class="fa fa-check-circle"></i>
                            <i class="fa fa-exclamation-circle"></i>
                            <small>Error</small>
                        </fieldset>
                        
                        <c:if test="${userAccount != null}">
                        <fieldset class="form-group">
                            <label>Status</label>
                            <input type="text" value="<c:out value='${userAccount.status}' />" class="form-control" name="status" id="status" disabled>
                        </fieldset>
                        </c:if>

                        <fieldset class="form-group">
                            <label>User Profile</label>
                            <select class="form-control" name="userProfile">
                                <c:forEach var="userProfile" items="${userProfileList}">
                                    <option value="<c:out value='${userProfile.id}' />" <c:if test="${userAccount.userprofile.id == userProfile.id}">
                                        <c:out value="${'selected'}" />
                                        </c:if>>
                                        <c:out value="${userProfile.profile}" />
                                    </option>
                                </c:forEach>
                            </select>
                        </fieldset>

                    <div class="btn-toolbar pull-right">
                    <button type="reset" onclick="resetDefault()" class="btn btn-outline-danger my-2 my-sm-0 mr-3">Reset</button>
					<c:if test="${userAccount != null}">
            			<button type="submit" class="btn btn-outline-success my-2 my-sm-0 mr-3">Edit</button>
            		</c:if>
						<c:if test="${userAccount == null}">
            			<button type="submit" class="btn btn-outline-success my-2 my-sm-0 mr-3">Add</button>
            		</c:if>
            		</div>
                        </form>
                    </div>
                </div>
            </div>
        </body>

        </html>