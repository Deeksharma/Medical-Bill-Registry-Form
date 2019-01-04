<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<!DOCTYPE html>
<html>
   <head>
      <title>MEDICAL_TABLE</title>
      <style>
      table {  
    color: #333;
    font-family: Helvetica, Arial, sans-serif;
    width: 100%; 
    border-collapse: 
    collapse; border-spacing: 0; 
}

td, th {  
    border: 1px solid transparent; /* No more visible border */
    height: 30px; 
    transition: all 0.3s;  /* Simple transition for hover effect */
}

th {  
    background: #DFDFDF;  /* Darken header a bit */
    font-weight: bold;
}

td {  
    background: #FAFAFA;
    text-align: center;
}

/* Cells in even rows (2,4,6...) are one color */        
tr:nth-child(even) td { background: #F1F1F1; }   

/* Cells in odd rows (1,3,5...) are another (excludes header cells)  */        
tr:nth-child(odd) td { background: #FEFEFE; }  

tr td:hover { background: #444; color: #FFF; } 
      </style>
   </head>

   <body>
      <sql:setDataSource var = "snapshot" driver = "com.mysql.jdbc.Driver"
         url = "jdbc:mysql://localhost/medical_database"
         user = "root"  password = "root"/>
 
      <sql:query dataSource = "${snapshot}" var = "result">
         SELECT * from bill_entry;
      </sql:query>
 
      <table border = "1" width = "100%">
         <tr>
            <th>Emp_type</th>
            <th>Medical_y</th>
            <th>Medical_m</th>
            <th>Bill_no</th>
            <th>Relation</th>
            <th>Place</th>
            <th>Department</th>
            <th>User_name</th>
            <th>Amount</th>
         </tr>
         
         <c:forEach var = "row" items = "${result.rows}">
            <tr>
               <td><c:out value = "${row.emptyp}"/></td>
               <td><c:out value = "${row.medyear}"/></td>
               <td><c:out value = "${row.medmonth}"/></td>
               <td><c:out value = "${row.bill_no}"/></td>
               <td><c:out value = "${row.relation}"/></td>
               <td><c:out value = "${row.place}"/></td>
               <td><c:out value = "${row.department}"/></td>
               <td><c:out value = "${row.user}"/></td>
               <td><c:out value = "${row.amo}"/></td>
            </tr>
         </c:forEach>
      </table>
 
   </body>
</html>