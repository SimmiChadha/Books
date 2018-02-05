<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>About us</title>
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
<div class="jumbotron jumbotron-sm">
    <div class="container">
        <div class="row">
            <div class="col-sm-12 col-lg-12" >
            <h1>
                    About Our Blog
            </h1>
            </div>
            </div>
           
    </div>
</div>
<div>
<fieldset>
 <h4 style="margin:auto; width:70%; font-size: 15px; line-height: 150%">
We love to read and discovered that we could share our hundreds of books with others by selling them online.
 Our goal is to give a second life to our books by getting them in the hands of readers across the globe.
 We’re breaking new ground in online bookselling. We believe that education and access to books are basic human rights. 
 That's why books sold on this BookStore help fund high-impact literacy projects around the world. 
 Every book purchased from Better World Books contributes to individual literacy throughout the world and the potential for a better life. 
 Clearly, we can’t do this work without our customers. That's why we’re so passionate about trying to offer the best price, selection, 
 customer service, and overall shopping experience.

Thanks for joining us in our mission to create a better world, one book at a time.

 </h4>
       
</fieldset>
</div>


</body>
</html>