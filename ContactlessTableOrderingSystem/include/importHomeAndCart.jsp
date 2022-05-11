<%@ page import ="java.text.DecimalFormat" %>
<%@ page import = "com.screamscrum.dbconnection.DbConnection" %>
<%@ page import = "com.screamscrum.mainPage.controller.mainPageController" %>
<%@ page import = "com.screamscrum.mainPage.entity.mainPage" %>
<%@ page import = "com.screamscrum.cart.entity.cart" %>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.ArrayList" %>

<%
	DecimalFormat dcf = new DecimalFormat("#.##");
	request.setAttribute("dcf", dcf);	

	ArrayList<cart> cart_list = (ArrayList<cart>) session.getAttribute("cart-list");
	List<cart> cartList = null;
	if(cart_list != null)
	{
		mainPageController mpd = new mainPageController(DbConnection.init());
		cartList = mpd.getCartProducts(cart_list);
		double total = mpd.getTotalCartPrice(cart_list);
		request.setAttribute("total", total);
		request.setAttribute("cart_list", cart_list);
	}
%>