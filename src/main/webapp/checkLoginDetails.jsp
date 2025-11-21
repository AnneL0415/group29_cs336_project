<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		List<String> list = new ArrayList<String>();

		try {

			//Get the database connection
			ApplicationDB db = new ApplicationDB();
			//Class.forName("com.mysql.jdbc.Driver");
			Connection con = db.getConnection();
			
			String user_id = request.getParameter("username");
			String password = request.getParameter("password");
			
			//Create a SQL statement
			Statement st = con.createStatement();
			ResultSet rs = st.executeQuery("SELECT * FROM users where user_id = '" + user_id + "' AND password = '" + password + "';");
			
			if (rs.next()) {
				//String user_name = rs.getString("user_id");
				session.setAttribute("user", user_id); // the username will be stored in the session
				//out.println("<a href='logout.jsp'>Log out</a>");
				response.sendRedirect("mainPage.jsp");
			} else {
				out.println("Invalid password! <a href='homePage.jsp'>Try again</a>");
			}
			

		} catch (Exception e) {
		}
	%>

</body>
</html>
