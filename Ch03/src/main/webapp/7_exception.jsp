<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>7_exception</title>
		<!-- 
			날짜 : 2022/10/07
			이름 : 김철학
			내용 : JSP exception 내장객체 실습하기	
			
			exception 내장객체
			 - JSP 페이지에서 예외가 발생했을 때 생성되는 내장객체
			 - 직접적으로 exception 내장객체를 사용하지 않고 에러코드에 따라 에러 페이지 설정 작업
			 
			주요 응답상태 코드
			 - 200 : 요청을 정상적으로 응답코드
			 - 3xx : 리다이렉트 응답코드
			 - 404 : 요청 페이지를 찾을 수 없음 응답코드
			 - 500 : 서버 내부 에러 발생 응답코드
		-->
	</head>
	<body>
		<h3>exception 객체</h3>
		
		<a href="./9_text.jsp">404에러 페이지</a>
		<a href="./proc/exception.jsp">500에러 페이지</a>
		
	</body>
</html>

