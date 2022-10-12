<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_Cookie</title>
		<!-- 
			날짜 : 2022/10/12
			이름 : 김철학
			내용 : JSP Cookie 실습하기
		 -->
	</head>
	<body>
		<h3>Cookie 실습</h3>
		
		<form action="./proc/cookieProc.jsp" method="post">
			<input type="text" name="id" placeholder="아이디 입력"/><br/>
			<input type="text" name="pw" placeholder="비밀번호 입력"/><br/>
			<input type="submit" value="로그인"/>		
		</form>
		
		
		
	</body>
</html>