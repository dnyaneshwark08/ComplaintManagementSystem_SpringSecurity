<%@page import="java.security.Principal"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<!-- <link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" /> -->
	
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<style>
* {box-sizing: border-box;}

body {
	/* background-color: powderblue; */
	font-family:sans-serif;
   background-size: cover;
	background-image: url("https://techstory.in/wp-content/uploads/2022/11/keyboard-g4c068f946_1920.jpg");
}

.topnav {
  overflow: hidden;
  background-color: #e9e9e9;
}

h1{
 text-align: center;

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
  margin-bottom: 5px;
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


/* The dropdown container */
.dropdown {
  float: left;
  overflow: hidden;
}

/* Dropdown button */
.dropdown .dropbtn {
  font-size: 16px;
  border: none;
  outline: none;
  color: black;
  padding: 14px 16px;
  background-color: inherit;
  font-family: inherit; /* Important for vertical align on mobile phones */
  margin: 0; /* Important for vertical align on mobile phones */
}

/* Add a red background color to navbar links on hover */
.navbar a:hover, .dropdown:hover .dropbtn {
   background-color: #ddd;
  color: black;
}

/* Dropdown content (hidden by default) */
.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

/* Links inside the dropdown */
.dropdown-content a {
 
 float: none;
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

/* Add a grey background color to dropdown links on hover */
.dropdown-content a:hover {
  background-color: #ddd;
}

/* Show the dropdown menu on hover */
.dropdown:hover .dropdown-content {
  display: block;
}


.container{

border: 1px solid white;
background: white;
opacity: 0.8;

}


</style>


</head>
<body>

<div class="topnav">
  <a href="/"> <em class="fa-sharp fa-solid fa-house"></em> HOME</a> 
  <a href="/logout">LOGOUT</a>
	<a href="custprofile">  <%=getName(request).toUpperCase()%></a>

  <div class="dropdown">
    <a href="custcomphistory">History</a>
    </div>
  
    
  </div>

  <h1 style="color: white; font-family: serif;">
		welcome to Complaint Registry
		<%=getName(request)%>
	</h1>
  

	<div class="container bootstrap snippet">
    <div class="row">
  		<div class="col-sm-10"></div>
    	<div class="col-sm-2"><a href="/users" class="pull-right"></a></div>
    </div>
    <div class="row">
  		<div class="col-sm-3"><!--left col-->
              

      <div class="text-center">
        
         	   </div><br>

               
       
          
        </div><!--/col-3-->
    	<div class="col-sm-9">
            <%-- <ul class="nav nav-tabs">
                <li class="active"><h1><a class="navbar-brand" href="custprofile"><%=getName(request).toUpperCase()%></a></h1></li>
               
              </ul>
 --%>
              
          <div class="tab-content">
            <div class="tab-pane active" id="home">
                <hr>
                  <form class="form" action="addcomplaints" method="post" id="complaintForm">
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label  for="exampleInputEmail1"  >Subjects:</label>  <select name="subject" id="subject">
    <option value="" selected="selected">Select subject</option>
  </select>
                          </div>
                      </div>
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                           <label for="exampleInputEmail1">Category:</label>  <select name="category" id="category">
    <option value="" selected="selected">Please select subject first</option>
  </select>
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                             <label for="exampleInputEmail1">SubCategory:</label>  <select name="subCategory" id="subCategory">
    <option value="" selected="selected">Please select category first</option>
  </select>
                          </div>
                      </div>
          
                      <div class="form-group">
                          
                          <div class="col-xs-6">
                              <label style="font-size: 15px" >Complaint Description</label> <br>
		
		
		<textarea rows="5" cols="45" required="required" id="description"
			name="description"></textarea>
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
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	<script>
		let registerComplaint = false;

		$('#complaintForm')
				.on(
						'submit',
						function(event) {
							event.preventDefault();
							console.log("submit button clicked")
							let un = {
								"category" : $("#category").val(),
								"subCategory" : $("#subCategory").val(),
								"description" : $("#description").val()
								
							}

							$
									.ajax({

										type : "POST",
										contentType : 'application/json; charset=utf-8',
										dataType : 'json',
										url : 'addcomplaint',
										data : JSON.stringify(un),
										success : function(result) {
											console.log(result)
											if (result.message = "success") {
												swal("Complaint Added Successfuly")
												.then((value)=>{
													location.reload()
												})
											}
										},
										error : function(xhr, status, error) {
											console.log(error)
										},
									});
						})
	</script>

<script>
var subjectObject = {
  "New Complaint": {"Order Related": ["order delay", "order status", "order not delivered but status is delivered", "cancel order"],
    "Product related": ["Defective Product", "Actual ordered Product Not Recieved"]   
  },
  "Previous Complaint": {
	  "Order Related": ["order delay", "order status", "order not delivered but status is delivered", "cancel order"],
	    "Product related": ["Defective Product", "Actual ordered Product Not Recieved"]
  }
}
window.onload = function() {
  var subjectSel = document.getElementById("subject");
  var categorySel = document.getElementById("category");
  var subcategorySel = document.getElementById("subCategory");
  for (var x in subjectObject) {
    subjectSel.options[subjectSel.options.length] = new Option(x, x);
  }
  subjectSel.onchange = function() {
    //empty Chapters- and Topics- dropdowns
    subcategorySel.length = 1;
    categorySel.length = 1;
    //display correct values
    for (var y in subjectObject[this.value]) {
      categorySel.options[categorySel.options.length] = new Option(y, y);
    }
  }
  categorySel.onchange = function() {
    //empty Chapters dropdown
    subcategorySel.length = 1;
    //display correct values
    var z = subjectObject[subjectSel.value][this.value];
    for (var i = 0; i < z.length; i++) {
      subcategorySel.options[subcategorySel.options.length] = new Option(z[i], z[i]);
    }
  }
}
</script>



	<%!private String getName(HttpServletRequest request) {
		Principal user = request.getUserPrincipal();
		String name = user.getName();
		return name;
	}%>

</body>
</html>

