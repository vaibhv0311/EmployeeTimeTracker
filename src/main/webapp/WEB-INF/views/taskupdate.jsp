<%@page import="employee.entities.Task"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<title>Insert title here</title>
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
	background-color: rgba(255, 255, 255, 0.1);
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
</style>
</head>
<body>
	<%
Task task = (Task)request.getAttribute("taskToUpdate");

%>
	<div class="add-project-form">
		<form
			action="<%=request.getContextPath()  %>/updatetask/<%= task.getTaskId() %>"
			method="get">
			<label for="name">Username:</label> <input type="text"
				id="usernameName" name="username" value="<%= task.getUsername() %>"
				required placeholder="Project Name" /><br> <label for="name">Task
				Name:</label> <input type="text" id="taskName" name="taskName"
				value="<%= task.getTaskName() %>" required
				placeholder="Project Name" /><br> <label for="description">Description</label>
			<input type="text" id="description" name="description"
				value="<%= task.getDesc() %>" required placeholder="Description" /><br>
			<label for="date">Date</label> <input type="date" id="date"
				name="date" value="<%= task.getDate() %>" min="2023-08-29" required /><br>
			<div align="center">
				<label for="startTime">Start time:</label> <input type="time"
					id="startTime" name="startTime" min="09:00" max="17:00"
					value="<%= task.getStartTime() %>" required
					placeholder="Start time" />
				&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;
				<label for="endTime">End time:</label> <input type="time"
					id="endTime" name="endTime" min="09:00" max="17:00"
					value="<%= task.getEndTime()%>" required placeholder="End time" />
			</div>
			<br> <select id="status" name="status" required>
				<option value="ongoing">Ongoing</option>
				<option value="finished">Finished</option>
			</select><br>
			<button type="submit">Update</button>
		</form>
	</div>
</body>
</html>