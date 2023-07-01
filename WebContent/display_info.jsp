<!-- /*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *JSP returns the information stored on all project SQL tables
 * 
 */ -->


<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@page import="sqlServices.SQLRunner"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="showHide.js"></script>
<meta charset="ISO-8859-1">

<link rel="stylesheet" type="text/css" href="theming.css">
<script src="showHideTables.js"></script>
<title>Database Setup Page</title>
</head>
<body>
<jsp:include page="header.html"></jsp:include>
<div class="main">
	<!-- onclick each button calls a JavasScript function to show the related items -->
	<button class="menuButton" onclick="showUsers()">Show Users</button>
	<button class="menuButton" onclick="showStores()">Show Stores</button>
	<button class="menuButton" onclick="showCoupons()">Show Coupons</button>
</div>

		<!-- Table head for query results -->
		<div id="users">
		<div class="outputTable"> 
		<h2>Registered Users</h2>
		<table>
			<thead>
				<tr>
					<th>User ID</th>
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Access Level</th>
				</tr>
			</thead>
			<tbody>			
			
			
			
<%
			//query returns all of the info from USER_IFNO table
			SQLRunner runner = new SQLRunner();
            ResultSet rs = runner.getUsers();
	    	//cycles through each result and prints them to the table
			try{
		    	while (rs.next()){
	    			%>
	    			<tr>
	    				<td><%= rs.getString("U_ID") %></td>
	    				<td><%= rs.getString("U_FNAME") %></td>
	    				<td><%= rs.getString("U_LNAME") %></td>
	    				<td><%= rs.getString("U_EMAIL") %></td>
	    				<td><%= rs.getString("U_ACCESS_LVL") %></td>
	    			</tr>
	    			
	    			<%
	    		
				}
			}
	    	catch (Exception e){
	    		e.printStackTrace();
	    	}
	    	runner.disconnect();
		%>
		   	</tbody>
    		</table>
    		</div>
    		</div>
    	<!-- Table head for query results -->
    	<div id="stores">
		<div class="outputTable"> 
		<h2>Registered Stores</h2>
		<table>
			<thead>
				<tr>
					<th>Store ID</th>
					<th>Store Name</th>
					<th>Representative</th>
				</tr>
			</thead>
			<tbody>			
			
			
			
<%
			//query returns all of the info from STORE table

            rs = runner.getStores();
	    	//cycles through each result and prints them to the table
		try{	
	    	while (rs.next()){
    			%>
    			<tr>
    				<td><%= rs.getString("S_ID") %></td>
    				<td><%= rs.getString("S_NAME") %></td>
    				<td><%= rs.getString("U_REP") %></td>
    			</tr>
    			
    			<%
    		
			}
	    	
		}
    	catch (Exception e){
    		e.printStackTrace();
    	}
	    	runner.disconnect();
		%>
		   	</tbody>
    		</table>
    		</div>
   
   		</div>
   		<!-- Table head for query results -->
   		<div id="coupons">
		<h2>Available Coupons</h2>
			<div class="couponSheet">
<%
			//query returns all of the info from COUPON table

            rs = runner.getCoupons();
	    	//cycles through each result and prints them to the table
		try{	
	    	while (rs.next()){
    			%>
    			<div class="card">
    				<h4><%= rs.getString("S_NAME") %></h4>
    			    <h3><%= rs.getString("C_TITLE") %></h3>

    				<p><%= rs.getString("C_DESCRIPTION") %></p>
    				<p><%= rs.getString("C_RESTRICTION") %></p>
    				<span><%= rs.getString("C_DISC_TYPE") %> <%= rs.getString("C_DISC_AMT") %></span><br>
    				<span><%= rs.getString("C_START_DATE") %> - <%= rs.getString("C_END_DATE") %></span><br>
    				<span><%= rs.getString("C_ID") %> <%= rs.getString("C_CODE") %></span>
    			</div>
    			
    			<%
    		}
		}
    	catch (Exception e){
    		e.printStackTrace();
    	}
	    runner.disconnect();
		%>
    		</div>
    		</div>
    		</div>

<script type="text/javascript">hideTables();</script>

</body>
</html>