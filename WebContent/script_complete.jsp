<!-- /*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *JSP Displays completed SQL statements from scripts
 * 
 */ -->
<%@page import="sqlServices.SQLRunner"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" type="text/css" href="theming.css">
<title>Database Setup Page</title>
</head>
<body>
<jsp:include page="header.html"></jsp:include>
<div class="main">
	<button class="menuButton" onclick="window.location.href='index.html'">Back to Main Menu</button><br>
</div>

<div class="outputTable">
<table>
	<thead>
		<tr>
			<th>SQL Commands Executed</th>
		</tr>
	</thead>
	<tbody>
			<!-- loops through Arraylist and prints each string -->
		<c:forEach items="${commands}" var="line">
			<tr>
    			<td>${line}</td>
    		</tr>
		</c:forEach>

	</tbody>
</table>
</div>
</body>
</html>