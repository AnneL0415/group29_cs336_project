<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*,java.util.Date"%>
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
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String dob = request.getParameter("dob");
			String address = request.getParameter("address");
			String user_id = request.getParameter("user_id");
			String password = request.getParameter("password");
			
			//Create a SQL statement
			Statement st1 = con.createStatement();
			ResultSet checkUser = st1.executeQuery("SELECT * FROM users where user_id = '" + user_id + "';");
			
			if (checkUser.next()) {
				out.println("This username has been taken. <a href='homePage.jsp'>Try again</a>");
			} else {
				String insert = "INSERT INTO users(user_id,name,email,dob,address,password)" + "VALUES (?,?,?,?,?,?)";
				PreparedStatement ps = con.prepareStatement(insert);
				ps.setString(1, user_id);
				ps.setString(2, name);
				ps.setString(3, email);
				ps.setString(4, dob);
				ps.setString(5, address);
				ps.setString(6, password);
				ps.executeUpdate();
				con.close();
				out.println("Account created! <a href='homePage.jsp'>Log in</a>");
			}
			

		} catch (Exception e) {
		}
	%>

</body>
</html>