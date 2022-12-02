<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

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

caption{
color: white;

}

</style>

</head>
<body>

	<div class="topnav">
		<a href="export">Export Data To Excel</a> 
		<a href="history">History</a>
		<a href="/logout">Logout</a>
		<div class="search-container">
			<form action="searchComplaint" method="POST" id="search-form">
				<input style="border-radius: 5px"  type="search" placeholder="Search.." name="name" id="input-search">
				<button style="border-radius: 4px" type="submit" id="search-complaint">submit</button>
			</form>
		</div>
	</div>

	<table border="1"
		style="background-color: powderblue; border: 1px solid #777; font-size: 15 px; border-radius: 5px; padding: 50px; max-width: 400px; margin: 25px auto; box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);">

		<caption>Pending Complaints</caption>

		<tr>
			<th>Complaint Id</th>
			<th>Description</th>
			<th>Complaint Date</th>
			<th>Comments</th>
			<th>Status</th>
			<th>CustomerId</th>
			<th>Update</th>
		</tr>
		<c:forEach var="all" items="${fetchAll}">
			<tr>
				<td>${all.getComplaintId()}</td>
				<td>${all.getDescription()}</td>
				<td>${all.getComplaintDate()}</td>
				<td>${all.support.comments}</td>
				<td>${all.support.status}</td>
				<td>${all.customer.getCustomerId()}</td>
				<td><a
					href="/admin/updateComplaint?complaintId=${all.getComplaintId()}">Edit</a></td>

			</tr>
		</c:forEach>
	</table>
	
	
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>
	<script>
		let getComplaintByCustName = false;

		$('#search-form')
				.on(
						'submit',
						function(event) {
							event.preventDefault();
							console.log("submit button clicked")
							let custName=$('#input-search').val();	
							console.log(custName)
			let searchval={
			"name":custName
			}
							$.ajax({

										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'compsearch',
										data : JSON.stringify(searchval),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
										 	 	 window.location
														.replace('http://localhost:8081/admin/serch')
											}
										},
										error : function(xhr, status, error) {
											console.log(error)
										},
									});
						})
	</script>

</body>
</html>