<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>3_useBean 액션태그</title>
		<!-- 
			날짜 : 2022/10/11
			이름 : 김철학
			내용 : JSP useBean 액션태그 실습하기
		 -->
	</head>
	<body>
		<h3>useBean 액션태그</h3>
		
		<h4>사용자 입력</h4>
		<form action="./proc/addPerson.jsp">
			<input type="text" name="name" placeholder="이름 입력"/><br/>
			<input type="number" name="age" placeholder="나이 입력"/><br/>
			<input type="text" name="hp" placeholder="휴대폰 입력"/><br/>
			<input type="text" name="addr" placeholder="주소 입력"/><br/>
			<input type="submit" value="등록하기"/>
		</form>
		
		
		
	</body>
</html>