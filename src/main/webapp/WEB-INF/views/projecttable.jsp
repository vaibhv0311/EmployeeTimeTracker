<%@page import="employee.entities.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<title>Project List</title>
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
/*------------for project table showing all employees----------*/

/* Style for the tabular form */
.viewProjectTable {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.viewProjectTable th, .viewProjectTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.viewProjectTable th {
	background-color: #17e9ec;
	font-weight: bold;
}

/* styling for the heading */
.heading {
	text-align: center;
	margin: 20px 0;
	font-size: 24px;
}
</style>


</head>
<body>

	<%
List<Project>viewProjects=(List<Project>)request.getAttribute("listOfProjects");

%>
	<header>
		<a href="index" style="text-decoration: none;"><h1>EMPLOYEE
				TIME TRACKER</h1></a>
	</header>
	<div class="heading">
		<a href="leadview" style="text-decoration: none;"><h4>Back to
				Dashboard</h4></a>
	</div>
	<header>
		<div class="viewTableStyle">
			<h1 class="heading">LIST OF PROJECTS</h1>
			<table id="viewProjectTable" class="viewProjectTable">
				<tr>
					<th>Project Id</th>
					<th>Project</th>
					<th>Description</th>
					<th>Lead</th>
					<th>Total Weeks</th>
					<th>Actions</th>
				</tr>

				<%
                int SerialNo=0;
                for(Project project:viewProjects){
                %>
				<tr>
					<td><%= project.getProjectId() %></td>
					<td><%= project.getProjectName() %></td>
					<td><%= project.getProjectDesc() %></td>
					<td><%= project.getLeadName() %></td>
					<td><%= project.getDuration() %></td>

					<td><a
						href="<%= application.getContextPath() %>/project/delete/<%= project.getProjectId() %>">Delete</a>
						<a
						href="<%= application.getContextPath() %>/openUpdateProjectPage/<%= project.getProjectId()%>">Update</a>

					</td>
				</tr>
				<!-- Table rows will be dynamically added here using JavaScript -->
				<%} %>
			</table>
		</div>
	</header>
</body>
</html>