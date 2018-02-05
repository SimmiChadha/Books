<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>

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
<script>

var app = angular.module("myApp" , []).controller("myCtrl" , function($scope,$http){
	
	$scope.data = [];
	
	$http( {
				method: 'POST',
				url:'http://localhost:9001/Book/fetchCartItems',
				headers : {'Content-Type':'application/x-www-form-urlencoded'}
		}).then(function(response){
	    	console.log(response.data);
		    
	    	$scope.data = response.data;
	    	
		});
	
$scope.Delete=function(arg){
    	
    	alert(arg);
    	
    	var json={"id":arg};
    	
    	console.log( JSON.stringify(json) );
    	
    	$http(	{
			method: 'POST',
      		url: 'deletefromcart',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	//Fetch Again
		    	$http(	{
	    			method: 'POST',
		      		url: 'getAllCartItems',
		      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
	    			}).then(function(response){
				    	console.log(response.data);
				    
				    	$scope.data = response.data;
				    	
	    			});
			});
    }	
});


</script>

<body background="resources/bg.jpg" ng-app="myApp" ng-controller="myCtrl">
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

<h1 class="jumbotron jumbotron-sm" style="margin: auto; text-align: center;">View Cart</h1>
<br><br><br>
<table class="table table-striped" style="margin: auto; width: 80%; text-align: center;">
	<thead>
			<tr style="text-align: center;">
				<th>NAME</th>
				<th>PRICE</th>
				<th>QUANTITY</th>
				<th>SUB TOTAL</th>
				<th>IMAGE</th>
				<th>DELETE</th>
			</tr>
	</thead>
	<tbody>		
		<tr ng-repeat="x in data">
			<td>{{x.pname}}</td>
			<td>{{x.pprice}}</td>
			<td>{{x.pqty}}</td>
			<td><img src="{{x.pimg}}" style="height: 50px; width: 50px;"></td>
			<td><a href="#" class="btn btn-danger">Delete</a></td>

		</tr>
	</tbody>
</table>
<br><br><br>
<center>
<a href="${pageContext.request.contextPath}/ViewLibrary" class="btn btn-danger" style=" float:left; margin-left:50px; margin-top:45px">View All Library </a>

<a href="${flowExecutionUrl}&_eventId=goToPage2" class="btn btn-danger" style=" float:right; margin-right:50px; margin-top:45px">Confirm Billing Address</a></center>




</body>
</html>