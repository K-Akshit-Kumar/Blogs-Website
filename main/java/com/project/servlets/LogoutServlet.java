package com.project.servlets;

import java.io.*;
import jakarta.servlet.http.*;
import com.project.entities.*;

public class LogoutServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		HttpSession session = request.getSession();
		session.removeAttribute("currentUser");
		Message msg = new Message("Logout Successfully","success","alert-success");
		session.setAttribute("msg", msg);
		response.sendRedirect("login_page.jsp");
		
	}
	
	

}
