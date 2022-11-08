<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_표현언어</title>
		<!-- 
			날짜 : 2022/11/08
			이름 : 김철학
			내용 : JSP 표현언어 실습하기
			
			표현언어(Expression Language)
			 - MVC 패턴에 따라 JSP를 더욱 효율적으로 처리하기 위한 출력문법
			 - JSP 내장객체를 이용해 표현언어로 출력 			
		 -->
	</head>
	<body>
		<h3>1.표현언어(Expression Language)</h3>
		<%
			int num1 = 1;
			int num2 = 2;
			
			String str1 = "hello";
			String str2 = "welcome";
			
			// 표현언어로 출력하기 위해 내장객체 영역 값 설정
			pageContext.setAttribute("num1", num1);
			request.setAttribute("num2", num2);
			session.setAttribute("str1", str1);
			application.setAttribute("str2", str2);
		%>
		
		<h4>표현식(Expression)</h4>
		<p>
			num1 : <%= num1 %><br/>
			num2 : <%= num2 %><br/>
			str1 : <%= str1 %><br/>
			str2 : <%= str2 %><br/>
		</p>
		
		<h4>표현언어</h4>
		<p>
			num1 : ${num1}<br/>
			num2 : ${num2}<br/>
			str1 : ${str1}<br/>
			str2 : ${str2}<br/>
		</p>
				
	</body>
</html>