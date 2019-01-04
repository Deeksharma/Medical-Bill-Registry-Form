<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@ page import="java.io.*" %>
    <%@ page import="java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<Meta http-equiv=Pragma content=cache>
<Meta http-equiv=Cache-Control content=no-cache >
<Meta http-equiv=Expires content=0>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <%
   response.addHeader("Cache-Control", "no-cache,no-store,private,must-revalidate,max-stale=0,post-check=0,pre-check=0"); 
   response.addHeader("Pragma", "no-cache"); 
   response.addDateHeader ("Expires", 0);
 %>

<title>ECL COMBINED MEDICAL LIST</title>
<style>
* {
  box-sizing: border-box;
}

/* Create four equal columns that floats next to each other */
.column {
  float: left;
  width: 30%;
  padding: 10px;
  margin-left:1.5%;
  margin-right:1.5%;
  height: 120px; /* Should be removed. Only for demonstration */
}

/* Clear floats after the columns */
.row:after {
  content: "";
  display: table;
  clear: both;
}
#box{
	padding-top:10px;
	width:100%;
	height:40%;
	border:none;
	background-color:darkblue;
	text-align:center;
	padding-bottom:10px;
	margin-top:10px;
	margin-bottom:10px;
	
}
#box2{
	border-radius: 15px;
	padding-top:10px;
	width:80%;
	height:170px;
	 margin-left: auto;
  margin-right: auto;
	border:none;
	background-color:darkblue;
	text-align:center;
	padding-bottom:10px;
	padding-right:10px;
	margin-top:10px;
	
	margin-bottom:10px;
	
}

button[type=submit] {
    float: right;
    margin-right: 20px;
    margin-top: 10px;
    width: 80px;
    height: 30px;
    font-size: 14px;
    font-weight: bold;
    color: #fff;
    background-color: #acd6ef; /*IE fallback*/
    background-image: -webkit-gradient(linear, left top, left bottom, from(#acd6ef), to(#6ec2e8));
    background-image: -moz-linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    background-image: linear-gradient(top left 90deg, #acd6ef 0%, #6ec2e8 100%);
    border-radius: 30px;
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
#box3{
	

	 margin-top: 10px;
  	margin-bottom: auto;
	border-radius: 15px;
	margin-left:5px;
	margin-right:10px;
	background-color:white;
	width:100%;
	height:50%;
	display:inline-block;
	}
	

#box3 > div{
display:inline-block;
  
  margin:5px;
}

#box1{
	
	
	margin:5px 20px 20px 5px;
	
	background-color:#68B6DC;
	width:100%;
	height:30%;
}
.blackText{
	color:black;
	
}
.whiteText{
	color:white;
}
.abc{
	color:white;
	
	margin-right:150px;
}
.custom-select {
  position: relative;
  font-family: Arial;
}

.custom-select select {
  display: none; /*hide original SELECT element:*/
}

.select-selected {
  background-color: DodgerBlue;
}

/*style the arrow inside the select element:*/
.select-selected:after {
  position: absolute;
  content: "";
  top: 14px;
  right: 10px;
  width: 0;
  height: 0;
  border: 6px solid transparent;
  border-color: #fff transparent transparent transparent;
}

/*point the arrow upwards when the select box is open (active):*/
.select-selected.select-arrow-active:after {
  border-color: transparent transparent #fff transparent;
  top: 7px;
}

/*style the items (options), including the selected item:*/
.select-items div,.select-selected {
  color: #ffffff;
  padding: 8px 16px;
  border: 1px solid transparent;
  border-color: transparent transparent rgba(0, 0, 0, 0.1) transparent;
  cursor: pointer;
  user-select: none;
}

/*style items (options):*/
.select-items {
  position: absolute;
  background-color: DodgerBlue;
  top: 100%;
  left: 0;
  right: 0;
  z-index: 99;
}

/*hide the items when the select box is closed:*/
.select-hide {
  display: none;
}

.select-items div:hover, .same-as-selected {
  background-color: rgba(0, 0, 0, 0.1);
}

input[type=text] {
font-family: Arial;
	font-size:18px;
	text-align:center;
    color:white;
    background-color:DodgerBlue;
    padding-left: 10px;
    margin: 10px;
    margin-top: 12px;
    margin-left: 18px;
    width: 150px;
    height: 35px;
    border: none;
    border-radius: 0px;
    box-shadow: inset 0 1.5px 3px DodgerBlue, 0 0 0 5px DodgerBlue;
}
</style>
</head>
<body>
<% String s=String.valueOf(session.getAttribute("uu"));%>
<div id="box">
<button type="submit" onclick="doSubmit2();" value="Logout">Logout</button>
<font color="white"><h2>EASTERN COALFIELDS LIMITED</h2><h3>HEAD QUARTER</h3><h2>MEDICAL ENTRY FORM</h2></font></div>
<div class="row">
  <div class="column" style="background-color:#21A4FF;">
    <div id="box1"><span class="blackText">FORM_ID:</span>&nbsp;<span class="whiteText">MEDICAL_F</span></div>
    <div id="box1"><span class="blackText">USER_ID:</span>&nbsp;<span class="whiteText"><%=s %></span></div>
  </div>

  <div class="column" style="background-color:#21A4FF;">
    <div id="box1"><span class="blackText">RUN DATE:</span>&nbsp;<span class="whiteText"><% Date date = Calendar.getInstance().getTime();DateFormat formatter = new SimpleDateFormat("E dd.MM.yyyy");String today = formatter.format(date);out.println(today); %></span></div>
    <div id="box1"><span class="blackText">APPLICATION_ID:</span>&nbsp;<span class="whiteText">PAY</span></div>
  </div>
  <div class="column" style="background-color:#21A4FF;">
	<div id="box1"><span class="blackText">DEV. BY:</span>&nbsp;<span class="whiteText">DEEKSHA SHARMA</span></div>
    <div id="box1"><span class="blackText">VERSION:</span>&nbsp;<span class="whiteText">1.0</span></div>
  </div>
</div>
<hr style="background-color:darkblue;width:100%;height:10px;margin-top:10px;margin-bottom:10px">
<div id="box2">
<div><span class="abc">EMP_TYP</span>&nbsp;<span class="abc">MEDICAl_YEAR</span>&nbsp;<span class="abc">MEDICAl_M</span>&nbsp;<span class="whiteText">USER_ID</span></div>

<form action="Medical_ecl_process.jsp" method="post">
<div id="box3">  
<div>
<input type="text" id="emp_typ" name="emp_type" style="margin-right:100px;text-color:white;" placeholder="EMPTYPE"required>
</div>
<div class="custom-select" style="width:150px;border-radius:5px;margin-right:100px;">
  <select name="yr" required>
    
    <option value="2018">2018</option>
    <option value="2019">2019</option>
    <option value="2020">2020</option>
    <option value="2021">2021</option>
    <option value="2022">2022</option>
    <option value="2023">2023</option>
    <option value="2024">2024</option>
  </select>
</div>

<div class="custom-select" style="width:150px;border-radius:5px;margin-right:100px">
  <select name="mon" required>
    <option value="1">1</option>
    <option value="2">2</option>
    <option value="3">3</option>
    <option value="4">4</option>
    <option value="5">5</option>
    <option value="6">6</option>
    <option value="7">7</option>
    <option value="8">8</option>
    <option value="9">9</option>
    <option value="10">10</option>
    <option value="11">11</option>
    <option value="12">12</option>
  </select>
</div>
 
  
  <script>
var x, i, j, selElmnt, a, b, c;
/*look for any elements with the class "custom-select":*/
x = document.getElementsByClassName("custom-select");
for (i = 0; i < x.length; i++) {
  selElmnt = x[i].getElementsByTagName("select")[0];
  /*for each element, create a new DIV that will act as the selected item:*/
  a = document.createElement("DIV");
  a.setAttribute("class", "select-selected");
  a.innerHTML = selElmnt.options[selElmnt.selectedIndex].innerHTML;
  x[i].appendChild(a);
  /*for each element, create a new DIV that will contain the option list:*/
  b = document.createElement("DIV");
  b.setAttribute("class", "select-items select-hide");
  for (j = 1; j < selElmnt.length; j++) {
    /*for each option in the original select element,
    create a new DIV that will act as an option item:*/
    c = document.createElement("DIV");
    c.innerHTML = selElmnt.options[j].innerHTML;
    c.addEventListener("click", function(e) {
        /*when an item is clicked, update the original select box,
        and the selected item:*/
        var y, i, k, s, h;
        s = this.parentNode.parentNode.getElementsByTagName("select")[0];
        h = this.parentNode.previousSibling;
        for (i = 0; i < s.length; i++) {
          if (s.options[i].innerHTML == this.innerHTML) {
            s.selectedIndex = i;
            h.innerHTML = this.innerHTML;
            y = this.parentNode.getElementsByClassName("same-as-selected");
            for (k = 0; k < y.length; k++) {
              y[k].removeAttribute("class");
            }
            this.setAttribute("class", "same-as-selected");
            break;
          }
        }
        h.click();
    });
    b.appendChild(c);
  }
  x[i].appendChild(b);
  a.addEventListener("click", function(e) {
      /*when the select box is clicked, close any other select boxes,
      and open/close the current select box:*/
      e.stopPropagation();
      closeAllSelect(this);
      this.nextSibling.classList.toggle("select-hide");
      this.classList.toggle("select-arrow-active");
    });
}
function closeAllSelect(elmnt) {
  /*a function that will close all select boxes in the document,
  except the current select box:*/
  var x, y, i, arrNo = [];
  x = document.getElementsByClassName("select-items");
  y = document.getElementsByClassName("select-selected");
  for (i = 0; i < y.length; i++) {
    if (elmnt == y[i]) {
      arrNo.push(i)
    } else {
      y[i].classList.remove("select-arrow-active");
    }
  }
  for (i = 0; i < x.length; i++) {
    if (arrNo.indexOf(i)) {
      x[i].classList.add("select-hide");
    }
  }
}
/*if the user clicks anywhere outside the select box,
then close all select boxes:*/
document.addEventListener("click", closeAllSelect);
</script>
<div>
<input type="text" id="emp_typ" value=<%=s %> name="us_er" placeholder="EMPTYPE" readonly>
</div>

</div>
<div style="float:right">
<script>

function doSubmit() 
{ 
window.open("view.jsp","_self"); 
} 
function doSubmit2() 
{ 
window.open("logout.jsp","_self"); 
} 
</script>
	
	<button type="submit" value="Insert">Insert</button>

</div>

</form>
	<div style="float:right">
<button type="submit" onclick="doSubmit();" value="View">View</button>
</div>
</div>

</body>
</html>
    