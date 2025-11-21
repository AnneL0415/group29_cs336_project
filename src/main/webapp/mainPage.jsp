<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>BuyMe</title>
	</head>
	
	<body>

		<h1>BuyMe</h1>
		<h2>Clothes Clothes Clothes</h2>
							  
		<br>
		
		<%//Get the database connection
		ApplicationDB db = new ApplicationDB();
		//Class.forName("com.mysql.jdbc.Driver");
		Connection con = db.getConnection(); %>
		
		<%
		if ((session.getAttribute("user") == null)) {
		%>
			<h3>You are not logged in</h3>
			<a href="homePage.jsp">Please Login</a>
		<%} else {
		%>
			<%
			String user_id = (String) session.getAttribute("user");
			Statement st1 = con.createStatement();
			ResultSet rs1 = st1.executeQuery("SELECT * FROM users where user_id = '" + user_id + "';");
			String name = "";
			boolean is_admin = false;
			if(rs1.next()){
				name = rs1.getString("name");
				is_admin = rs1.getBoolean("is_admin");
			}
			%>
			<h3>Welcome <%= name%>!</h3>
			<%
			if(is_admin){%>
				<a href='manageUsers.jsp'>Manage users</a>
			<%
			}
			%>
		<%
		}
		%>
		<br>
		<a href='logout.jsp'>Log out</a>
		<br>
		<a href='newAuctionItem.jsp'>Auction new item</a>
	

</body>
</html>
