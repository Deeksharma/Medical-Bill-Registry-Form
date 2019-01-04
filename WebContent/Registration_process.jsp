<!--<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%> -->
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="gurucore"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="gurusql"%>


<%
String username=request.getParameter("username");
String email=request.getParameter("email");
String password=request.getParameter("password");
String cpassword=request.getParameter("cpassword");
int Countrow=0;
try
{
Class.forName("com.mysql.jdbc.Driver").newInstance();
Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medical_database","root","root"); 
Statement st=con.createStatement();
String strQuery = "SELECT COUNT(*) FROM user WHERE UserName='"+username+"';";
// WHERE UserName='"+username+"';";
ResultSet rs = st.executeQuery(strQuery);

while(rs.next()){
Countrow = rs.getInt(1);
}

}
catch (Exception e){
e.printStackTrace();
}


if(password.equals(cpassword)&&Countrow==0){ %>
<gurusql:setDataSource var="guru" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/medical_database"
    user="root"  password="root"/>

    <gurusql:update dataSource="${guru}" var="guruvar">
    	INSERT INTO user VALUES ('<%=username%>','<%=password%>','<%=email%>');
	</gurusql:update>
<%  
	
	request.setAttribute("message", "*Account Created,Please login to continue");
	RequestDispatcher req = request.getRequestDispatcher("login.jsp");
	req.forward(request, response);
}

else{
	String x;
	if(Countrow>0) x="*Username already exists";
	else x="*Password fields are not same";
	request.setAttribute("errorMessage", x);

	RequestDispatcher req = request.getRequestDispatcher("registration.jsp");
	req.include(request, response);
	
}

%>

 

