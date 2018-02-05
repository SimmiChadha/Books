<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>View One Library</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
<h1 class="jumbotron jumbotron-sm" style="margin: auto; text-align: center;">View One Library</h1>
<br>
	<br>
	
	<table class="table table-striped" style="margin: auto; width: 80%; text-align: center;">

	<thead>
	
		<tr style="text-align: center;">
			<th>NAME</th>
			<th>AUTHOR NAME</th>
			<th>PRICE</th>
			<th>QUANTITY</th>
			<th>IMAGE</th>
			
			
			
		</tr>
	
	</thead>

	<tbody>
		
		<tr>
			
			<td>${Library.getName()}</td>
			<td>${Library.getAuthor_name()}</td>
			<td>${Library.getPrice()}</td>
			<td>${Library.getQty()}</td>
			<td><img src="${Library.getImagePath()}" style="height: 50px; width: 50px;"></td>
		</tr>
	</tbody>
</table>
<br><br>

<form action="${pageContext.request.contextPath}/AddCartToDB" method="post">
	
		<input type="hidden" value="${Library.getId()}" name="id">
		<br>
		<br>
		<input type="number" placeholder="Quantity" class="form-control" name="qty" style="margin: auto;  width: 10%; text-align: center;">
		<br>    
    	<button type="submit" class="btn btn-danger" style=" float:left; margin-left:50px; margin-top:23px">Add To Cart</button>	
	
	</form>



</body>
</html>