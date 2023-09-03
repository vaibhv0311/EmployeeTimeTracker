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
<title>Welcome Associate!</title>

<style>
@import
	url("https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap")
	;

body {
	margin: 0;
	padding: 0;
	height: 100vh;
	background-color: #d8e7f1;
	font-family: Arial, Helvetica, sans-serif;
	background-image: url("download.jpg");
	background-size: cover;
}

.heading {
	text-align: center;
	margin-top: 5vh;
}

h1 {
	font-family: "Bungee Spice", cursive;
}

.container {
	display: flex;
	width: 100%;
}

.panel {
	width: 100%;
	display: block;
	margin: 2rem;
}

.panel1 {
	width: 100%;
	display: flex;
	justify-content: space-around;
	padding: 25px;
}

.panelbutton {
	/* border: 2px solid black;
height: fit-content;
width: fit-content;
text-align: center;
padding: 5px;
border-radius: 5px;
background-color: aqua;
font-weight: bold;
*/
	background-color: #007bff;
	color: white;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	margin: 0 5px; /* Add margin between buttons */
	text-decoration: none;
}

.panelbutton:hover {
	background-color: #0056b3;
	cursor: pointer;
}

#employeeInfo {
	display: none;
	width: 100%;
	background-color: rgba(255, 255, 255, 0.1);
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	border: 1px solid #ddd;
	padding: 20px;
	border-radius: 5px;
}

#employeeInfo h2 {
	margin-top: 0;
}

#employeeInfo ul {
	list-style: none;
	padding: 0;
	margin: 0;
}

#employeeInfo li {
	margin: 15px;
	border: 2px solid rgb(92, 138, 255);
	padding: 10px;
	border-radius: 4px;
	box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
	/* background-color: rgb(191, 245, 255); */
}

#employeeInfo li li {
	margin: 15px;
	border: 2px solid rgb(92, 138, 255);
	border-radius: 4px;
	padding: 10px;
	background-color: #ffffff;
	/* background-color: rgb(191, 245, 255); */
}

#employeeInfo span {
	/* margin: 10px; */
	padding: 10px;
	font-weight: bold;
	color: rgb(50, 0, 94);
}

#employeeInfo div {
	margin: 15px;
	border: 2px solid rgb(92, 138, 255);
	border-radius: 4px;
	padding: 10px;
	background-color: white;
}

#employeeInfo button {
	background-color: #007bff;
	color: white;
	border: none;
	padding: 8px 16px;
	border-radius: 5px;
	cursor: pointer;
	margin: 15px;
	padding: 10px;
}

#employeeInfo button:hover {
	background-color: #0056b3;
}
</style>

</head>
<body
	style="background-image: url('<c:url value='/resources/glass.jpg'/>'); background-size: cover;">

	<%
  Employee employee = (Employee)session.getAttribute("employeeRegistered");
  %>
	<% 
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
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
