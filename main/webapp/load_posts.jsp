<%@ page import="com.project.entities.*" %>
<%@ page import="com.project.dao.*" %>
<%@ page import="com.project.helper.*" %>
<%@ page import="java.util.ArrayList" %>

<div class="row">
	<%
		Thread.sleep(500);
		PostDAO postdao = new PostDAO(ConnectionProvider.getConnection());
		int cid = Integer.parseInt(request.getParameter("cid"));
		ArrayList<Post> list;
		if(cid == 0){
			list = postdao.getAllPost();
		}else{
			list = postdao.getAllPostByCid(cid);
		}
		if(list.size() == 0){
			out.println("<h3>No posts in this category</h3>");
			return;
		}
		for(Post p : list){
			%>
				<div class="col-md-6 p-2">
					<div class="card">
						<img alt="Card Image cap" src="blog_pics/<%=p.getPpic() %>" class="card-img-top">
						<div class="card-body">
							<b><%=p.getPtitle()%></b>
							<p><%=p.getPcontent()%></p>
						</div>
						<div class="card-footer">
							<% 
								Register user = (Register)session.getAttribute("currentUser");	
								LikeDAO dao = new LikeDAO(ConnectionProvider.getConnection());
							%>
							<a href="#!" onclick="doLike(<%=p.getPid() %>,<%=user.getId()%>)" class="btn btn-outline-dark"><i class="fa fa-thumbs-o-up"> <span class="likes"><%= dao.countLikeOnPost(p.getPid()) %></span></i></a>
							<a href="show_blog_page.jsp?postid=<%=p.getPid() %>" class="btn btn-outline-dark">Read more</a>
						</div>
					</div>
				</div>			
			<%		
		}
		
	%>
</div>