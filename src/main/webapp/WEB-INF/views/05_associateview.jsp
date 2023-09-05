<%@page import="employee.entities.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<link rel="stylesheet" href="<c:url value="/resources/css/associateviewstyle.css" />">
<title>Welcome Associate!</title>

<style>
@import
	url("https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap")
	;

</style>

</head>
<body
	style="background-image: url('<c:url value='/resources/glass.jpg'/>'); background-size: cover;">

	<%
  Employee employee = (Employee)session.getAttribute("employeeRegistered");
  %>
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	
	String message = (String)request.getAttribute("message");
	if(message!=null){
		out.print(message);
	}
	String result= (String)request.getAttribute("result");
	if(result!=null){
		out.print(result);
	}
%>
	<div class="heading">
		<h1>
			<a href="index" style="text-decoration: none;">EMPLOYEE TIME
				TRACKER</a>
		</h1>
	</div>

	<div class="container">

		<div class="panel">
			<div class="panel1">
				<div class="einfo panelbutton" onclick="showEmployeeInfo()">
					Employee Info</div>
				<div class="updateinfo panelbutton">
					<a href="edittasks" class="button" style="text-decoration: none;">
						Edit Tasks</a>
				</div>


				<div class=" updateinfo panelbutton">
					<a href="logout" class="button" style="text-decoration: none;">Logout</a>
				</div>
			</div>

			<div id="employeeInfo" style="display: none">
				<span>Employee ID</span>
				<div class="whitebg"><%= employee.getEmpId() %></div>
				<span>Employee Name</span>
				<div class="whitebg"><%= employee.getName()%></div>
				<span>Employee Email</span>
				<div class="whitebg"><%= employee.getId() %></div>
				<span>Employee Username</span>
				<div class="whitebg"><%= employee.getUserName() %></div>
				<span>Manager Contact </span>
				<div class="whitebg"><%= employee.getLeadId() %></div>
				<span>Employee Role</span>
				<div class="whitebg"><%= employee.getRole() %></div>
				<span>Project </span>
				<div class="whitebg"><%= employee.getProjectTitle() %></div>
				<span></span>
				<ul>
					<li>
						<ul>
							<br>
							<br>
							<span>Project Description</span>
							<li class="whitebg"><%= employee.getDescription() %></li>
						</ul>
					</li>
				</ul>

				<button onclick="hideEmployeeInfo()">Close</button>
			</div>

		</div>
	</div>

	<script>
		function showEmployeeInfo() {
			document.getElementById("employeeInfo").style.display = "block";
		}
		function hideEmployeeInfo() {
			document.getElementById("employeeInfo").style.display = "none";
		}
	</script>
</body>
</html>
