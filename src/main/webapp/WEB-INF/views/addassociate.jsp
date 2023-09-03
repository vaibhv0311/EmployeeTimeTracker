<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add new Employee</title>
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<style>
<
style
>
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

#addTraineeForm button[type="submit"] {
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

	<header>
		<a href="index" style="text-decoration: none;"><h1>EMPLOYEE
				TIME TRACKER</h1></a>
	</header>
	<div class="heading">
		<a href="leadview" style="text-decoration: none;"><h4>Back to
				Dashboard</h4></a>
	</div>
	<div id="addTraineeForm">
		<form id="addtraineeform" action="addassociateform" method="post">
			<label for="name">Name:</label> <input type="text" id="name"
				name="name" required placeholder="Enter full name"><br>
			<br> <label for="id">Email ID:</label> <input type="text"
				id="id" name="id" required placeholder="Email here"><br>
			<br> <label for="username">Username:</label> <input type="text"
				id="username" name="username" required
				placeholder="Enter unique name"><br>
			<br> <label for="createPassword">Create Password (8-12
				digits):</label> <input type="password" id="createPassword"
				name="createPassword" required placeholder="Password here"><br>
			<br> <label for="reEnterPassword">Re-enter Password:</label> <input
				type="password" id="reEnterPassword" name="reEnterPassword" required
				placeholder="Password here"><br>
			<br>
			<% String error= (String)request.getAttribute("error");
				 if(error!=null){
				  out.print(error+"<br> ");}%>

			<label for="leadid">Lead Email:</label> <input type="text"
				id="leadid" name="leadid" required placeholder="Lead Email here"><br>
			<br> <label for="role">Role:</label> <input type="text"
				id="role" name="role" required placeholder="Enter role here"><br>
			<br> <label for="projectTitle">Project Title:</label> <input
				type="text" id="projectTitle" name="projectTitle" required><br>
			<br> <label for="description">Description:</label><br>
			<textarea id="description" name="description" rows="4" cols="50"
				required placeholder="Add a description"></textarea>
			<br>
			<br>

			<button type="submit">Add Trainee</button>

			<% String success = (String)request.getAttribute("success");
               if(success!=null){
            	   out.print("<br>"+success);
               }
                %>
		</form>

	</div>
</body>
</html>