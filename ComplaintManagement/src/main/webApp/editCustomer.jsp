<%@page import="com.manage.entity.Customer"%>
<%@page import="com.manage.entity.Complaint"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">

<style type="text/css">
body {
	background-size: cover;
	background-image: url("http://localhost:8081/complaint-handling.jpg");
	background-attachment: fixed;
	font-family: Verdana, Arial, Helvetica, sans-serif;
	font-size: 14px;
}

#editForm {
	background-color: #a6a6a6;
	border: 1px solid #777;
	font-size: 20px;
	border-radius: 5px;
	padding: 20px;
	max-width: 400px;
	margin: 30px auto;
	box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);
}
</style>
<meta charset="ISO-8859-1">
<title>Edit</title>
</head>
<body>
	<%
		Customer customer = (Customer) request.getAttribute("customer");
	%>
	<%
		String username = (String) session.getAttribute("session");
	%>


	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand active" href=""><%=username.toUpperCase()%></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
			<div class="navbar-nav">
				<a class="nav-item nav-link active" href="customerProfile">Profile</a>
				<a class="nav-item nav-link " href="complaint">Dashboard</a> <a
					class="nav-item nav-link" href="history">History</a>
			</div>
		</div>
	</nav>
	
	<div style="text-align: center;">
		<h1>Update Details</h1>


		<form id="editForm" action="dashboard" method="post" id="editCustomer">
			<div class="row">
				<label for="exampleInputEmail1">Customer Id </label> <input
					type="text" class="form-control" name="customerId" id="customerId"
					value=<%=customer.getCustomerId()%> readonly="readonly">
			</div>
			<div class="row">
				<label for="exampleInputEmail1">Full Name</label><span
					style="color: red; font-weight: bold">*</span> <input type="text"
					id="name" class="form-control" name="username"
					onkeyup="validate_name()" required="required" /> <span
					id="name_alert"></span><br>
			</div>
			<div class="row">
				<label for="exampleInputEmail1">Email </label> <input
					class="form-control" name="email" id="email"
					value=<%=customer.getEmail()%> readonly="readonly">
			</div>
			<div class="row">
				<label for="exampleInputEmail1">Contact</label><span
					style="color: red; font-weight: bold">*</span> <input type="text"
					class="form-control" name="contact" id="contact" maxlength="10"
					onkeyup="validate_contact()" required="required" /><span
					id="contact_alert"></span><br>
			</div>
			<div class="row">
				<label for="exampleInputEmail1">Address</label> <input type="text"
					placeholder="Address" class="form-control form-control-lg"
					name="address" id="address" onkeyup="validate_address()"
					required="required" /><span id="name_address"></span> <br>
			</div>
			<br> <br> <input class="form-control btn-outline-primary"
				type="submit" value="Update Complaint">


		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script>
		$('#editForm')
				.on(
						'submit',
						function(event) {
							event.preventDefault();

							console.log($('#customerId').val())
							console.log($('#username').val())
							console.log($('#contact').val())
							console.log($('#address').val())

							let formData = {
								"customerId" : $('#customerId').val(),
								"username" : $("#username").val(),
								"contact" : $("#contact").val(),
								"address" : $("#address").val()
							}
							$
									.ajax({
										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'updateCustomer',
										data : JSON.stringify(formData),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
												window.location
														.replace('http://localhost:8081/customer/customerProfile')
											}
										},
										error : function(xhr, status, error) {
											console.log(error)
										},
									})
						})
	</script>
	<form style='text-align: center;' action="/logout" method="post">
		<input class="btn btn-danger mb-2" id="btn" type="submit"
			value="Logout" />
	</form>

	<script>
		function validate_name() {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			let name = $('#name').val()
			if (regx.test(name)) {

				return true;
			} else {
				$('#name_alert').css('color', 'red')
				$('#name_alert').html('Please enter only letters')
				return false;
			}
		}

		function validate_contact() {
			var regx = /^[0-9]{10}$/;
			var contact = document.getElementById('contact').value;
			if (!(regx.test(contact))) {
				document.getElementById('contact_alert').style.color = 'red';
				document.getElementById('contact_alert').innerHTML = 'Please Enter 10 Digit Number';
				return false;
			}
			document.getElementById('contact_alert').innerHTML = '';
			return true;
		}

		function validate_address() {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			let address = $('#address').val()
			if (regx.test(address)) {
				return true;
			} else {
				$('#name_address').css('color', 'red')
				$('#name_address').html('Please enter only letters')
				return false;
			}
		}

		$('#validate').on('submit', function(event) {
			event.preventDefault()

			if (checkValidation()) {

				$(this).unbind('submit').submit()
			}

		})

		function checkValidation() {

			let hasErrors = true

			if (!validate_name()) {
				hasErrors = false
			}
			if (!validate_email()) {
				hasErrors = false
			}
			if (!validate_contact()) {
				hasErrors = false;
			}
			if (!validate_password()) {
				hasErrors = false;
			}

			return hasErrors

		}
	</script>
</body>
</html>
