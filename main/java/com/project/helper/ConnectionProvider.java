package com.project.helper;
import java.sql.*;
public class ConnectionProvider {
	
	private static Connection conn;
	public static Connection getConnection() {
		
		try {
			if(conn == null) {
				Class.forName("oracle.jdbc.driver.OracleDriver");
				conn = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","project1","123");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return conn;
	}

}
