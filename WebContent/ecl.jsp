<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%
String yeaa=String.valueOf(session.getAttribute("yer"));
String monn=String.valueOf(session.getAttribute("mo"));
String empp=String.valueOf(session.getAttribute("emp"));
String userr=String.valueOf(session.getAttribute("use"));
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>INSERT</title>
<style>

button[type=submit] {
    float: middle;
    margin-right: auto;
    margin-left:auto;
    margin-top: 20px;
    width: 140px;
    height: 40px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    background-color: #acd6ef; /*IE fallback*/
    background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
    background-image: -moz-linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    border-radius: 5px;
    border: 1px solid #66add6;
    box-shadow: 0 1px 2px rgba(0, 0, 0, .3), inset 0 1px 0 rgba(255, 255, 255, .5);
    cursor: pointer;
}
button[type=submit]:hover {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#b6e2ff), to(#6ec2e8));
    background-image: -moz-linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
    background-image: linear-gradient(top left 90deg, #b6e2ff 0%, #6ec2e8 100%);
}
button[type=submit]:active {
    background-image: -webkit-gradient(linear, left top, left bottom, from(#6ec2e8), to(#b6e2ff));
    background-image: -moz-linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
    background-image: linear-gradient(top left 90deg, #6ec2e8 0%, #b6e2ff 100%);
}
th{
	color:white;
}

td {margin: 2px;
height:35px; padding: 0;}
input[type=text] {
text-align:center;
	display: block;
    color: black;
    padding-left: 2px;
    margin: 1px;
    margin-top: 1px;
    margin-left: 1px;
    width: 100%;
    height: 100%;
    border: 0.5px solid darkblue;
    border-radius: 1px;
    box-shadow: inset 0.5px 0.5px 0.5px 0.5px darkblue, 0 0 0 5px #f5f7f8;
}
input[type=number] {
text-align:center;
	display: block;
    color: black;
    padding-left: 2px;
    margin: 1px;
    margin-top: 1px;
    margin-left: 1px;
    width: 100%;
    height: 100%;
    border: 0.5px solid darkblue;
    border-radius: 1px;
    box-shadow: inset 0.5px 0.5px 0.5px 0.5px darkblue, 0 0 0 5px #f5f7f8;
}



table{
border:none;
background-color:darkblue;
}

select {
background-image:url(../images/arrow.png);
background-repeat:no-repeat;
background-position:300px;
width:100%;
padding-left:12px;
margin:1px;
margin-top:1px;
height:100%;
border-radius:1px;
background-color:white;
color:black;

-webkit-appearance:none;
box-shadow: inset 0.5px 0.5px 0.5px 0.5px darkblue, 0 0 0 5px #f5f7f8;
outline:none
}
select:hover {
color:Dodgerblue;
}

</style>
</head>
<body bgcolor=darkblue>
<form method="post" action="Insert_process.jsp">
<h1 style="color:white;text-align:center;">INSERT</h1>
<div style="color:red;text-align:center;">${er}</div>
<table >
   
   		<tr>
   			<th>EMP_TYPE</th>
   			<th>MEDICAL_Y</th>
   			<th>MEDICAL_M</th>
   			<th>BILL_NO</th>
   			<th>RELATION</th>
   			<th>PLACE</th>
   			<th>DEPARTMENT</th>
   			<th>USER_ID</th>
   			<th>AMOUNT</th>
   		</tr>
 <%   	
   	String[] name={"name1","name2","name3","name4","name5","name6","name7","name8","name9","name10"};
		String[] yea={"year1","year2","year3","year4","year5","year6","year7","year8","year9","year10"};
		String[] mon={"mon1","mon2","mon3","mon4","mon5","mon6","mon7","mon8","mon9","mon10"};
		String[] bill={"bill1","bill2","bill3","bill4","bill5","bill6","bill7","bill8","bill9","bill10"};
		String[] rel={"rel1","rel2","rel3","rel4","rel5","rel6","rel7","rel8","rel9","rel10"};
		String[] place={"place1","place2","place3","place4","place5","place6","place7","place8","place9","place10"};
		String[] dept={"dept1","dept2","dept3","dept4","dept5","dept6","dept7","dept8","dept9","dept10"};
		String[] us={"us1","us2","us3","us4","us5","us6","us7","us8","us9","us10"};
		String[] amount={"amount1","amount2","amount3","amount4","amount5","amount6","amount7","amount8","amount9","amount10"};
		Connection con;
		Class.forName("com.mysql.jdbc.Driver");
		con=(Connection)DriverManager.getConnection("jdbc:mysql://localhost/medical_database", "root", "root");
		PreparedStatement ps=(PreparedStatement)con.prepareStatement("SELECT * from emp_master WHERE emp_typ='"+empp+"' AND medical_year='"+yeaa+"' AND medical_month='"+monn+"' AND username='"+userr+"' ;");
		ResultSet rs = ps.executeQuery();
		String e=" ";
		String y=" ";
		String m=" ";
		String u=" ";
		while(rs.next()){
			e=rs.getString("emp_typ");
			y=rs.getString("medical_year");
			m=rs.getString("medical_month");
			u=rs.getString("username");
			//out.println("Username "+username+" Pass "+password+"<hr>");
		}
 	for(int i=0;i<10;i++){
 %>  	
        <tr>
           <td><input type="text" name="<%=name[i]%>"  value="<%=e%>" readonly/></td>
           <td><input type="text" name="<%= yea[i]%>" value="<%=y%>" readonly  /></td>
           <td><input type="text" name="<%= mon[i]%>" value="<%=m%>" readonly/></td>
           <td><input type="text" name="<%=bill[i]%>"  value=""  /></td>
           
           <td>
          
           <select name="<%=rel[i]%>" >
    				
  				    <option value="self">SELF</option>
 				    <option value="spouse">SPOUSE</option>
  				    <option value="daughter">DAUGHTER</option>
 			 </select></td>
           <td><input type="text" name="<%=place[i] %>" value="" /></td>
           <td><input type="text"  name="<%=dept[i]%>" value="" /></td>
           <td><input type="text" name="<%=us[i] %>"  value="<%=u%>" readonly /></td>
           <td><input type="number" pattern="[0-9]"  name="<%=amount[i] %>"  value="0" /></td>
          
           
        </tr>
        
        <%} %>
    
</table>
<div style="float:left">
<script>
function doSubmit() 
{ 
window.open("Insert_process.jsp","_self"); 
} 
function doSubmit1() 
{ 
window.open("medical_ecl.jsp","_self"); 
} 
</script>
	<button type="submit" onclick="doSubmit();" value="Save">SAVE</button>

	
</div>
</form>


<div style="float:left"><button type="submit" onclick="doSubmit1();" value="Home">HOME</button></div>

</body>
</html>