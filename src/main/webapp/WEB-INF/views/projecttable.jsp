<%@page import="employee.entities.Project"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<title>Project List</title>
<style>
@import
	url('https://fonts.googleapis.com/css2?family=Arvo&family=Bungee+Spice&family=Fira+Sans:ital@1&family=Imperial+Script&family=Ubuntu:wght@500&display=swap')
	;
	body, h1, h2, h3, p, ul, li {
	margin: 0;
	padding: 0;
}
h1{
    text-align: center;
    margin-bottom: 20px;
    margin-top: 20px;
    font-family: 'Bungee Spice', cursive;
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
	width: 90%;
	border-collapse: collapse;
	margin-top: 20px;
	margin-left: auto;
	margin-right: auto;
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
		<h1>EMPLOYEE
				TIME TRACKER</h1>
	</header>
	
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
						href="javascript:void(0);" onclick="confirmDeleteProject('<%= project.getProjectId() %>')">Delete</a><a
						href="<%= application.getContextPath() %>/openUpdateProjectPage/<%= project.getProjectId()%>">Update</a>

					</td>
				</tr>
				<!-- Table rows will be dynamically added here using JavaScript -->
				<%} %>
			</table>
		</div>
	</header>
	
	<div class="heading">
		<h3><a href="leadview" style="text-decoration: none;">Back to
				Dashboard</a></h3>
	</div>
	
	<script>
function confirmDeleteProject(projectId) {
    
        var confirmDelete = confirm("Are you sure you want to delete this Project?");
        if (confirmDelete) {
            window.location.href = "<%= application.getContextPath() %>/project/delete/"+projectId;
        }
    }

</script>
	
</body>
</html>