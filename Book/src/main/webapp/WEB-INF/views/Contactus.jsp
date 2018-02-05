<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Contact us</title>
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
.jumbotron-sm 
{ 
	padding-top: 24px;
	padding-bottom: 24px; 
}
.jumbotron small 
{
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
            <div class="col-sm-12 col-lg-12"> 
      
           	
               
                    
                <h1>
                    Contact us</h1>
                    
            </div>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
       
         <!--    <div class="well well-sm"> -->
                <form>
              
                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Name</label>
                            <input type="text" class="form-control" id="name" placeholder="Enter name"  required = "required"/>
                        </div>
                       
                       <div class="form-group">
					    	<label>Email Address</label>
					    	<input type="email" class="form-control" placeholder=" Enter Email id">
					  	</div>
                        <div class="form-group">
                            <label for="subject">
                                Subject</label>
                            <select id="subject" name="subject" class="form-control" >
                                <option value="na" selected="">Choose One:</option> 
                                <option value="service">General Customer Service</option>
                                <option value="suggestions">Suggestions</option>
                                <option value="product">Product Support</option>
                            </select>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                            <label for="name">
                                Message</label>
                            <textarea name="message" id="message" class="form-control" rows="9" cols="25" 
                                placeholder="Message" required = "required"></textarea>
                        </div>
                    </div>
                    <div>
                        <button type="submit" class="btn btn-primary pull-right" >
                            Send Message</button>
                    </div>
                </div>
                
                </form>
            </div>
        </div>
       
    </div>
</div>
                    


</body>
</html>