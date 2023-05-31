<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="com.project.entities.Message" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<!-- CSS -->
<!-- Bootstrap -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- My Style -->
<link rel="stylesheet" href="./css/style.css">
<title>Login Page</title>
<style>
	.banner-background{
		clip-path: polygon(50% 0%, 100% 0, 100% 35%, 100% 100%, 83% 96%, 50% 100%, 31% 95%, 0 100%, 0% 35%, 0 0);
	}
</style>
</head>
<body>

	<!-- navbar -->
	<%@ include file="navbar.jsp" %>

	<main class="d-flex align-items-center bg-dark" style="height: 80vh;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header bg-dark text-white text-center">
						<span class="fa fa-user-circle-o me-2 fa-3x"></span><br>Login Here</div>
						<%
							Message msg = (Message)session.getAttribute("msg");
							if(msg!=null){
								%>
									<span class="alert <%=msg.getCssClass() %> text-center"><%=msg.getContent() %></span>
								<%
								session.removeAttribute("msg");
							}
						%>						
						<div class="card-body">
							<form class="log-form" action="LoginServlet" method="post">
								<div class="mb-2">
									<label>Email address</label> 
									<input type="email" name="email" class="form-control" aria-describedby="emailHelp">
									<div class="form-text">We'll never share your email with anyone else.</div>
								</div>
								<div class="mb-2">
									<label class="form-label">Password</label>
									<input type="password" name="password" class="form-control" >
								</div>
								<div class="container text-center mt-4">
									<button type="submit" class="btn btn-dark">Submit</button>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>


	<!-- JavaScript -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
	<script src="./js/app.js"></script>
</body>
</html>