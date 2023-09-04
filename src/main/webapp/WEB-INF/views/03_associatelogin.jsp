<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<link rel="stylesheet" href="<c:url value="/resources/css/leadloginstyle.css" />">

<style>
@import
	url("https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap")
	;
</style>
<title>EMPLOYEE TIME TRACKER</title>
</head>
<body
	style="background-image: url('<c:url value='/resources/white.jpg'/>'); background-size: cover;">

	<div class="bigcontainer">
		<div class="container">
			<div class="heading">
				<a href="index" style="text-decoration: none;"><h1>Employee
						Time Tracker</h1></a>
			</div>
			<div class="heading">
				<h1>WELCOME ASSOCIATE!</h1>
			</div>

			<div class="lead-login">
				<div class="login-container">
					<form class="login-form" action="associatelogin" method="post">
						<label for="username">Username:</label> <input type="text"
							id="username" name="username" required> <label
							for="password">Password:</label> <input type="password"
							id="password" name="password" required>
						<button type="submit">LOGIN</button>
					</form>
				</div>
			</div>
			<p>
				<% 
		String result = (String)request.getAttribute("result");
		if(result!=null){
			out.print(result);
		}
	%>
			</p>
		</div>
	</div>

</body>
</html>