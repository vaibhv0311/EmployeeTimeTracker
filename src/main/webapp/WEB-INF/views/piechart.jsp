<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your tasks for the day</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/canvasjs/1.7.0/canvasjs.min.js"></script>


</head>
<body>
<h1>Tasks Pie Chart</h1>
<% String taskDurationsJson = (String)request.getAttribute("taskDurationsJson"); %>
<div id="chartContainer" style="height: 300px; width: 100%;"></div>

<script>
var taskDurationsJson = <%= taskDurationsJson %>;
var pieChartData = taskDurationsJson.map(function(duration, index) {
    return {
        y: duration,
        label: "Task " + (index + 1) // Assign labels as needed
    };
});

// Create the CanvasJS chart
var chart = new CanvasJS.Chart("chartContainer", {
    animationEnabled: true,
    title: {
        text: "Task Durations"
    },
    data: [{
        type: "pie",
        showInLegend: true,
        legendText: "{label}",
        indexLabel: "{label}: {y}",
        dataPoints: pieChartData
    }]
});

// Render the chart
chart.render();
</script>


</body>
</html>