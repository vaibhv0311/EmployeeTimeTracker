
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

<title>Task Manager</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap')
	;

body {
	font-family: Arial, sans-serif;
	background-image: url("download.jpg");
	background-size: cover;
	margin: 0;
	padding: 0;
}

.container {
	/* max-width: 800px; */
	width: 75%;
	margin: 0 auto;
	padding: 20px;
	padding-right: 35px;
	margin-top: 10px;
	margin-bottom: 20px;
	background-color: rgba(255, 255, 255);
	border-radius: 5px;
	box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1); /* for tranparency */
}

h1, h2 {
	text-align: center;
	margin: 0 0 20px;
	color: white; /* Heading color */
	font-family: "Bungee Spice", cursive;
}

.add-project-form {
	margin-bottom: 20px;
}

/* .projects-list{
  margin: 0 auto;
    padding: 20px;
    margin-top: 10px;
    background-color: #fff;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    border-radius: 5px;
}
 */
.projects-list table {
	width: 85%;
	margin: 0 auto;
	border-collapse: collapse;
	margin-top: 20px;
	margin-bottom: 20px;
}

.projects-list th, .projects-list td {
	border: 3px solid #ddd;
	padding: 8px;
	text-align: center;
}

.projects-list th {
	background-color: #f2f2f2;
}

.projects-list .no-projects-message {
	text-align: center;
	font-style: italic;
	font-weight: bolder;
	font-size: x-large;
	font-family: 'Bungee Spice', cursive;;
}

.projects-list button {
	background-color: #ff6347;
	color: #fff;
	border: none;
	padding: 5px 10px;
	cursor: pointer;
	font-size: 14px;
	border-radius: 4px;
}

.projects-list button.edit {
	background-color: #3498db;
}

.projects-list button:hover {
	background-color: #d9534f;
}

/* Improved form styling */
.add-project-form input[type="text"], .add-project-form input[type="date"],
	.add-project-form input[type="number"], .add-project-form select {
	width: 100%;
	padding: 8px;
	margin-bottom: 10px;
	border: 1px solid #ddd;
	border-radius: 4px;
	font-size: 14px;
}

.add-project-form select {
	cursor: pointer;
}

.add-project-form button {
	background-color: #007bff;
	color: #fff;
	border: none;
	padding: 8px 16px;
	cursor: pointer;
	font-size: 16px;
	border-radius: 4px;
	transition: background-color 0.3s;
}

.add-project-form button:hover {
	background-color: #0056b3;
}

/* Improved project item styling */
.projects-list .project-item {
	background-color: #fff;
	border: 1px solid #ddd;
	border-radius: 4px;
	margin-bottom: 10px;
	padding: 10px;
	display: flex;
	align-items: center;
	justify-content: space-between;
	transition: box-shadow 0.3s;
}

.projects-list .project-item:hover {
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.projects-list .project-item button {
	margin-left: 10px;
}

/* ... (other styles) */
</style>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>

<body
	style="background-image: url('<c:url value='/resources/backdrop.jpg'/>'); background-size: cover;">


	<%
  Employee employee = (Employee)session.getAttribute("employeeRegistered");
  %>

	<h1>EMPLOYEE TIME TRACKER</h1>
	<div class="container">
		<h4>
			<a href="associateview" style="text-decoration: none;">Back to
				dashboard</a>
		</h4>
	</div>
	<h2>Add Your Task</h2>

	<div class="add-project-form">
		<form action="addtask" method="post">
			<label for="name">Username:</label> <input type="text"
				id="usernameName" name="username"
				value="<%= employee.getUserName() %>" placeholder="userName" /><br>
			<label for="name">Task Name:</label> <input type="text" id="taskName"
				name="taskName" required placeholder="Task Name" /><br> <label
				for="description">Description</label> <input type="text"
				id="description" name="description" required
				placeholder="Description" /><br> <label for="date">Date</label>
			<input type="date" id="date" name="date" min="2023-08-29" required /><br>
			<div align="center">
				<label for="startTime">Start time:</label> <input type="time"
					id="startTime" name="startTime" min="09:00" max="17:00" required
					placeholder="Start time" />
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<label for="endTime">End time:</label> <input type="time"
					id="endTime" name="endTime" min="09:00" max="17:00" required
					placeholder="End time" />
			</div>
			<br> <select id="status" name="status" required>
				<option value="ongoing">Ongoing</option>
				<option value="finished">Finished</option>
			</select><br>
			<button type="submit">Add Task</button>
			<button type="reset">Clear Form</button>
		</form>
	</div>
	<div class="updateinfo panelbutton">
		<a href="tasktable" class="button" style="text-decoration: none;">
			View Tasks</a>
	</div>
	<%
          String message=(String)request.getAttribute("addMessage");
          if(message!=null){
        	  out.print(message);
          }
          %>


</body>
</html>
