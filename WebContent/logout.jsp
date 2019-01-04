<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   
<% 
session.invalidate();
RequestDispatcher req = request.getRequestDispatcher("login.jsp");
req.forward(request, response);
%>