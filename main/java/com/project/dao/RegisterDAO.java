package com.project.dao;
import java.sql.*;
import com.project.entities.Register;

public class RegisterDAO {
	private Connection con;

	public RegisterDAO(Connection con) {
		this.con = con;
	}
	
	public boolean saveRegister(Register register) {		
		
		boolean flag = false;
		
		try {
			String query = "insert into register (name,email,password,gender,about) values (?,?,?,?,?)";
			PreparedStatement pstmt = this.con.prepareStatement(query);
			pstmt.setString(1, register.getName());
			pstmt.setString(2, register.getEmail());
			pstmt.setString(3, register.getPassword());
			pstmt.setString(4, register.getGender());
			pstmt.setString(5, register.getAbout());
			
			pstmt.executeQuery();
			flag=true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public Register getUserByEmailAndPassword(String email, String password) {
		
		Register user = null;		
		try {
			
			String query = "select * from register where email=? and password=?";
			
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				
				user = new Register();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));
			}
			
		}catch(Exception e){
			e.printStackTrace();
		}		
		
		return user;
	}
	
	public boolean updateUser(Register register) {
		boolean flag = false;
		try {
			String query = "update register set email=?, name=?, password=?, about=?, profile=? where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setString(1, register.getEmail());
			pstmt.setString(2, register.getName());
			pstmt.setString(3, register.getPassword());
			pstmt.setString(4, register.getAbout());
			pstmt.setString(5, register.getProfile());
			pstmt.setInt(6, register.getId());
			
			pstmt.executeUpdate();
			flag = true;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public Register getUserByPostid(int userid) {
		Register user = null;
		try {
			String query = "select * from register where id=?";
			PreparedStatement pstmt = con.prepareStatement(query);
			pstmt.setInt(1, userid);
			ResultSet rs = pstmt.executeQuery();
			
			if(rs.next()) {
				user = new Register();
				
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setGender(rs.getString("gender"));
				user.setAbout(rs.getString("about"));
				user.setTime(rs.getTimestamp("rdate"));
				user.setProfile(rs.getString("profile"));				
			}			
		}catch(Exception e) {
			e.printStackTrace();
		}		
		return user;
	}	
}
