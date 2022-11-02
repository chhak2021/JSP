<%@page import="kr.co.jboard1.dao.UserDAO"%>
<%@page import="kr.co.jboard1.bean.UserBean"%>
<%@page import="kr.co.jboard1.db.Sql"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.jboard1.db.DBCP"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 수신
	request.setCharacterEncoding("utf-8");
	String uid   = request.getParameter("uid");
	String pass1 = request.getParameter("pass1");
	String name  = request.getParameter("name");
	String nick  = request.getParameter("nick");
	String email = request.getParameter("email");
	String hp    = request.getParameter("hp");
	String zip   = request.getParameter("zip");
	String addr1 = request.getParameter("addr1");
	String addr2 = request.getParameter("addr2");
	String regip = request.getRemoteAddr();
	
	// 데이터베이스 처리
	UserBean ub = new UserBean();
	ub.setUid(uid);
	ub.setPass(pass1);
	ub.setName(name);
	ub.setNick(nick);
	ub.setEmail(email);
	ub.setHp(hp);
	ub.setZip(zip);
	ub.setAddr1(addr1);
	ub.setAddr2(addr2);
	ub.setRegip(regip);
	
	UserDAO.getInstance().insertUser(ub);
	
	// 리다이렉트
	response.sendRedirect("/Jboard1/user/login.jsp");
%>


