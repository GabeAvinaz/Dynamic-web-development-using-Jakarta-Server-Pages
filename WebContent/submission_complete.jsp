<!-- /*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *JSP page displays when form submission is complete
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
	<!-- displays parameter passed from FormProcessing servlet -->
	<h1>${message}</h1>
	<button class="menuButton" onclick="window.location.href='index.html'">Back to Main Menu</button><br>
</div>


</body>
</html>