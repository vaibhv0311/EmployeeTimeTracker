<%@page import="employee.entities.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<title>Update Employee Data</title>
<style>
body, h1, h2, h3, p, ul, li {
	margin: 0;
	padding: 0;
}

/* Basic styling */
body {
	font-family: Arial, sans-serif;
	background-color: #87CEEB; /* Sky Blue */
	/*background-image: url("download.jpg");*/
	background-size: cover;
}

nav, main, footer {
	padding: 20px;
}

/* header h1 {
    width: 100%;
    background-color: #828080;
    color: rgb(189, 199, 255);
} */
h1, legend {
	text-align: center;
	margin-bottom: 20px;
	margin-top: 20px;
	font-family: 'Bungee Spice', cursive;
}

nav {
	margin-top: 10px;
}

nav ul {
	list-style: none;
	display: flex;
	justify-content: center;
	gap: 20px;
}

nav a {
	background-color: #007bff;
	color: white;
	text-decoration: none;
	padding: 10px;
	border: 1px solid #333;
	border-radius: 5px;
	transition: background-color 0.3s, color 0.3s;
}

nav a:hover {
	background-color: #333;
	color: white;
}

/* Style for the Add Trainee Form */
#addTraineeForm {
	display: true;
	margin-top: 20px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #a9f0fe;
	/* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
}

#addTraineeForm label {
	font-weight: bold;
}

#addTraineeForm input[type="text"], #addTraineeForm input[type="password"],
	#addTraineeForm textarea {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
}

#addTraineeForm input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#addTraineeForm input[type="submit"]:hover {
	background-color: #0056b3;
}

#addTraineeForm textarea {
	resize: vertical;
}
</style>
</head>
<body>

	<%
	Employee employee = (Employee) request.getAttribute("employeeToUpdate");
	%>
	<div id="addTraineeForm">
		<form
			action="<%=request.getContextPath()%>/update/<%=employee.getEmpId()%>"
			method="get">
			<fieldset>
				<legend>Update Employee Form</legend>

				<label for="name">Name:</label> <input type="text" id="name"
					name="name" value="<%=employee.getName()%>" required
					placeholder="Enter Employee Name" /><br /> <label for="id">Email
					ID:</label> <input type="text" id="id" name="id"
					value=<%=employee.getId()%> required placeholder="Email here" /><br />

				<label for="username">Username:</label> <input type="text" disabled
					id="username" name="username" value=<%=employee.getUserName()%>
					required placeholder="Enter unique name" /><br> <label
					for="createPassword">Create Password:</label> <input
					type="password" id="createPassword" name="createPassword"
					value=<%=employee.getPassword()%> required
					placeholder="Password here" /><br /> <label for="leadid">Lead
					Email:</label> <input type="text" id="leadid" name="leadid"
					value=<%=employee.getLeadId()%> required
					placeholder="Lead Email here" /><br /> <label for="role">Role:</label>
				<input type="text" id="role" name="role"
					value=<%=employee.getRole()%> required
					placeholder="Enter role here" /><br /> <label for="projectTitle">Project
					Title:</label> <input type="text" id="projectTitle" name="projectTitle"
					value=<%=employee.getProjectTitle()%> required><br> <br>
				<label for="description">Description:</label><br>
				<textarea id="description" name="description" rows="4" cols="50"
					required placeholder="Add a description"></textarea>
				<br> <br> <input type="submit" value="Submit">
			</fieldset>
		</form>
	</div>

	<p>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
			out.print(message);
		}
		%>

	</p>
	<script>
		var textarea = document.getElementById("description");
		textarea.value =
	<%=employee.getDescription()%>
		;
	</script>
</body>
</html>