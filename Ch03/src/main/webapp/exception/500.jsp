<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" isErrorPage="true"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>서버 내부 에러</title>
	</head>
	<body>
		<h3>일시적인 서비스 장애 입니다. 관리자에게 문의하시기 바랍니다.</h3>
		<p>
			에러코드 : <%= exception.getClass().getName() %><br/>
			에러내용 : <%= exception.getMessage() %>
		</p>
		
		<a href="/Ch03/7_exception.jsp">되돌아가기</a>		
	</body>
</html>