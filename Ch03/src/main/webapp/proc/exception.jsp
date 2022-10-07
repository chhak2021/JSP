<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>exception</title>
	</head>
	<body>
		<%
			int num1 = 1;
			int num2 = 0;
			
			int result = num1 / num2;
		%>
		
		결과 : <%= result %>
		
	</body>
</html>