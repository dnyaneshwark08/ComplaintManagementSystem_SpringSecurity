<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>history</title>
<style>
<
style>* {
	box-sizing: border-box;
}

body {
	font-family:sans-serif;
   background-size: cover;
	background-image: url("https://techstory.in/wp-content/uploads/2022/11/keyboard-g4c068f946_1920.jpg");

}

.topnav {
	overflow: hidden;
	background-color: #e9e9e9;
}

.topnav a {
	float: left;
	display: block;
	color: black;
	text-align: center;
	padding: 14px 16px;
	text-decoration: none;
	font-size: 17px;
}

.topnav a:hover {
	background-color: #ddd;
	color: black;
}

.topnav a.active {
	background-color: #2196F3;
	color: white;
}

.topnav .search-container {
	float: right;
}

.topnav input[type=text] {
	padding: 6px;
	margin-top: 8px;
	font-size: 17px;
	border: none;
}

.topnav .search-container button {
	float: right;
	padding: 6px 10px;
	margin-top: 8px;
	margin-right: 16px;
	background: #ddd;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

.topnav .search-container button:hover {
	background: #ccc;
}

@media screen and (max-width: 600px) {
	.topnav .search-container {
		float: none;
	}
	.topnav a, .topnav input[type=text], .topnav .search-container button {
		float: none;
		display: block;
		text-align: left;
		width: 100%;
		margin: 0;
		padding: 14px;
	}
	.topnav input[type=text] {
		border: 1px solid #ccc;
	}
}


</style>
</head>
<body>
<div class="topnav">
		<a href="admindashboard">Back to dashboard</a> 
		<a href="export">Export Data To Excel</a> 
		<a href="/logout">Logout</a>
		</div>

<table border="1" style=" align-content:center;  background-color: powderblue; border: 1px solid #777; font-size: 15	px; border-radius: 5px; padding: 50px; max-width: 400px; margin: 25px auto; box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);">
		
		<caption style="color: white;">Complaint History of Customers</caption>
		
		<tr>
			<th>Complaint Id</th>
			<th>Description</th>
			<th>Complaint Date</th>
			<th>Comments</th>
			<th>Status</th>
			<th>CustomerId</th>
		</tr>
		<c:forEach var="all" items="${complanits}">
			<tr>
				<td>${all.getComplaintId()}</td>
				<td>${all.getDescription()}</td>
				<td>${all.getComplaintDate()}</td>
				<td>${all.support.comments}</td>
				<td>${all.support.status}</td>
				<td>${all.customer.getCustomerId()}</td>

			</tr>
		</c:forEach>
	</table>


</body>
</html>