<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user1::list</title>
	</head>
	<body>
		<h3>user1 목록</h3>
		<a href="#">처음으로</a>
		<a href="/Ch09/user1/register.do">user1 등록</a>
		
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>휴대폰</th>
				<th>나이</th>
				<th>관리</th>
			</tr>
			<tr>
				<td>a101</td>
				<td>홍길동</td>
				<td>010-1234-1001</td>
				<td>17</td>
				<td>
					<a href="/Ch09/user1/modify.do">수정</a>
					<a href="#">삭제</a>
				</td>				
			</tr>
		</table>
		
	</body>
</html>