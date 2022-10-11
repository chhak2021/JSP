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
			
			userBean 액션태그
			 - 자바빈을 활용해서 전송 데이터를 수신하고 객체를 생성하는 태그
			 
			자바빈(JavaBean)
			 - 일반적으로 JSP에서 사용하는 데이터 전송 객체 
			 - form 또는 table의 필드(속성)를 멤버로 갖는 클래스
			 - MVC모델, Spring에서 자바빈을 VO(Value Object) 또는 DTO(Data Transfer Object)라고 부름
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
		
		<h4>회원가입</h4>
		<form action="./proc/addUser.jsp" method="post">
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