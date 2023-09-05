<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<link rel="stylesheet" href="<c:url value="/resources/css/leadviewstyle.css" />">
<title>Employee Time Tracker</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap')
	;
</style>
</head>
<body
	style="background-image: url('<c:url value='/resources/person.jpg'/>'); background-size: cover;">


	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	
	%>
	<header>
		<a href="index" style="text-decoration: none;">
			<h1>Employee Time Tracker</h1>
		</a>
	</header>
	<nav>
		<ul>
			<li><a href="addassociateform" id="addTrainee">Add Associate</a></li>
			<li><a href="viewAssociateTable" id="viewTrainee">View
					Associate</a></li>
			<li><a href="addprojectform" id="addProject">Add Project</a></li>
			<li><a href="viewProjectTable" id="viewProject">View Project</a></li>
			<li><a href="leadlogout" id="logout">Logout</a></li>
		</ul>
	</nav>



</body>
</html>
