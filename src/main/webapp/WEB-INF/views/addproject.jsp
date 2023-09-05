<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<title>Add new Project</title>
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
a {
	text-decoration: none;
	width: 200px;
	background-color: dodgerBlue;
	color: white;
	padding: 5px;
	border-radius: 5px;
	margin-left: 10px;
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

#addProjectForm button[type="submit"] {
	background-color: #007bff;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 3px;
	cursor: pointer;
}

#addProjectForm button[type="submit"]:hover {
	background-color: #0056b3;
}

#addProjectForm textarea {
	resize: vertical;
}

/* Style for the tabular form */
</style>

</head>
<body>

	<header>
		<h1>EMPLOYEE
				TIME TRACKER</h1>
	</header>
	<div class="heading">
		<h4><a href="leadview" style="text-decoration: none;">Back to
				Dashboard</a></h4>
	</div>
	<div id="addProjectForm">
		<form id="addprojectform" action="addproject" method="post">
			<label for="pname">Project Name:</label> <input type="text"
				id="pname" name="pname" required><br>
			<br> <label for="pdescription">Project Description:</label>
			<textarea id="pdescription" name="pdescription" rows="4" cols="50"
				required></textarea>
			<br>
			<br> <label for="lname">Team Lead</label> <input type="text"
				id="lname" name="lname" required
				placeholder="Enter Project Lead's email"><br>
			<br> <label for="sdate">Total Weeks </label> <input type="text"
				id="sdate" name="sdate" required placeholder="Duration in weeks">
			<br>
			<br>

			<button type="submit">Add Project</button>
		</form>
	</div>


</body>
</html>