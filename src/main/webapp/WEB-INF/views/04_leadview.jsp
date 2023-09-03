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
<title>Employee Time Tracker</title>

<style>
@import
	url('https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap')
	;
/* Reset some default styles */
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
h1 {
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

/* Style for the tabular form */
.viewTraineeTable {
	display: true; /* Hide the table initially */
	/* width: 100%; */
	border-collapse: collapse;
	margin-top: 20px;
}

.viewTraineeTable th, .viewTraineeTable td {
	border: 1px solid #ddd;
	padding: 8px;
}

.viewTraineeTable th {
	background-color: #17e9ec;
	font-weight: bold;
	width: 20rem;
}

#viewProjectTable th {
	width: 25rem;
}

#addProjectForm {
	display: true;
	margin-top: 20px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 5px;
	background-color: #a9f0fe;
	/* box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); */
}

#addProjectForm label {
	font-weight: bold;
}

#addProjectForm input[type="text"], #addProjectForm input[type="email"],
	#addProjectForm textarea {
	width: 100%;
	padding: 10px;
	margin: 5px 0;
	border: 1px solid #ccc;
	border-radius: 3px;
	box-sizing: border-box;
}

#addProjectForm input[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#addProjectForm input[type="submit"]:hover {
	background-color: #0056b3;
}

#addProjectForm textarea {
	resize: vertical;
}

/* Style for the tabular form */
</style>
</head>
<body
	style="background-image: url('<c:url value='/resources/person.jpg'/>'); background-size: cover;">


	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
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
