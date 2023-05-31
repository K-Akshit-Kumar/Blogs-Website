package com.project.servlets;

import com.project.helper.ConnectionProvider; 
import java.io.*;
import com.project.dao.RegisterDAO;
import com.project.entities.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;

@MultipartConfig
public class LoginServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		try(PrintWriter out = response.getWriter()){			
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			RegisterDAO register = new RegisterDAO(ConnectionProvider.getConnection());			
			Register user = register.getUserByEmailAndPassword(email, password);
			
			if(user == null) {
				Message msg = new Message("Invalid Details! Try again","error","alert-danger");
				HttpSession session = request.getSession();
				session.setAttribute("msg", msg);
				response.sendRedirect("login_page.jsp");
			}else {
				HttpSession session = request.getSession();
				session.setAttribute("currentUser", user);
				response.sendRedirect("profile.jsp");
			}
		}		
	}
}
