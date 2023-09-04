<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<link rel="stylesheet" href="<c:url value="/resources/css/index.css" />">
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap");
	 
</style>
<title>EMPLOYEE TIME TRACKER</title>
</head>
<body
	style="background-image: url('<c:url value='/resources/blue.jpg'/>'); background-size: cover;">
	<div class="centered">
		<h1>Employee Time Tracker</h1>
		<div class="buttons">
			<a href="leadlogin" class="button">Lead</a> <a href="associatelogin"
				class="button">Associate</a>
		</div>
	</div>
</body>
</html>