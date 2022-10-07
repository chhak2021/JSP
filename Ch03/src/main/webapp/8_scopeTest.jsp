<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>8_scopeTest</title>
		<!-- 
			날짜 : 2022/10/07
			이름 : 김철학
			내용 : JSP 내장객체 영역 실습하기 
			
			내장객체영역
			 - JSP 내장객체가 저장되는 메모리의 유효기간
			 - 웹은 페이지가 모여 하나의 요청을 처리, 요청이 모여 하나의 세션을 다시 세션이 모여 웹애플리케이션을 구성
		-->
	</head>
	<body>
		<h3>내장객체 영역</h3>
		
		<%
			// 내장객체영역 값 설정
			pageContext.setAttribute("name", "김유신");
			request.setAttribute("name", "김춘추");
			session.setAttribute("name", "장보고");
			application.setAttribute("name", "이순신");
		%>
		
		<h4>내장객체 값 확인</h4>
		<p>
			pageContext 확인 : <%= pageContext.getAttribute("name") %><br/>
			request 확인 : <%= request.getAttribute("name") %><br/>
			session 확인 : <%= session.getAttribute("name") %><br/>
			application 확인 : <%= application.getAttribute("name") %><br/>	
		</p>
		
		<%
			pageContext.forward("./proc/scopeResult.jsp");		
		%>		
	</body>
</html>