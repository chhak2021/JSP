<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");
	String title = request.getParameter("title");
	String content = request.getParameter("content");
	
	ArticleDAO.getInstance().updateArticle(no, title, content);

	response.sendRedirect("/Jboard1/view.jsp?no="+no+"&pg="+pg+"&result=201");
%>