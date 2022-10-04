<%@ page import="sub1.Account"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>4_클래스</title>
		<%--
			날짜 : 2022/10/04
			이름 : 김철학
			내용 : JSP 클래스 실습하기		
		--%>
	</head>
	<body>
		<h3>클래스</h3>
		<%
			Account kb = new Account("국민은행", "101-11-1001", "김유신", 10000);
			Account wr = new Account("우리은행", "101-12-2001", "김춘추", 30000);
			
			kb.deposit(40000);
			kb.withdraw(7000);
			kb.show(out);
			
			wr.deposit(20000);
			wr.withdraw(5000);
			wr.show(out);
		%>
	</body>
</html>