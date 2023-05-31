package com.project.dao;

import java.sql.*;
import java.util.*;
import com.project.entities.*;

public class PostDAO {
	
	Connection con = null;
	public PostDAO(Connection con) {
		this.con = con;
	}
	
	public ArrayList<Category> getAllCategories(){
		
		ArrayList<Category> list = new ArrayList<>();		
		try {
			
			String query = "select * from categories";
			Statement st = this.con.createStatement();
			ResultSet rs = st.executeQuery(query);
			
			while(rs.next()) {
				int cid = rs.getInt("cid");
				String name = rs.getString("name");
				String description = rs.getString("description");
				Category c = new Category(cid,name,description);				
				list.add(c);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public boolean savePost(Post post) {
		boolean flag = false;
		try {
			String query = "insert into posts(ptitle, pcontent, pcode, ppic, cid, userId) values(?,?,?,?,?,?)";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, post.getPtitle());
			pstmt.setString(2, post.getPcontent());
			pstmt.setString(3, post.getPcode());
			pstmt.setString(4, post.getPpic());
			pstmt.setInt(5, post.getCid());
			pstmt.setInt(6, post.getUserId());
			
			pstmt.executeUpdate();
			flag=true;			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public ArrayList<Post> getAllPost(){
		ArrayList<Post>  list = new ArrayList<>();
		try {
			String query = "select * from posts order by pid desc";
			PreparedStatement pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp pdate = rs.getTimestamp("pdate");
				int cid = rs.getInt("cid");
				int userId = rs.getInt("userid");
				
				Post post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, userId);
				list.add(post);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;
	}
	
	public ArrayList<Post> getAllPostByCid(int cid){
		ArrayList<Post>  list = new ArrayList<>();
		try {
			String query = "select * from posts where cid=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, cid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				int pid = rs.getInt("pid");
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp pdate = rs.getTimestamp("pdate");
				int userId = rs.getInt("userid");				
				Post post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, userId);
				list.add(post);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return list;		
	}
	
	public Post getPostByPid(int pid) {
		Post post = null;
		try {
			String query = "select * from posts where pid=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, pid);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				String ptitle = rs.getString("ptitle");
				String pcontent = rs.getString("pcontent");
				String pcode = rs.getString("pcode");
				String ppic = rs.getString("ppic");
				Timestamp pdate = rs.getTimestamp("pdate");
				int cid = rs.getInt("cid");
				int userId = rs.getInt("userid");				
				post = new Post(pid, ptitle, pcontent, pcode, ppic, pdate, cid, userId);				
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return post;		
	}

}
