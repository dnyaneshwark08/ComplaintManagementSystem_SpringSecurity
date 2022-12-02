<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<table border="1"
		style="background-color: powderblue; border: 1px solid #777; font-size: 15 px; border-radius: 5px; padding: 50px; max-width: 400px; margin: 25px auto; box-shadow: 2px 5px 10px rgba(0, 0, 0, 0.5);">

		<caption>Complaint History of Customers</caption>

		<tr>
			<th>Complaint Id</th>
			<th>Description</th>
			<th>Comments</th>
			<th>Status</th>
			<th>CustomerId</th>
			
		</tr>
		<c:forEach var="all" items="${complaintsddd}">
			<tr>
				<td>${all.getComplaintId()}</td>
				<td>${all.getDescription()}</td>
				<td>${all.support.comments}</td>
				<td>${all.support.status}</td>
				<td>${all.customer.getCustomerId()}</td>
			

			</tr>
		</c:forEach>
	</table>


</body>
</html>