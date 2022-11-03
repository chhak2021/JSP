package kr.co.jboard1.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

// 좀 더 편리한 DB처리를 위한 헬퍼 클래스
public class DBHelper {
	
	protected Connection conn = null;
	protected PreparedStatement psmt = null;
	protected Statement stmt = null;
	protected ResultSet rs = null;
	
	public Connection getConnection() {
		try {
			DataSource ds = (DataSource) new InitialContext().lookup("java:comp/env/dbcp_java2_board");
			conn = ds.getConnection();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	
	public void close() {
		try {
			if(rs != null) rs.close();			
			if(stmt != null) stmt.close();
			if(psmt != null) psmt.close();
			if(conn != null) conn.close();
		}catch (Exception e) {
			e.printStackTrace();
		}
	}
}
