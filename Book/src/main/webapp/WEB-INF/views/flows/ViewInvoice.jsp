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

var app = angular.module("myApp", []).controller("myCtrl", function($scope,$http) {
    
$scope.data = [];
    
    $scope.total = 0;
    
    $http(	{
    			method: 'POST',
	      		url: 'http://localhost:9001/Book/fetchCartItems',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	$scope.data = response.data;
			    	
			    	for( var x = 0; x < $scope.data.length ; x++ )
			    	{
			    		$scope.total += $scope.data[x].price *  $scope.data[x].pqty;
			    	}
			    	
    			});
    
    $scope.Delete=function(arg){
    	
    	alert(arg);
    	
    	var json={"id":arg};
    	
    	console.log( JSON.stringify(json) );
    	
    	$http(	{
			method: 'POST',
      		url: 'http://localhost:9001/Book/deletefromcart',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	//Fetch Again
		    	$http(	{
	    			method: 'POST',
		      		url: 'http://localhost:9001/Book/fetchCartItems',
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
<h1 class="jumbotron jumbotron-sm" style="margin: auto; text-align: center;">Invoice</h1><br><br><br>
<table class="table table-striped " style="margin: auto; width: 80%;">
	<thead>
		<tr>
			<th></th>
			<th></th>
			<th>Price</th>
			<th>Quantity</th>
			<th>Sub Total</th>		
		</tr>
	</thead>
	
	<tbody>
		<tr ng-repeat="x in data">
			
			<td><img src="{{x.pimg}}" style="width:100px; height:100px; border: 1px solid black; box-shadow: 8px 8px 6px grey;" class="img-responsive indexcatimage"></td>
			<td>{{x.pname}}</td>			
			<td>&#8377; {{x.pprice}}</td>
			<td>{{x.pqty}}</td>
			<td>&#8377; {{x.pprice*x.pqty}}</td>
			
			
		<!-- 	<td>${x.getName()}</td>			
			<td>&#8377; {{x.price}}</td>
			<td>{{x.qty}}</td>
			<td>&#8377; {{x.price*x.qty}}</td>  -->
			
		</tr>
			<td></td>
			<td></td>
			<td></td>
			<td><span style="font-weight:bold;">Grand Total:-</span></td>
			<td><span style="font-weight:bold;">&#8377; {{total}}</span></td>
		<tr>	
		</tr>
	</tbody>
</table>
<br>
<br>

<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>Shipping Address:</h3></div>
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>Billing Address:</h3></div>
</div>

<div class="row">
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>{{data[0].SAdd}}</h3></div>
		<div class="col-sm-2"></div>
		<div class="col-sm-4"><h3>{{data[0].BAdd}}</h3></div>
</div>
<br>
<br>
<center>
<a href="${flowExecutionUrl}&_eventId=goToPage2" class="btn btn-danger" style=" float:left; margin-left:50px; margin-top:45px">Confirm Billing Address</a>
<a href="${flowExecutionUrl}&_eventId=goToPage4" class="btn btn-danger" style=" float:right; margin-right:50px; margin-top:45px">Submit Order</a></center>


</body>
</html>