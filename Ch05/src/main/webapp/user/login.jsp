<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 자동 로그인 여부에 따라 로그인 처리
	Cookie[] cookies = request.getCookies();
	
	if(cookies != null){
		for(Cookie c : cookies){
			if(c.getName().equals("cid")){
				// 자동 로그인 쿠키값으로 세션id 저장
				session.setAttribute("sessid", c.getValue());				
			}			
		}
	}


	// 로그인 여부 확인
	String id = (String)session.getAttribute("sessid");

	if(id != null){
		response.sendRedirect("./loginSuccess.jsp");
		return;
	}
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>login</title>
	</head>
	<body>
		<h3>로그인</h3>
		
		<form action="./loginProc.jsp" method="post">
			<input type="text" name="id" placeholder="아이디 입력"/><br/>
			<input type="password" name="pw" placeholder="비밀번호 입력"/><br/>
			<label><input type="checkbox" name="auto" value="1"/>자동 로그인</label>			
			<input type="submit" value="로그인"/>		
		</form>
	</body>
</html>