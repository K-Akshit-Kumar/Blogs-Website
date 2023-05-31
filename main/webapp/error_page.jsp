<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page isErrorPage="true" %>
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
<title>Sorry,Something went wrong</title>
</head>
<body>
	<div class="container text-center">
		<img src="https://cdn-icons-png.flaticon.com/512/8281/8281994.png" class="img-fluid">
		<p class="display-3">Sorry! Something went wrong</p>
		<p><%=exception %></p>
		<a href="index.jsp" class="btn btn-dark btn-lg  mt-3">Home Page</a>
	</div>
</body>
</html>