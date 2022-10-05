<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>1_request</title>
		<!-- 
			날짜 : 2022/10/05
			이름 : 김철학
			내용 : JSP request 내장객체 실습하기
		-->
	</head>
	<body>
		<h3>request 내장객체</h3>
		
		<h4>사용자 입력</h4>
		<form action="./proc/userProc.jsp" method="get">
			<input type="text" name="uid" placeholder="아이디 입력"/><br/>
			<input type="text" name="name" placeholder="이름 입력"/><br/>
			<input type="number" name="age" placeholder="나이 입력"/><br/>
			<input type="submit" value="전송하기"/>		
		</form>
		
		<h4>회원가입</h4>
		<form action="./proc/registerProc.jsp" method="post">
			<table border="1">
				<tr>
					<td>아이디</td>
					<td><input type="text" name="id" placeholder="아이디 입력"/></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" placeholder="비밀번호 입력"/></td>
				</tr>
				<tr>
					<td>이름</td>
					<td><input type="text" name="name" placeholder="이름 입력"/></td>
				</tr>
				<tr>
					<td>생년월일</td>
					<td><input type="date" name="birth" placeholder="생년월일 선택"/></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>
						<label><input type="radio" name="gender" value="1"/>남</label>
						<label><input type="radio" name="gender" value="2"/>여</label>
					</td>
				</tr>
				<tr>
					<td>주소</td>
					<td>
						<select name="addr">
							<option>서울</option>
							<option>대전</option>
							<option>대구</option>
							<option>부산</option>
							<option>광주</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>취미</td>
					<td>
						<label><input type="checkbox" name="hobby" value="등산"/>등산하기</label>
						<label><input type="checkbox" name="hobby" value="독서"/>독서하기</label>
						<label><input type="checkbox" name="hobby" value="여행"/>여행하기</label>
						<label><input type="checkbox" name="hobby" value="운동"/>운동하기</label>
						<label><input type="checkbox" name="hobby" value="게임"/>게임하기</label>					
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
						<input type="submit" value="회원가입"/>
					</td>
				</tr>
			</table>
		</form>
		
	</body>
</html>