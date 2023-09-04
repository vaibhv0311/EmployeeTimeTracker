
<%@page import="employee.entities.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link rel="stylesheet" href="<c:url value="/resources/css/edittaskstyle.css" />">
<title>Task Manager</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap')
	;
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
	<div class = "contaner">
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
			<button type="button" onclick="tasktable">View Tasks</button>
		</form>
		<br>
		
		<button><a href="tasktable" class="button" style="text-decoration: none;">
			View Tasks</a></button>
	</div></div>
		
	
	<%
          String message=(String)request.getAttribute("addMessage");
          if(message!=null){
        	  out.print(message);
          }
          %>


</body>
</html>
