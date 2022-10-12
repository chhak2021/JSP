<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>cookieProc</title>
	</head>
	<body>
		<h3>쿠키생성확인</h3>
		<%
			request.setCharacterEncoding("utf-8");
			
			String id = request.getParameter("id");
			String pw = request.getParameter("pw");
			
			// 쿠키생성
			Cookie c1 = new Cookie("cid", id);
			Cookie c2 = new Cookie("cpw", pw);
			c1.setMaxAge(60*1);
			c2.setMaxAge(60*1);
			
			// 쿠키전송
			response.addCookie(c1);	
			response.addCookie(c2);	
		%>	
		
		<a href="./cookieConfirm.jsp">쿠키확인</a>
			
	</body>
</html>