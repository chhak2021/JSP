<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>scopeResult</title>
	</head>
	<body>
		<h4>내장객체 값 확인</h4>
		<p>
			pageContext 확인 : <%= pageContext.getAttribute("name") %><br/>
			request 확인 : <%= request.getAttribute("name") %><br/>
			session 확인 : <%= session.getAttribute("name") %><br/>
			application 확인 : <%= application.getAttribute("name") %><br/>	
		</p>
		
		<a href="/Ch03/proc/scopeResult.jsp">결과확인</a>
	</body>
</html>