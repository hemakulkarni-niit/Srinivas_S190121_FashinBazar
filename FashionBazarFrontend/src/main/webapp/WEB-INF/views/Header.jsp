<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>

<div class="container">
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">FashionBazar</a>
			</div>
			
			<c:if test="${!sessionScope.loggedIn}">
			<ul class="nav navbar-nav">
				<li><a href="#">Home</a>
				<li><a href="login">Login</a></li>
				<li><a href="register">Register</a></li>
				<li><a href="aboutus">About Us</a></li>
				<li><a href="contactus">Contact Us</a></li>
			</ul>
			</c:if>
			
			<c:if test="${sessionScope.loggedIn}">
				<c:if  test="${sessionScope.role=='ROLE_ADMIN'}">
				<ul class="nav navbar-nav">
					<li><a href="#">Home</a>
					<li><a href="category">Manage Category</a></li>
					<li><a href="product">Manage Product</a></li>
				</ul>
				</c:if>
				<c:if  test="${sessionScope.role=='ROLE_USER'}">
				<ul class="nav navbar-nav">
					<li><a href="#">Home</a>
					<li><a href="<c:url value="/productCatalog"/>">Product Catalog</a></li>
					<li><a href="<c:url value="/cart"/>">Cart</a>
				</ul>
				</c:if>
			</c:if>
			
			<div class="nav navbar-nav navbar-right">
				<c:if test="${sessionScope.loggedIn}">
					<font color="white">Welcome : ${sessionScope.username}
					<a href="perform_logout">Logout</a></font>
				</c:if>
			</div>
		
		</div>
	</nav>
</div>
		






</body>