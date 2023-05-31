package com.project.servlets;

import java.io.*;

import com.project.entities.*;
import com.project.dao.*;
import com.project.helper.ConnectionProvider;
import com.project.helper.Helper;

import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@MultipartConfig
public class AddPostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		try(PrintWriter out = response.getWriter()){
			int cid = Integer.parseInt(request.getParameter("cid"));
			String ptitle = request.getParameter("ptitle");
			String pcontent = request.getParameter("pcontent");
			String pcode = request.getParameter("pcode");
			Part part = request.getPart("pimage");
			String ppic = part.getSubmittedFileName();
			HttpSession session = request.getSession();
			Register register = (Register)session.getAttribute("currentUser");
			int userId = register.getId();
			
			Post post = new Post(ptitle, pcontent, pcode, ppic, null, cid, userId);
			
			PostDAO postdao = new PostDAO(ConnectionProvider.getConnection());
			
			if(postdao.savePost(post)) {
				String path = request.getRealPath("/")+"blog_pics"+File.separator+ppic;		
				Helper.saveFile(part.getInputStream(), path);
				out.println("done");
			}else {
				out.println("error");
			}				
		}		
	}
}
