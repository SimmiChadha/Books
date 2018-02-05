<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
.navbar-brand
{
	color: #FFF;
}
.navbar-nav > li > a {
    color: #FFF;
}
.text-danger
{
	font-family:Trebuchet MS;
	color:#483D8B;
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



<!-- ==================================Carousel coding============================== -->
<div class="container">
    
  <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:550px; margin: 0 auto">
    <!-- Indicators -->
    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <!-- Wrapper for slides -->
    <div class="carousel-inner">
      <div class="item active">
        <!-- <img src="C:\Users\hp\Desktop\BookI.jpg" alt="Book1" style="width:100%;"> -->
        <img src="resources/BookI.jpg" alt="Book1" style="width:100%;">
      </div>

      <div class="item">
       <!-- <img src="C:\Users\hp\Desktop\BookII.jpg" alt="Book2" style="width:100%;">-->
        <img src="resources/BookII.jpg" alt="Book2" style="width:100%;">
      </div>
    
      <div class="item">
       <!--  <img src="C:\Users\hp\Desktop\BookIII.jpg" alt="Book3" style="width:100%;"> -->
        <img src="resources/BookIII.jpg" alt="Book3" style="width:100%;">
      </div>
    </div>

    <!-- Left and right controls -->
    <a class="left carousel-control" href="#myCarousel" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right"></span>
      <span class="sr-only">Next</span>
    </a>
  </div>
</div>
<br><br><br>
<center><h2 class="text-danger"><b>BOOKS AVAILABLE:</b></h2></center><br><br><br>

<div class="mar">
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <img src="resources/engineering-books.png" class="img-responsive" alt="Engineering Books" width="250" height="200"> </div>
    <div class="col-sm-4">
    <img src="resources/llb.jpg" class="img-responsive" alt="LLB Books" width="250" height="200" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/Med1.jpg" class="img-responsive" alt="Medical Books" width="250" height="200"></div>
  </div>
</div>

<br><br>
<div class="container-fluid">
  <div class="row">
    <div class="col-sm-4">
    <img src="resources/BBA.jpg" class="img-responsive" alt="BBA Books" width="250" height="20" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/BCA.jpg" class="img-responsive" alt="BCA Books" width="250" height="400" align="center"> </div>
    <div class="col-sm-4">
    <img src="resources/Chem.jpg" class="img-responsive" alt="Chemistry Books" width="250" height="200"></div>
  </div>
</div>
<br><br>

</body>
</html>