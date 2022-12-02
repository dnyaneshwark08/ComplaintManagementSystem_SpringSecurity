<%@page import="com.springboot.mv.security.entity.Complaint"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">

body{
font-family:sans-serif;
   background-size: cover;
	background-image: url("https://techstory.in/wp-content/uploads/2022/11/keyboard-g4c068f946_1920.jpg");
}

h1{
color: white;
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
<%
Complaint complaint = (Complaint) request.getAttribute("complaint");
%>
<body>
<div class="topnav">
		<a  href="admindashboard">Back To DashBoard</a> 
		
		<a href="/logout">Logout</a>
		<div class="search-container">
			<form action="searchComplaint" method="POST" id="search-form">
				<input style="border-radius: 5px"  type="search" placeholder="Search.." name="name" id="input-search">
				<button style="border-radius: 4px" type="submit" id="search-complaint">submit</button>
			</form>
		</div>
	</div>
	<h1> Update Complaint </h1>
	
	
	
<body>
	<div style="text-align: center;">

		<form
			style="background-color: powderblue; border: 1px solid #777; font-size: 20px; border-radius: 5px; padding: 20px; max-width: 400px; margin: 30px auto; box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);"
			action="UpdateComplaint" method="post" id="updateform">

			customerId <input name="customerid" id="customerid"
				value=<%=complaint.getCustomer().getCustomerId()%>
				readonly="readonly"> 
				<br>
				<br>
				ComplaintId <input name="complaintId"
				id="complaintId" type="text" placeholder="complaintId"
				value=<%=complaint.getComplaintId()%> readonly="readonly"> 
				<br>
				<br> 
				Description <input name="Description" type="text"
				placeholder="Description" value=<%=complaint.getDescription()%>
				readonly="readonly"> 
				<br> 
				<br> 
				Status <select required="required"
				name="status" id="status">
				<option value="INPROCESS">In Process</option>
				<option value="SUCCESS">Success</option>
			</select> 
			<br> 
			<br> 
			Comments <input required="required" name="comments" id="comment"
				type="text" placeholder="Comments"> 
				<br> 
				<br> 
				<br>
				<br> 
				<input type="submit" value="Update Complaint">
		</form>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script>
		$('#updateform')
				.on(
						'submit',
						function(event) {
							event.preventDefault();

							console.log($('#complaintId').val())

							let formData = {
								"complaintId" : $('#complaintId').val(),
								"status" : $('#status').val(),
								"comments" : $('#comment').val(),
								"customerId" : $('#customerid').val()
							}

							$.ajax({
										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'updateform',
										data : JSON.stringify(formData),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
												window.location
														.replace('http://localhost:8081/admin/admindashboard')
											}

										},
										error : function(xhr, status, error) {
											console.log(error)

										},
									})

						})
	</script>

</body>

</body>
</html>