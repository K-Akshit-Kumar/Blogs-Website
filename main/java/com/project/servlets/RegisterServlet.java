package com.project.servlets;
 
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import java.io.*;
import com.project.helper.ConnectionProvider;
import com.project.dao.RegisterDAO;
import com.project.entities.*;

@MultipartConfig
public class RegisterServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
		
		try(PrintWriter out = response.getWriter()){			
			String userCondition = request.getParameter("user_condition");
			Message msg = null;
			HttpSession session = request.getSession();
			if(userCondition == null) {
				msg =new Message("Please check the terms and condition","error","alert-danger");
				session.setAttribute("msg", msg);
				response.sendRedirect("register_page.jsp");
			}else {
				String userName = request.getParameter("user_name");
				String userEmail = request.getParameter("user_email");
				String userPassword = request.getParameter("user_password");
				String userGender = request.getParameter("user_gender");
				String userAbout = request.getParameter("user_about");
				
				//create user object and set all the data
				Register register = new Register(userName, userEmail, userPassword, userGender, userAbout);
				
				//create a user DAO object				
				RegisterDAO dao = new RegisterDAO(ConnectionProvider.getConnection());
				if(dao.saveRegister(register)) {
					msg = new Message("Account is Created Successfully","success","alert-success");
					session.setAttribute("msg", msg);
					response.sendRedirect("register_page.jsp");
				}else {
					msg = new Message("Sorry! Something went wrong","error","alert-danger");
					session.setAttribute("msg", msg);
					response.sendRedirect("register_page.jsp");
				}				
			}			
		}		
	}
}
