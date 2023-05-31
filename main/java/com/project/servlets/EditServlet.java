package com.project.servlets;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;
import com.project.entities.*;
import com.project.helper.*;
import com.project.dao.*;

@MultipartConfig
public class EditServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException 
	{
		
		try(PrintWriter out = response.getWriter()) 
		{
			String email = request.getParameter("edit_email");
			String name = request.getParameter("edit_name");
			String password = request.getParameter("edit_password");
			String about = request.getParameter("edit_about");
			Part part = request.getPart("image");
			String imageName = part.getSubmittedFileName();
			
			HttpSession session = request.getSession();
			Register register = (Register)session.getAttribute("currentUser");
			register.setEmail(email);
			register.setName(name);
			register.setPassword(password);
			register.setAbout(about);
			String oldFile = register.getProfile();
			register.setProfile(imageName);
			
			RegisterDAO registerdao = new RegisterDAO(ConnectionProvider.getConnection());
			if(registerdao.updateUser(register)) {
				
				/* deleting old file */
				String oldFilePath = request.getRealPath("/")+"pics"+File.separator+oldFile;
				Helper.deleteFile(oldFilePath);
				
				/* saving new file */
				String path = request.getRealPath("/")+"pics"+File.separator+register.getProfile();
				if(Helper.saveFile(part.getInputStream(), path)){
					Message msg = new Message("Profile details updated","success","alert-success");
					session.setAttribute("msg", msg);
				}else {
					Message msg = new Message("Profile details not updated","error","alert-danger");
					session.setAttribute("msg", msg);
				}
			}else {
				Message msg = new Message("Profile details not updated","error","alert-danger");
				session.setAttribute("msg", msg);
			}
			response.sendRedirect("profile.jsp");
		}		
	}
}
