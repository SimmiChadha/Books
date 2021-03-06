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
    
    $scope.BAdd='';
    $scope.SAdd='';

    $scope.done = false;
    
    $http(	{
    			method: 'POST',
	      		url: 'http://localhost:9001/Book/getAddress',
	      		 headers : {'Content-Type':'application/x-www-form-urlencoded'}
    			}).then(function(response){
			    	console.log(response.data);
			    
			    	$scope.data = response.data;
			   
			    	$scope.BAdd=response.data.SAddr;
			        $scope.SAdd=response.data.BAddr;
			        
			        console.log( $scope.SAdd );
			        console.log( $scope.BAdd );
    			});
    
 $scope.Update=function(){
    	
	 	var json = {"ship":$scope.SAdd,"bill":$scope.BAdd};
	 
    	$http(	{
			method: 'POST',
      		url: 'http://localhost:9001/Book/UpdateCartAddToDB',
      		data:JSON.stringify(json),
      		 headers : {'Content-Type':'application/json'}
			}).then(function(response){
		    	console.log(response.data);
		    
		    	if(response.data.msg=="Updated")
		    	{
		    		$scope.done = true;	    	
		    	}
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

<h1 class="jumbotron jumbotron-sm" style="margin: auto; text-align: center;">Confirm Billing Address</h1>
<br><br><br>
<table class="table table-striped " style="margin: auto; width: 50%;">
	<thead>
		<tr>
      		<th>${currUser} Shipping Address</th>
			<th>${currUser} Billing Address</th>			
		</tr>
	</thead>
	
	<tbody>
		<tr>
			<td><textarea rows="5" name="SAddr"  class="form-control"  ng-model="SAdd" placeholder="Enter Shipping Address"></textarea></td>
			<td><textarea rows="5" name="BAddr" class="form-control" ng-model="BAdd"></textarea></td>
		</tr>
	</tbody>
	
	<tbody>
		<tr>
			<td><button ng-click="Update()" class="btn btn-danger">Edit</button></td>
			<td><button ng-click="Update()" class="btn btn-danger">Edit</button></td>
		</tr>
	</tbody>
</table>
<br>
<br>
<h1 class="text text-danger" ng-show='done' style="margin: auto; width: 80%; text-align: center;">Updated Successfully</h1>
<br>
<br>
<center>
<a href="${flowExecutionUrl}&_eventId=goToPage1" class="btn btn-danger" style=" float:left; margin-left:50px; margin-top:45px">View Cart</a>
<a href="${flowExecutionUrl}&_eventId=goToPage3" class="btn btn-danger" style=" float:right; margin-right:50px; margin-top:45px">Invoice</a></center>

</body>
</html>