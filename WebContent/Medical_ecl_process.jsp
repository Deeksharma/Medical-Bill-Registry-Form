<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%
String year=request.getParameter("yr");
String month=request.getParameter("mon");
String emp_type=request.getParameter("emp_type");
String user=request.getParameter("us_er");
session.setAttribute("yer", year);
session.setAttribute("mo", month);
session.setAttribute("emp", emp_type);
session.setAttribute("use", user);
%>
<sql:setDataSource var="guru" driver="com.mysql.jdbc.Driver"
    url="jdbc:mysql://localhost/medical_database"
    user="root"  password="root"/>

    <sql:update dataSource="${guru}" var="guruvar">
    	INSERT INTO emp_master VALUES ('<%=emp_type %>','<%=Integer.valueOf(year)%>','<%=Integer.valueOf(month)%>','<%=user%>');
	</sql:update>
<%@ include file="ecl.jsp"%>