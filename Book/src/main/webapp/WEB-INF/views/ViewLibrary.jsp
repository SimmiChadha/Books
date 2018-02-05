<%@page import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View Library</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script type="text/javascript">
	
	$(document).ready(function() {
		
		$('#checkBoxAll').click(function() {
			
			if($(this).is(":checked"))
				$('.chkCheckBoxId').prop('checked', true);
			else
				$('.chkCheckBoxId').prop('checked', false);
		});
	});

</script>
<style>
.navbar-brand
{
	color: #FFF;
}
.navbar-nav > li > a {
    color: #FFF;
}
.jumbotron 
{
	background: #FFC300;
	color: #FFF;
	border-radius: 0px;
}

.jumbotron-sm { padding-top: 24px;
padding-bottom: 24px; }
.jumbotron small {
color: #FFF;
}

</style>

</head>
<body background="resources/bg.jpg">
<!-- =========================Nvabar coding=================================== -->
<nav class="navbar navbar-light" style="background-color: #154360;"> 
  <div class="container-fluid" style="color: #FFF;">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">Bookstore</a>
    </div>
    
    <ul class="nav navbar-nav">
      <li class="active"><a href="http://localhost:9001/Book/">Home</a></li>
      <li><a href="http://localhost:9001/Book/Contactus">Contact us</a></li>
      <li><a href="http://localhost:9001/Book/Aboutus">About</a></li>
       <li><a href="http://localhost:9001/Book/ViewLibrary">Library</a></li>
      <li><a href="http://localhost:9001/Book/ViewCategory">Category</a></li>
      <li><a href="http://localhost:9001/Book/cart?execution=e2s1">Cart</a></li>
     
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="http://localhost:9001/Book/AddSignup"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="http://localhost:9001/Book/Login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </ul>
  </div>
</nav> <br>

<h1 class="jumbotron jumbotron-sm" style="margin: auto; text-align: center;">View Library</h1>

<br>
<form method="post" action="${pageContext.request.contextPath}/DeleteLibrary">
			<%
			Authentication auth1 = SecurityContextHolder.getContext().getAuthentication();
		    if (auth1 != null && !auth1.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_ADMIN") || request.isUserInRole("ROLE_SUPPLIER") ){
		    		%>
		    <input type="submit" class="btn btn-danger" value="Delete" onclick="return confirm('Are you sure you want to delete this library?');" style="margin-left: 135px;">		
		    		<%
		    	}
		    }
		    %>
	<br><br>
	


<table class="table table-striped" style="margin: auto; width: 80%; text-align: center;">

	<thead>
	
		<tr style="text-align: center;">
			<th><input type="checkbox" id="checkBoxAll"></th> 
			<th>NAME</th>
			<th>AUTHOR NAME</th>
			<th>PRICE</th>
			<th>QUANTITY</th>
			<th>IMAGE</th>
			<th>UPDATE</th>
			<th>DELETE</th>
		</tr>
	
	</thead>

	<tbody>
			
		<c:forEach items="${AllLibrary}" var="x">
		
		<tr class="tb">
			<td><input type="checkbox" class="chkCheckBoxId" name="delete" value="${x.getId()}"></td>
			<td>${x.getName()}</td>
			<td>${x.getAuthor_name()}</td>
			<td>${x.getPrice()}</td>
			<td>${x.getQty()}</td>
			<td><img src="${x.getImagePath()}" style="height: 50px; width: 50px;"></td>
			<td><a href="UpdateLibrary/${x.getId()}" class="btn btn-danger">Update</a></td>
			<td><a href="DeleteLibraryFromDB/${x.getId()}" class="btn btn-danger">Delete</a></td>
			
			<td class="tb"><a href="ViewOneLibrary/${x.getId()}" class="btn btn-danger">View</a></td>
			<%
			Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		    if (auth != null && !auth.getName().equals("anonymousUser"))
		    {    
			if(request.isUserInRole("ROLE_ADMIN")  || request.isUserInRole("ROLE_SUPPLIER") ){
		    		%>
		    		<td><a href="${pageContext.request.contextPath}/UpdateOneLibrary/${x.getId()}" class="btn btn-success">Update</a></td>
			        <td><a href="${pageContext.request.contextPath}/DeleteOneLibrary/${x.getId()}" class="btn btn-danger" onclick="return confirm('Are you sure you want to delete this Library?');">Delete</a></td>
		    		<%
		    	}
		    }
			%>
		</tr>
		
		
		
		</c:forEach>		
			
		
			
	</tbody>

</table>
</form>

</body>
</html>