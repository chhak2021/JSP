<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String title   = request.getParameter("title");
	String content = request.getParameter("content");

	
	try{
		Connection conn = DBCP.getConnection();
		
		String sql = "insert into `board_article` set ";
			   sql += ""; 
		conn.prepareStatement(sql);
		
		
		
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
	
	
%>