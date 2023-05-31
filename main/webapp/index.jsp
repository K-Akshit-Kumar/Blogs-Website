<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.project.helper.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS -->
<!-- Bootstrap -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- My Style -->
<link rel="stylesheet" href="./css/style.css">
<title>Home Page | Portfolio Website</title>
</head>
<body>
	<!-- Navbar -->
	<%@ include file="navbar.jsp" %>
	
	<!-- Banner -->
	<div class="container-fluid bg-dark text-white">
		<div class="jumbotron p-5">
			<div class="container p-5">
				<h3 class="display-3">Welcome to My Friends</h3>
				<p>Welcome to technical blog, world of Technology A programming language is a system of notation for writing computer programs.[1] Most programming languages are text-based formal languages, but they may also be graphical. They are a kind of computer language.</p>
				<p>The description of a programming language is usually split into the two components of syntax (form) and semantics (meaning), which are usually defined by a formal language. Some languages are defined by a specification document (for example, the C programming language is specified by an ISO Standard) while other languages (such as Perl) have a dominant implementation that is treated as a reference. Some languages have both, with the basic language defined by a standard and extensions taken from the dominant implementation being common.</p>
				<a href="register_page.jsp" class="btn btn-outline-light btn-lg me-2"><span class="	fa fa-user-plus me-2"></span> Sign Up</a>
				<a href="login_page.jsp" class="btn btn-outline-light btn-lg"><span class="fa fa-user-circle-o me-2"></span>Login</a>
			</div>
		</div>
	</div>
	<div class="container p-3">
		<div class="row mt-3 mb-3">
			<div class="col-md-4">
				<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-dark">Read More</a>
					  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-dark">Read More</a>
					  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-dark">Read More</a>
					  </div>
				</div>
			</div>
		</div>	
		<div class="row">
			<div class="col-md-4">
				<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-dark">Read More</a>
					  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-dark">Read More</a>
					  </div>
				</div>
			</div>
			<div class="col-md-4">
				<div class="card">
					  <div class="card-body">
					    <h5 class="card-title">Java Programming</h5>
					    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
					    <a href="#" class="btn btn-dark">Read More</a>
					  </div>
				</div>
			</div>
		</div>	
	</div>
	
	<!-- JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="./js/app.js"></script>
</body>
</html>