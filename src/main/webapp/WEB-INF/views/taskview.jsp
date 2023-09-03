<%@page import="employee.entities.Task"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="icon"
	href="https://cdn-icons-png.flaticon.com/512/3063/3063792.png">
<title>View Tasks</title>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/canvasjs/1.7.0/canvasjs.min.js"></script>
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
</style>
</head>
<body>
	<h1>EMPLOYEE TIME TRACKER</h1>
	<div class="container">
		<a href="associateview" style="text-decoration: none;"><h3>Back
				to dashboard</h3></a>

	</div>

	<%
	List<Task> viewTasks = (List) request.getAttribute("getAllTasks");
	Task task1;
	%>



	<h2>MY Tasks</h2>

	<div id="projects-list" class="projects-list">
		<table id="tasktable">
			<thead>
				<tr>
					<th>ID</th>
					<th>Username</th>
					<th>Task Name</th>
					<th>Description</th>
					<th>Date</th>
					<th>Start time</th>
					<th>End time</th>
					<th>Status</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody id="projects-table-body">
				<tr>

					<%
					if (viewTasks != null) {
						int serialNo = 1;
						for (Task task : viewTasks) {
					%>
				
				<tr>
					<td><%=serialNo%></td>
					<td><%=task.getUsername()%></td>
					<td><%=task.getTaskName()%></td>
					<td><%=task.getDesc()%></td>
					<td><%=task.getDate()%></td>
					<td><%=task.getStartTime()%></td>
					<td><%=task.getEndTime()%></td>
					<td><%=task.getStatus()%></td>
					<td><a
						href="<%=application.getContextPath()%>/task/delete/<%=task.getTaskId()%>">Delete</a>
						<a
						href="<%=application.getContextPath()%>/openUpdateTaskPage/<%=task.getTaskId()%>">Update</a>
					</td>
				</tr>
				<%
				serialNo++;
				}
				}
				if (viewTasks.isEmpty()) {
				%>
				<td colspan="7" class="no-projects-message">
					<%
					out.print("Have a cup of coffee and enjoy no projects for you right now.");
					%>

					<i class="fa fa-coffee" style="font-size: 36px;"></i>
				</td>
				<%
				}
				%>
				</tr>
			</tbody>
		</table>
		<p>

			<%
			String message = (String) request.getAttribute("message");
			if (message != null) {
				out.print(message);
			}
			%>
		</p>
	</div>
	<h1>Tasks Pie Chart</h1>
	<%
	String taskDurationsJson = (String) request.getAttribute("taskDurationsJson");
	%>
	<div id="chartContainer" style="height: 300px; width: 100%;"></div>

	<script>
		var taskDurationsJson =
	<%=taskDurationsJson%>
		;
		var pieChartData = taskDurationsJson.map(function(duration, index) {
			return {
				y : duration,
				label : "Task " + (index + 1) // Assign labels as needed
			};
		});

		// Create the CanvasJS chart
		var chart = new CanvasJS.Chart("chartContainer", {
			animationEnabled : true,
			title : {
				text : "Task Durations"
			},
			data : [ {
				type : "pie",
				showInLegend : true,
				legendText : "{label}",
				indexLabel : "{label}: {y}",
				dataPoints : pieChartData
			} ]
		});

		// Render the chart
		chart.render();
	</script>


</body>
</html>