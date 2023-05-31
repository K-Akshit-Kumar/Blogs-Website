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
<title>Register Page</title>
</head>
<body>

	<!-- navbar -->
	<%@ include file="navbar.jsp" %>

	<main class="bg-dark p-4">
		<div class="container">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-header bg-dark text-white text-center">
						<span class="fa fa-user-plus me-2 fa-2x"></span><br>Register Here</div>
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
							<form class="reg-form" action="RegisterServlet" method="post">
								<div class="mb-0">
									<label>User Name</label> 
									<input type="text" class="form-control" name="user_name" aria-describedby="emailHelp">
								</div>							
								<div class="mb-0">
									<label>Email address</label> 
									<input type="email" class="form-control" name="user_email" aria-describedby="emailHelp">
									<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
								</div>
								
								<div class="mb-0">
									<label>Password</label>
									<input type="password" class="form-control" name="user_password" >
								</div>
								
								<div class="mt-2 mb-2">
									<label>Select Gender</label>
									<input type="radio" class="me-1"  name="user_gender" value="male"> Male
									<input type="radio" class="me-1"  name="user_gender" value="female"> Female
								</div>
								
								<div class="mb-3">
									<textarea name="user_about" class="form-control" rows="2" placeholder="Enter something about Yourself"></textarea>
								</div>
															
								<div class="mb-3 form-check">
									<input name="user_condition" type="checkbox" class="form-check-input" > 
									<label class="form-check-label">Agree to Terms and Condition</label>
								</div>															
								<button type="submit" class="btn btn-dark mt-1">Submit</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</main>

	<!-- JavaScript -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
	<script src="./js/app.js"></script>
	<script>
		/*const reg_form = document.querySelector(".reg-form");
		reg_form.addEventListener('submit', function(event){
			
			event.preventDefault();	
			const data =  new FormData(reg_form);
			
			var xhr = new XMLHttpRequest();	 */
			/*xhr.setRequestHeader('Content-Type', 'multipart/form-data');*/
			/*xhr.onload = function(){
				var response = this.responseText;
				response = response.trim().toString();
				if(response == "done"){
					document.querySelector(".alert-success").style.display = "block";			
					document.querySelector(".alert-danger").style.display = "none";
					document.querySelector(".alert-success").innerHTML = "Account is Created Successfully";			
				}else if(response == "condition"){
					document.querySelector(".alert-success").style.display = "none";			
					document.querySelector(".alert-danger").style.display = "block";
					document.querySelector(".alert-danger").innerHTML = "Please check the terms and condition";			
				}else{
					document.querySelector(".alert-success").style.display = "none";			
					document.querySelector(".alert-danger").style.display = "block";
					document.querySelector(".alert-danger").innerHTML = "Something Went Wrong!";			
				}		
			}
			xhr.open("POST", "RegisterServlet", true);
			xhr.send(data);
			
		}); */
	</script>
</body>
</html>