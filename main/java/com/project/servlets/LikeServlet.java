package com.project.servlets;

import java.io.*;
import com.project.helper.ConnectionProvider;
import com.project.dao.*;
import jakarta.servlet.*;
import jakarta.servlet.http.*;

public class LikeServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try(PrintWriter out = response.getWriter()) {
			int pid = Integer.parseInt(request.getParameter("pid"));
			int uid = Integer.parseInt(request.getParameter("uid"));
			LikeDAO dao = new LikeDAO(ConnectionProvider.getConnection());
			if(dao.isLikedByUser(pid, uid)) {
				dao.deleteLike(pid, uid);
				out.println(dao.countLikeOnPost(pid));
			}else {
				if(dao.insertLike(pid, uid)) {
					out.println(dao.countLikeOnPost(pid));
				}
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
