<%@page import="kr.co.jboard1.dao.ArticleDAO"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String no = request.getParameter("no");
	String pg = request.getParameter("pg");

	ArticleDAO.getInstance().deleteArticle(no);

	response.sendRedirect("/Jboard1/list.jsp?pg="+pg+"&result=202");
%>