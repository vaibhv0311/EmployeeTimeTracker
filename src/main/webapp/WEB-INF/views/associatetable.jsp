<%@page import="java.util.List"%>
<%@page import="employee.entities.Employee"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<title>Associate List</title>
<style>
body, h1, h2, h3, p, ul, li {
	margin: 0;
	padding: 0;
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
/*------------for associate table showing all employees----------*/
/* Style for the tabular form */
.viewAssociateTable {
	width: 100%;
	border-collapse: collapse;
	margin-top: 20px;
}

.viewAssociateTable th, .viewAssociateTable td {
	border: 1px solid #ddd;
	padding: 8px;
	text-align: center;
}

.viewAssociateTable th {
	background-color: #17e9ec;
	font-weight: bold;
}

/* Additional styling for the heading */
.heading {
	text-align: center;
	margin: 20px 0;
	font-size: 24px;
}
</style>
</head>
<body>

	<%
	List<Employee> listOfEmployees = (List) request.getAttribute("listOfEmployees");
	%>

	<%
	response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
	response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
	%>
	<header>
		<h1>
			<a href="index" style="text-decoration: none;">EMPLOYEE TIME
				TRACKER</a>
		</h1>
	</header>
	<div class="heading">
		<h4>
			<a href="leadview" style="text-decoration: none;">Back to
				Dashboard</a>
		</h4>
	</div>
	<header>

		<div class="viewTableStyle">
			<h1 class="heading">LIST OF EMPLOYEES</h1>
			<table id="viewAssociateTable" class="viewAssociateTable">
				<tr>
					<th>Serial No.</th>
					<th>Name</th>
					<th>EmailID</th>
					<th>UserName</th>
					<th>Role</th>
					<th>Lead Contact</th>
					<th>Project Title</th>
					<th>Description</th>
					<th>Actions
					<th>
				</tr>
				<%
				int serialNo = 0;
				for (Employee employee : listOfEmployees) {
				%>
				<tr>
					<td><%=employee.getEmpId()%></td>
					<td><%=employee.getName()%></td>
					<td><%=employee.getId()%></td>
					<td><%=employee.getUserName()%></td>
					<td><%=employee.getRole()%></td>
					<td><%=employee.getLeadId()%></td>
					<td><%=employee.getProjectTitle()%></td>
					<td><%=employee.getDescription()%></td>
					<td><a
						href="<%=application.getContextPath()%>/associate/delete/<%=employee.getEmpId()%>">Delete</a>
						<a
						href="<%=application.getContextPath()%>/openUpdateEmployeePage/<%=employee.getEmpId()%>">Update</a>
					</td>


				</tr>
				<%
				}
				%>

				<!-- Table rows will be dynamically added here using JavaScript -->
			</table>
		</div>
	</header>
	<p>
		<%
		String message = (String) request.getAttribute("message");
		if (message != null) {
			out.print(message);
		}
		%>

	</p>
</body>
</html>