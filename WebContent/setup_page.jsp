<!-- /*
 * Gabriel Avinaz
 * 5/29/2020
 * Assignment 9.3
 *
 *JSP page to initiate DB setup
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
<!-- button calls pagecontroller and passes the setup parameter -->
	<button class="menuButton" onclick="window.location.href='PageController1?run=setup'">Begin Setup</button><br>
</div>


</body>
</html>