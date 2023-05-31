<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.project.entities.*"%>
<%@ page import="com.project.dao.*" %>
<%@ page import="com.project.helper.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page errorPage="error_page.jsp"%>
<%
Register user = (Register) session.getAttribute("currentUser");
if (user == null) {
	response.sendRedirect("login_page.jsp");
}
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
<title>Profile Page</title>
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


		<%
			Message msg = (Message) session.getAttribute("msg");
			if (msg != null) {
			%>
				<p style="width:100%" class="alert <%=msg.getCssClass()%>"><%=msg.getContent()%></p>
			<%
				session.removeAttribute("msg");
			}
		%>

	
	<!-- main -->
	
		<div class="container p-5">
			<div class="row">
				<div class="col-md-4">
					<div class="list-group">
					  <a href="#" onclick="getPosts(0)" class="list-group-item list-group-item-action " aria-current="true">
					    All Post
					  </a>
					  <%
					  	PostDAO postdao1 = new PostDAO(ConnectionProvider.getConnection());
					  	
					  	ArrayList<Category> list1 = postdao1.getAllCategories();
					  	for(Category c1 : list1){
					  		
					  		%>
					  			<a href="#" onclick="getPosts(<%=c1.getCid()%>)" class="list-group-item list-group-item-action"><%=c1.getName() %></a>
					  		<%					  			
					  	}					  
					  %>
					</div>
					
				</div>
				<div class="col-md-8">
					<div class="container text-center loader" style="display:block;">
						<i class="fa fa-refresh fa-spin fa-3x mb-2"></i>	
						<h4>Loading...</h4>				
					</div>
					<div class="container-fluid all-posts">
					
					</div>					
				</div>
			
			</div>		
		</div>
	
	
	<!-- end main -->


	


	<!-- Profile -modal -->
	<!-- Modal -->
	<div class="modal fade" id="profileModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header bg-dark text-white">
					<h5 class="modal-title" id="exampleModalLabel">Profile Details</h5>
					<button type="button" class="btn-close bg-white"
						data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<div class="container text-center ">
						<img src="pics/<%=user.getProfile()%>" class="img-fluid"
							width="150px"> <br>
						<p class="mt-3"><%=user.getName()%></p>
						<table class="table profile-details text-center">
							<tbody>
								<tr>
									<td>ID</td>
									<td><%=user.getId()%></td>
								</tr>
								<tr>
									<td>Email</td>
									<td><%=user.getEmail()%></td>
								</tr>
								<tr>
									<td>Gender</td>
									<td><%=user.getGender()%></td>
								</tr>
								<tr>
									<td>About</td>
									<td><%=user.getAbout()%></td>
								</tr>
								<tr>
									<td>Registered Date</td>
									<td><%=user.getTime().toString().substring(0, 19)%></td>
								</tr>
							</tbody>
						</table>
					</div>

					<!-- Profile_edit -->
					<div class="profile-edit container text-center" style="display: none">
						<h3 class="mt-2">Please edit carefully</h3>
						<form action="EditServlet" method="post" enctype="multipart/form-data">
							<table class="table profile-details text-center">
								<tbody>
									<tr>
										<td>ID:</td>
										<td><%=user.getId()%></td>
									</tr>
									<tr>
										<td>Email:</td>
										<td><input type="email" class="form-control" name="edit_email" value="<%=user.getEmail()%>"></td>
									</tr>
									<tr>
										<td>Password:</td>
										<td><input type="password" class="form-control" name="edit_password" value="<%=user.getPassword()%>"></td>
									</tr>
									<tr>
										<td>Name:</td>
										<td><input type="text" class="form-control" name="edit_name" value="<%=user.getName()%>"></td>
									</tr>
									<tr>
										<td>Gender:</td>
										<td><%=user.getGender().toUpperCase()%></td>
									</tr>
									<tr>
										<td>About:</td>
										<td><textarea rows="2" class="form-control" name="edit_about"><%=user.getAbout()%></textarea></td>
									</tr>
									<tr>
										<td>New Profile:</td>
										<td><input type="file" name="image" class="form-control" accept="image/*"></td>
									</tr>
								</tbody>
							</table>		
							<div class="container">
								<button type="submit" class="btn btn-outline-dark">Save</button>
							</div>					
						</form>
	      			</div>
	    		</div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
	        <button type="button" class="btn btn-dark edit-click">EDIT</button>
	      </div>
	    </div>
	  </div>
	</div>
	
	
	<!-- Post modal -->		
		<!-- Modal -->
		<div class="modal fade" id="add-post-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header bg-dark text-white">
		        <h5 class="modal-title" id="exampleModalLabel">Provide the post details</h5>
		        <button type="button" class="btn-close bg-white" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
			    <p class="alert alert-post-modal"></p>			      			
		      	<form id="add-post-form" action="AddPostServlet" method="post">		      		
		      		<div class="form-group">
		      			<select class="form-control" name="cid">
		      				<option selected disabled>Select Categories</option>
		      				<%
		      					PostDAO postdao = new PostDAO(ConnectionProvider.getConnection());
		      					ArrayList<Category> list = postdao.getAllCategories();		      					
		      					for(Category c : list){
		      						%>
		      							<option value="<%=c.getCid()%>"><%=c.getName()%></option>
		      						<%
		      					} 					
		      				%>
		      			</select>
		      		</div>
		      		
		      		<div class="form-group mt-3">
		      			<input type="text" name="ptitle" placeholder="Enter post title" class="form-control">	
		      		</div>
		      		
		      		<div class="form-group mt-3">
		      			<textarea name="pcontent" style="height:200px;" placeholder="Enter your content" class="form-control" ></textarea>	
		      		</div>
		      		
		      		<div class="form-group mt-3">
		      			<textarea name="pcode" style="height:200px;" placeholder="Enter your program (if any)" class="form-control" ></textarea>	
		      		</div>
		      		
		      		<div class="form-group mt-3">
		      			<input name="pimage" class="form-control" type="file" accept="image/*">
		      		</div>
		      		<div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="submit" class="btn btn-dark">Post</button>
		      		</div>		      		
		      	</form>
		      </div>
		    </div>
		  </div>
		</div>


	<!-- JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="./js/app.js"></script>
	<script src="./js/like.js"></script>
	<script>
		const edit_click = document.querySelector(".edit-click");
		const profile_details = document.querySelector(".profile-details");
		const profile_edit = document.querySelector(".profile-edit");
		edit_click.addEventListener('click', function(){
			if(profile_edit.style.display == "none"){
				profile_edit.style.display = "";
				profile_details.style.display = "none";
				this.innerText = "Back";
			}else{
				profile_edit.style.display = "none";
				profile_details.style.display = "";
				this.innerText = "EDIT";
			}
		});
	</script>
	<script>
		const add_post_form = document.querySelector("#add-post-form");
		add_post_form.addEventListener('submit', function(event){
			event.preventDefault();
			
			const form = new FormData(add_post_form);
			
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				const alert_post_modal = document.querySelector(".alert-post-modal");
				var response = this.responseText.trim().toString();
				if(response =="done"){
					alert_post_modal.classList.add("alert-success");
					alert_post_modal.classList.remove("alert-danger");
					alert_post_modal.innerText = "Post saved";
				}else{
					alert_post_modal.classList.add("alert-danger");
					alert_post_modal.classList.remove("alert-success");
					alert_post_modal.innerText = "Post not saved!";
				}
			}
			xhr.open("POST","AddPostServlet",true);
			xhr.send(form);
			
		});
	</script>
	<script>
		const loader = document.querySelector(".loader");
		const allPosts = document.querySelector(".all-posts");			
		function getPosts(cid){
			var c_link = document.querySelector(".c-link");
			loader.style.display = "block";
			allPosts.style.display = "none";
			const xhr = new XMLHttpRequest();
			xhr.onload = function(){
				loader.style.display = "none";				
				allPosts.style.display = "block";
				document.querySelector(".all-posts").innerHTML = this.response;
			};
			xhr.open("get","load_posts.jsp?cid="+cid,true);
			xhr.send();
		}
		
		window.onload = function(){
			getPosts(0);
		};
	</script>
</body>
</html>