<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// 전송 데이터 인코딩
	request.setCharacterEncoding("UTF-8");

	// 전송 데이터 수신
	String id 	  = request.getParameter("id");
	String pw 	  = request.getParameter("pw");
	String name   = request.getParameter("name");
	String birth  = request.getParameter("birth");
	String gender = request.getParameter("gender");
	String addr   = request.getParameter("addr");
	String[] hobbies =  request.getParameterValues("hobby");
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>registerProc</title>
	</head>
	<body>
		<h3>회원가입 처리</h3>
		<p>
			아이디 : <%= id %><br/>
			비밀번호 : <%= pw %><br/>
			이름 : <%= name %><br/>
			생년월일 : <%= birth %><br/>
			성별 : 
			<%
				if(gender.equals("1")){
					out.println("남자");
				}else{
					out.println("여자");
				}
			%>
			<br/>
			주소 : <%= addr %><br/>		
			취미 : 
			<%
				for(String hobby : hobbies){
					out.println(hobby + " ");
				}
			%>
			<br/>		
		</p>
		
		<a href="../1_request.jsp">뒤로가기</a>
		
	</body>
</html>