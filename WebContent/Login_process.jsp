<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
String username=request.getParameter("username");
String password=request.getParameter("password");
try{
Connection con;
Class.forName("com.mysql.jdbc.Driver");
con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/medical_database", "root", "root");
PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT * from user WHERE UserName='"+username+"';");
ResultSet rs = ps.executeQuery();
String pass=" ";
String user=" ";
while(rs.next()){
	user=rs.getString("username");
	pass=rs.getString("Password");
	//out.println("Username "+username+" Pass "+password+"<hr>");
}

if(password.equals(pass)&&user!=" "){
	request.setAttribute("user_name", user);
	session.setAttribute("uu",user);
	RequestDispatcher req = request.getRequestDispatcher("medical_ecl.jsp");
	req.forward(request, response);
} 
else{
//out.println("<meta http-equiv='refresh' content='3;URL=registration.jsp'>");//redirects after 3 seconds
//out.println("<p style='color:red;'>password fields are not same</p>");
	request.setAttribute("errorMessage", "*Username or Password is incorrect");

	RequestDispatcher req = request.getRequestDispatcher("login.jsp");
	req.include(request, response);
	
}
}
catch(Exception e){
	out.println(e.getMessage());
}

%>
 
