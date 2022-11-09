<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>2_필터</title>
		<!-- 
			날짜 : 2022/11/09
			이름 : 김철학
			내용 : 필터 실습하기
			
			필터(Filter)
			 - 자바 웹 애플리케이션에서 부가적인 기능을 지원하기 위한 서블릿
			 - 클라이언트 요청에 JSP가 실행되기 전에 가장 먼저 실행
			 - 인증, 로깅, 인코딩 처리에 활용
		-->
	</head>
	<body>
		<h3>2.필터</h3>
		<a href="/Ch08/hello.do">HelloServlet 요청</a><br/>
		<a href="/Ch08/welcome.do">WelcomeServlet 요청</a><br/>
		<a href="/Ch08/greeting">GreetingServlet 요청</a><br/>
	</body>
</html>