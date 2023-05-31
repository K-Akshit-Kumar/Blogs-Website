<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.text.DateFormat" %>
<%@ page import="com.project.entities.*" %>
<%@ page import="com.project.dao.*" %>
<%@ page import="com.project.helper.*" %>
<%@ page errorPage="error_page.jsp" %>
<%
	Register user = (Register) session.getAttribute("currentUser");
	if (user == null) {
		response.sendRedirect("login_page.jsp");
	}
	int postid = Integer.parseInt(request.getParameter("postid"));
	PostDAO postdao = new PostDAO(ConnectionProvider.getConnection());
	Post post = postdao.getPostByPid(postid);
%>
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
<title><%=post.getPtitle() %></title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark sticky-top">
		<div class="container-fluid">
			<a class="navbar-brand" href="index.jsp"><span
				class="fa fa-asterisk me-2"></span>Portfolio</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#"><span class="	fa fa-bell-o me-2"></span>Notifications</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false">
							Categories </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
							<li><a class="dropdown-item" href="#">Projects</a></li>
							<li><hr class="dropdown-divider"></li>
							<li><a class="dropdown-item" href="#">Resume</a></li>
						</ul></li>
					<li class="nav-item"><a class="nav-link" href="#">Contact
							us</a></li>
					<li class="nav-item"><a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#add-post-modal">Do Post</a></li>
				</ul>
				<ul class="navbar-nav me-right ">
					<li class="nav-item"><a class="nav-link" href="#!" data-bs-toggle="modal" data-bs-target="#profileModal"><span class="fa fa-user-circle-o me-1"></span><%=user.getName()%></a></li>
					<li class="nav-item"><a class="nav-link" href="LogoutServlet"><span
							class="fa fa-sign-out me-1"></span>Logout</a></li>
				</ul>
			</div>
		</div>
	</nav>
	
	
	<div class="container">
		<div class="row mt-3 mb-3">
			<div class="col-md-8 offset-md-2">
				<div class="card">
					<div class="card-header bg-dark text-white mb-2"><h5><%=post.getPtitle() %></h5></div>
						<img alt="Card Image cap" src="blog_pics/<%=post.getPpic() %>" class="card-img-top">
						<div class="container">
							<div class="row mt-3">
								<div class="col-md-8">
									<%
										RegisterDAO dao = new RegisterDAO(ConnectionProvider.getConnection());
										Register reg = dao.getUserByPostid(post.getUserId());
									%>
									<p><a class="text-decoration-none" href="#!"><%=reg.getName() %></a> had posted: </p>
								</div>
								<div class="col-md-4 fw-bold fst-italic text-end"><%= DateFormat.getDateTimeInstance().format(post.getPdate()) %></div>
							</div>
						</div>					
					<div class="card-body">
						<p><%=post.getPcontent() %></p>
						<pre><%=post.getPcode() %></pre>
					</div>
					<div class="card-footer">
						<%
							LikeDAO dao1 = new LikeDAO(ConnectionProvider.getConnection());
						%>
						<a href="#!" onclick="doLike(<%=post.getPid() %>,<%=user.getId()%>)" class="btn btn-outline-dark"><i class="fa fa-thumbs-o-up"> <span class="likes"><%= dao1.countLikeOnPost(post.getPid()) %></span></i></a>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="./js/app.js"></script>
	<script src="./js/like.js"></script>
</body>
</html>