<%@page import="kr.co.jboard1.bean.ArticleBean"%>
<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no 	   = request.getParameter("no");
	String pg  	   = request.getParameter("pg");
	String content = request.getParameter("content");
	String uid     = request.getParameter("uid");
	String regip   = request.getRemoteAddr();

	ArticleBean comment = new ArticleBean();
	comment.setParent(no);
	comment.setContent(content);
	comment.setUid(uid);
	comment.setRegip(regip);
	
	ArticleDAO.getInstance().insertComment(comment);
	
	response.sendRedirect("/Jboard1/view.jsp?no="+no+"&pg="+pg);
	
%>