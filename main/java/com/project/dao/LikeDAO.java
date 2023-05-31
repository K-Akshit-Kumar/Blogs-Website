package com.project.dao;

import java.sql.*;

public class LikeDAO {
	
	Connection con = null;
	public LikeDAO(Connection con) {
		this.con = con;
	}
	
	public boolean insertLike(int pid, int uid) {
		boolean flag = false;
		try {
			String query = "insert into likes(pid,id) values(?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			flag = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return flag;
	}
	public int countLikeOnPost(int pid) {		
		int count = 0;
		try {
			String query = "select count(*) from likes where pid=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt("count(*)");
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public boolean isLikedByUser(int pid, int uid) {
		boolean flag = false;
		try {
			String query = "select * from likes where pid=? and id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				flag = true;
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return flag;		
	}
	public boolean deleteLike(int pid, int uid) {
		boolean flag = false;
		try {
			String query = "delete from likes where pid=? and id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			pstmt.setInt(2, uid);
			pstmt.executeUpdate();
			flag = true;
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return flag;		
	}
	
}
