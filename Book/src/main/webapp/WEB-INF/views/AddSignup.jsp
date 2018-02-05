<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
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

.navbar-brand
{
	color: #FFF;
}
.navbar-nav > li > a {
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
</nav> 
<br>

<h1 class="jumbotron jumbotron-sm" style="margin: auto; text-align: center;">Sign up</h1>

<br>

	<form:form method="post" action="${pageContext.request.contextPath}/AddSignupToDB" modelAttribute="Signup" style="margin: auto; width: 80%; text-align: center;">

	<form:input path="name" type="text" class="form-control" placeholder="Name" />
	<form:errors path="name"/>
	<br>
	
	<form:input path="email" type="text" class="form-control" placeholder="Email" />
	<form:errors path="email"/>
	<br>
	
	<form:input path="password" type="password" class="form-control" placeholder="Password" />
	
	<br>
	
	<form:input path="contact_number" type="text" class="form-control" placeholder="Contact Number" />
	<form:errors path="contact_number"/>
	<br>
	
	<form:textarea path="address" class="form-control" placeholder="Address"/>

	<br>

	<input type="submit" class="btn btn-primary" value="Submit"/>
	
	
	</form:form>
	

</body>
</html>