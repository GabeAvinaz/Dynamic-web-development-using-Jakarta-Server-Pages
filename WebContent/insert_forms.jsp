<!-- /*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *JSP containing all of the forms for insertion into the DB
 * 
 */ -->
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sqlServices.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="showHideForm.js"></script>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="theming.css">
<title>Database Setup Page</title>
</head>
<body>
<jsp:include page="header.html"></jsp:include>
<div class="main">
	<!-- utilized JS to show/hide each form individually -->
	<button class="menuButton" onclick="showUser()">Register New User</button>
	<button class="menuButton" onclick="showStore()">Register New Store</button>
	<button class="menuButton" onclick="showCoupon()">Register New Coupon</button>
</div>
<%
//try statement encapsulates all of the forms
//if dbcheck throws and exception Error message will show
try{
	SQLRunner repRun = new SQLRunner();
	ResultSet repNames = repRun.getRepNames();
	repRun.dbCheck();
%>

<div id="userForm" class="entryForm">

<h1>User Application</h1>
<!-- form to submit User informationP -->
<form method="post" action="FormProcessing1">
	<label>First Name:</label><br />
    <input type = "text" name ="fname"  required><br>
    <label>Last Name:</label><br />
    <input type = "text" name ="lname"  required><br>
	<label>Email:</label><br />
    <input type = "email" name ="email"><br>   
    <label>User Access Level:</label><br />
    <select id="discountSelect" name="usrmode" required>
    	<option value="U">User</option>
    	<option value="R">Representative</option>
    	<option value="A">Admin</option>
    </select><br />    	
	<input type="submit" name="newUser" value="Submit User">
</form>
</div>


<div id="storeForm" class="entryForm">
<h1>Store Application</h1>
<!-- form to submit store information, submits post to this JSP -->
<form method="post" action="FormProcessing1">
	<label>Store Name:</label><br />
    <input type = "text" name ="store" required><br>
    <select id="repID" name="repID" required>
<%
		repNames = repRun.getRepNames();
		while (repNames.next()){
			%>
				<option value="<%= repNames.getString("ID") %>"><%= repNames.getString("NAME") %></option>
			<%
		}
		repRun.disconnect();
%>
    </select><br />    	
	<input type="submit" name="newStore" value="View Pending Coupons">
</form>
</div>

<div id="couponForm" class="entryForm">

<h1>Coupon Application</h1>
<!-- form to submit coupon information, submits post to this JSP -->
<form method="post" action="FormProcessing1">
	<label>Coupon Code:</label><br />
    <input type = "text" name ="code"><br>
    <label>Store:</label><br />
     <select id="stores" name="stores" required>
    <%

		repNames = repRun.getStoreNames();
		while (repNames.next()){
			%>
				<option value="<%= repNames.getString("ID") %>"><%= repNames.getString("NAME") %></option>
			<%
		}
		repRun.disconnect();
	%>
	</select><br />
	<label>Title:</label><br />
    <input type = "text" name ="title" required><br>  
    <label>Description:</label><br />
    <textarea name ="description" placeholder="Enter your coupon description" ></textarea><br>
    <label>Restrictions:</label><br />
    <textarea name ="restrictions" placeholder="Enter any restrictions on the coupon"></textarea><br>     
    <label>Discount Type:</label><br />
    <select id="discountSelect" name="discountType" onchange="checkAmt(this)" required>
    	<option value="FLATRATE">Flate Rate</option>
    	<option value="PERCENT">Percent</option>
    	<option value="BOGO">Buy One Get One</option>
    	<option value="BOGO">Buy One Get One Free</option>
    	<option value="FREE">Free Item or Service</option>
    	<option value="OTHER">Other</option>
    </select><br />    
    <div id="amtInput">
    	<label>Discount Amount:</label><br>
    	<input id="flatInput" type="number" name="flatInput" min="0.00" max="999.99" step="1.00" value="0.00">
    	<input id="percentInput" type="number" name="percentInput" min="0" max="999" step="1" value="0"><br>  
	</div>
	<label>Start Date:</label><br />
    <input id="sDate" type="date" name="startDate" required><br>
    <label>End Date:</label><br />
    <input id="eDate" type="date" name="endDate" onchange="checkDate()"><br>  	
	<input type="submit" name="newCoupon" value="Submit New Coupon">
</form>
</div>

<script type="text/javascript">hideForms();</script>
	
<%	
	}
  	catch (Exception e){
  		e.printStackTrace();
  		//error message displayed if exception is thrown
  		%>
  		<h1>Please Load Database Tables</h1>
  		<%
  		
  	}
%>

</body>
</html>