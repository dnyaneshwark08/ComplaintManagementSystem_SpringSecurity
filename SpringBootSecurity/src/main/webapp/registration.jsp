<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>register</title>

<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
<style>

body{
 background-size: cover;
	background-image: url("https://techstory.in/wp-content/uploads/2022/11/keyboard-g4c068f946_1920.jpg");
}


.note {
	text-align: center;
	height: 80px;
	background: -webkit-linear-gradient(left, #0072ff, #8811c5);
	color: #fff;
	font-weight: bold;
	line-height: 80px;
}

.form-content {
	padding: 5%;
	border: 1px solid #ced4da;
	margin-bottom: 2%;
}

.form-control {
	border-radius: 1.5rem;
	background-color: #EDD;
}

.btnSubmit {
	border: none;
	border-radius: 1.5rem;
	padding: 1%;
	width: 20%;
	cursor: pointer;
	background: #0062cc;
	color: #fff;
}

<
style>* {
	box-sizing: border-box;
}

body {
	margin: 0;
	font-family: Arial, Helvetica, sans-serif;
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





#formContent {

  -webkit-border-radius: 10px 10px 10px 10px;
  border-radius: 10px 10px 10px 10px;
  opacity:0.6;
  background: #E9EAFD;
  padding: 30px;
  width: 90%;
  max-width: 450px;
  position: relative;
  padding: 0px;
  -webkit-box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  box-shadow: 0 30px 60px 0 rgba(0,0,0,0.3);
  text-align: center;
}


.wrapper {
  display: flex;
  align-items: center;
  flex-direction: column; 
  justify-content: center;
  width: 100%;
  min-height: 100%;
  padding: 20px;
}



/* ANIMATIONS */

/* Simple CSS3 Fade-in-down Animation */
.fadeInDown {
  -webkit-animation-name: fadeInDown;
  animation-name: fadeInDown;
  -webkit-animation-duration: 1s;
  animation-duration: 1s;
  -webkit-animation-fill-mode: both;
  animation-fill-mode: both;
}

@-webkit-keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

@keyframes fadeInDown {
  0% {
    opacity: 0;
    -webkit-transform: translate3d(0, -100%, 0);
    transform: translate3d(0, -100%, 0);
  }
  100% {
    opacity: 1;
    -webkit-transform: none;
    transform: none;
  }
}

/* Simple CSS3 Fade-in Animation */
@-webkit-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@-moz-keyframes fadeIn { from { opacity:0; } to { opacity:1; } }
@keyframes fadeIn { from { opacity:0; } to { opacity:1; } }

.fadeIn {
  opacity:0;
  -webkit-animation:fadeIn ease-in 1;
  -moz-animation:fadeIn ease-in 1;
  animation:fadeIn ease-in 1;

  -webkit-animation-fill-mode:forwards;
  -moz-animation-fill-mode:forwards;
  animation-fill-mode:forwards;

  -webkit-animation-duration:1s;
  -moz-animation-duration:1s;
  animation-duration:1s;
}

.fadeIn.first {
  -webkit-animation-delay: 0.4s;
  -moz-animation-delay: 0.4s;
  animation-delay: 0.4s;
}

.fadeIn.second {
  -webkit-animation-delay: 0.6s;
  -moz-animation-delay: 0.6s;
  animation-delay: 0.6s;
}

.fadeIn.third {
  -webkit-animation-delay: 0.8s;
  -moz-animation-delay: 0.8s;
  animation-delay: 0.8s;
}

.fadeIn.fourth {
  -webkit-animation-delay: 1s;
  -moz-animation-delay: 1s;
  animation-delay: 1s;
}


</style>

</head>
<body>

	<div class="topnav">
		<a href="/">Home</a>
	</div>

<div class="wrapper fadeInDown">

	<div class="formContent" >
	
	<form class="container register-form" action="/register" method="post"
		id="regForm">
		<div class="form" id="form-container"> 
			<div class="note">
				<p>Welcome to Customer Registry</p>
				<h3 style="color: green;">${msg}</h3>
			</div>
			<div class="form-content">
				<div class="row">
					<div class="col-md-6">
						<div class="fadeIn first">
						<div class="form-group">
							<input type="text" class="form-control" id="username"
								placeholder="Your UserName *" name="userName"
								required="required" onkeyup="checkUserName()" /> 
								<span id="username-error"></span>
						</div>
						</div>
						<div class="fadeIn second">
						<div class="form-group">
							<input id="pass" type="password" minlength="8" class="form-control"
								required="required" placeholder="Password*" name="password" />
								<input type="checkbox" onclick="showPassword()">Show Password
						</div>
					</div>
					<div class="fadeIn third">
						<div class="form-group">
							<input id="confirm_pass" class="form-control form-control-lg"
								type="password" name="confirm_pass" required="required"
								placeholder="Confirm Password" onkeyup="confirmPassword()">
							<span id="wrong_pass_alert"></span> 
						</div>
						</div>
					</div>
					<div class="col-md-6">
					<div class="fadeIn first">
						<div class="form-group">
							<input type="email" class="form-control"
								placeholder="Your Email*" name="email" required="required"
								id="email" onkeyup="emailValidation()"> <span
								id="email-error"></span>
						</div>
						</div>
						<div class="fadeIn second">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Your Full Name*" name="name" minlength="8" required="required"
								id="name" onkeyup="nameValidation()"/> <span id="name_alert"></span>
						</div>
						</div>
						<div class="fadeIn third">
						<div class="form-group">
							<input type="text" class="form-control"
								placeholder="Your Address*" name="address" required="required"
								id="address" onkeyup="validate_address()"/> <span
								id="address_alert"></span>
						</div>
						</div>
						
						<div class="fadeIn fourth">
						<div class="form-group">
							<label style="color: white;">Role:- </label> <select name="role">
								<option value="CUSTOMER">CUSTOMER</option>
								<option value="ADMIN">ADMIN</option>
							</select>
						</div>
						</div>
						
					</div>
				</div>
				<div class="fadeIn fourth">
					<input class="btnSubmit" type="submit" id="reg-submit">
				</div>
			</div>
		</div>
	</form>

</div>

</div>


<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

	<script>

	
	//Regex for email
	function checkEmail(email) {
			var regx = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			return regx.test(email);
		}
	
	
	//Regex for username
	function checkRegexName(username){
	var re = /^[a-zA-Z0-9]*$/;
	return re.test(username);
    }
	

	//Regex for full name
	
	function onlyLetters(Name) {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			return regx.test(Name);
		}

	
	
	function checkUserName(){
		
		let username=$('#username').val()
		if(checkRegexName(username)){
			$('#username-error').css('color','green')
			$('#username-error').html('Valid')
			return true;
		}else{
			$('#username-error').css('color','red')
			$('#username-error').html('Invalid	')
			return false;
		}
	} 
	
function emailValidation(){
		
		let email=$('#email').val()
		if(checkEmail(email)){
			$('#email-error').css('color','green')
			$('#email-error').html('Valid')
			return true;
		}else{
			$('#email-error').css('color','red')
			$('#email-error').html('Invalid	Email Address')
			return false;
		}
	}
	
	
	function nameValidation(){
		let name=$('#name').val()
		if(onlyLetters(name)){
			$('#name_alert').css('color','green')
			$('#name_alert').html('Valid')
			return true;
		}else{
			$('#name_alert').css('color','red')
			$('#name_alert').html('Please enter only letters')
			return false;
		}
	}
	
	function validate_address(){
	    var regName =/^[a-zA-Z][a-zA-Z ]*$/;
		
	   let add =$('#address').val()
	    if(regName.test(add)){
	    	document.getElementById('address_alert').style.color = 'green';
			document.getElementById('address_alert').innerHTML = 'Valid';
			return true;

	    }else{
	    	document.getElementById('address_alert').style.color = 'red';
			document.getElementById('address_alert').innerHTML = 'Please enter address without number or less than 255 words';
	    	
			return false;
	    }
	
	}
	function confirmPassword(){
		
		
		let userpassword=$('#pass').val()
		let confirmpass=$('#confirm_pass').val()
		if(userpassword==confirmpass){
			$('#wrong_pass_alert').css('color','green')
			$('#wrong_pass_alert').html('Valid')
			return true;
		}else{
			$('#wrong_pass_alert').css('color','red')
			$('#wrong_pass_alert').html('Mismatch')
			return false;
		}
		
		
	}
	
	$('#regForm').on('submit',function(event){
		event.preventDefault()
		

if(checkValidation()){
	$(this).unbind('submit').submit()
}
	
	})

	function showPassword() {
		  var x = document.getElementById("pass");
		  if (x.type === "password") {
		    x.type = "text";
		  } else {
		    x.type = "password";
		  }
		}

	function checkValidation(){
		
		
		let hasErrors=true
		
		if(!checkUserName()){
			hasErrors=false
		}
		if(!emailValidation()){
			hasErrors=false
		}
		if(!nameValidation()){
			hasErrors=false;
		}
		if(!confirmPassword()){
			hasErrors=false;	
		}
			
		
		return hasErrors
	}
	
	

</script>



</body>
</html>