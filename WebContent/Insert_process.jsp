<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="gurucore"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="gurusql"%>

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

String[] year=new String[10];
String[] emp=new String[10];
String[] month=new String[10];
String[] bill_no=new String[10];
String[] relation=new String [10];
String[] pl=new String[10];
String[] department=new String[10];
String[] user=new String[10];
String[] amo=new String[10];

for(int i=0;i<10;i++){
	year[i]=request.getParameter(yea[i]);
	emp[i]=request.getParameter(name[i]);
	month[i]=request.getParameter(mon[i]);
	bill_no[i]=request.getParameter(bill[i]);
	relation[i]=request.getParameter(rel[i]);
	pl[i]=request.getParameter(place[i]);
	department[i]=request.getParameter(dept[i]);
	user[i]=request.getParameter(us[i]);
	amo[i]=request.getParameter(amount[i]);
	if(amo[i]==null){
		request.setAttribute("er", "*Please enter valid amount");

		RequestDispatcher req = request.getRequestDispatcher("ecl.jsp");
		req.include(request, response);
	}
}


for(int i=0;i<10;i++){
	
	try{ 
		if((!bill_no[i].equals("") )||(!pl[i].equals(""))||(!department[i].equals(""))){
		
		Class.forName("com.mysql.jdbc.Driver");  
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost/medical_database","root","root");
		String query="INSERT INTO bill_entry VALUES(?,?,?,?,?,?,?,?,?);";
		PreparedStatement ps=con.prepareStatement(query); 
		ps.setString(1,emp[i]);
		ps.setString(2,year[i]);
		ps.setString(3,month[i]);
		ps.setString(4,bill_no[i]);
		ps.setString(5,relation[i]);
		ps.setString(6,pl[i]);
		ps.setString(7,department[i]);
		ps.setString(8,user[i]);
		ps.setString(9,amo[i]);
		int row=ps.executeUpdate();
		if(row>0)
			out.println("Data Inserted");
		else
			out.println("Data could not inseted");
		
		}
		
		}
		catch(Exception e)
		{ out.println(e);
		}  
	}

RequestDispatcher req = request.getRequestDispatcher("ecl.jsp");
req.forward(request, response);
%>


