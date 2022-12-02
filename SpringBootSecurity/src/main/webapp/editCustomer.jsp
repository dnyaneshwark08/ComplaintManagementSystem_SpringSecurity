<%@page import="java.security.Principal"%>
<%@page import="com.springboot.mv.security.entity.Customer"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


</head>
<body>

	<h1> <em class="fa fa-edit"></em> Update Information</h1>


	<%!private String getName(HttpServletRequest request) {
		Principal user = request.getUserPrincipal();
		String name = user.getName();
		return name;
	}%>



	<%
	String username = (String) session.getAttribute("session");

	Customer customer = (Customer) request.getAttribute("customer");
	%>




<hr>
<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"></div>
    	<div class="col-sm-2"><a href="/users" class="pull-right"></a></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        
         	   </div><br>

              
         
          
          
          <ul class="list-group">
            <li class="list-group-item text-muted">Details  <em class="fa fa-dashboard fa-1x"></em></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong><%=customer.getName()%></strong></span></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong><%=customer.getEmail()%></strong></span></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong><%=customer.getAddress()%></strong></span></li>
            <li class="list-group-item text-right"><span class="pull-left"><strong><%=customer.getRole()%></strong></span></li>
          </ul> 
               
       
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <ul class="nav nav-tabs">
                <li class="active"><h1><a class="navbar-brand" href="custprofile"><%=getName(request).toUpperCase()%></a></h1></li>
               
              </ul>

              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" action="editCustomer" method="post" id="updateCustomer">
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="name"><h4> Name</h4> (Update your name here) </label>
                              <input type="text" minlength="8" class="form-control" name="name" id="name" required="required" onkeyup="nameValidation()"  <%=customer.getName()%>> <span
								id="name_alert"></span>
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                            <label for="last_name"><h4>Email</h4> (Update your Email here)</label>
                              <input type="text" class="form-control" name="email" id="email" required="required" onkeyup="emailValidation()" placeholder="email" value= <%=customer.getEmail()%>> <span
								id="email-error"></span>
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="phone"><h4>Address</h4> (Update your address here)</label>
                              <input type="text" class="form-control" name="address" id="address" required="required" onkeyup="validate_address()" placeholder="Address" value=<%=customer.getAddress()%> > <span
								id="address_alert"></span>
                          </div>
                      </div>
          
                      <div class="form-group">
                          <div class="col-xs-6">
                             <label for="mobile"><h4>Role</h4></label>
                              <input type="text" class="form-control" name="roll" id="roll" placeholder="UserName" value=<%=customer.getRole()%> readonly="readonly" >
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label for="email"><h4>Customer Id</h4></label>
                              <input type="email" class="form-control" name="customerId" id="customerId" placeholder="you@email.com" value=<%=customer.getCustomerId()%> readonly="readonly" >
                          </div>
                      </div>
                      
                      <div class="form-group">
                           <div class="col-xs-12">
                                <br>
                              	<button class="btn btn-lg btn-success" type="submit" name="submit" id="submit"   <em class="glyphicon glyphicon-ok-sign"></em>> Save</button>
                               	<button class="btn btn-lg" type="reset"><em class="glyphicon glyphicon-repeat"></em> Reset</button>
                            </div>
                      </div>
              	</form>
            
              <hr>  
             </div><!--/tab-pane-->
            
             
               
              </div><!--/tab-pane-->
          </div><!--/tab-content-->

        </div><!--/col-9-->
    </div><!--/row-->


<script src="https://code.jquery.com/jquery-3.6.0.min.js"
		integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
		crossorigin="anonymous"></script>

<script>

	
	//Regex for email
	function checkEmail(email) {
			var regx = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
			return regx.test(email);
		}
	

	//Regex for full name
	
	function onlyLetters(Name) {
			var regx = /^[a-zA-Z][a-zA-Z ]*$/;
			return regx.test(Name);
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
	
	
	$('#updateCustomer').on('submit',function(event){
		event.preventDefault()
if(checkValidation()){
	$(this).unbind('submit').submit()
}
	
	})

	function checkValidation(){
		
		
		let hasErrors=true
		
		if(!nameValidation()){
			hasErrors=false;
		}
		
		if(!emailValidation()){
			hasErrors=false
		}	
		
		return hasErrors
	}
	
	

</script>


<script>
		$('#updateCustomer')
				.on('submit',function(event) {
							event.preventDefault();

							console.log($('#email').val())
							console.log($('#name').val())
							console.log($('#address').val())

							let formData = {
								"name" : $('#name').val(),
								"email" : $("#email").val(),
								"address" : $("#address").val(),
								"customerId":$('#customerId').val()
							}
							$.ajax({
										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'updateCustomer',
										data : JSON.stringify(formData),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
												swal("Updated Succesfully")
												window.location
														.replace('http://localhost:8081/customer/custprofile')
														
											}
										},
										error : function(xhr, status, error) {
											console.log("error == "+error)
											swal("Some of the input field has error")
										},
									})
						})
	</script>



</body>
</html>