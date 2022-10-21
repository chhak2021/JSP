<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2 manager</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/list.js"></script>
		<script>
			$(document).ready(function(){
				
				// user2 목록 불러오기
				list();
				
				// user2 목록보기
				$(document).on('click', '#userList', function(e){
					e.preventDefault();
					list();
				});
				
				// user2 등록하기
				$(document).on('click', '#userAdd', function(e){
					e.preventDefault();
					
					$('section').empty();
					$('nav').empty().append("<h4>user2 등록</h4><a href='#' id='userList'>user2 목록</a>");
					
					let table  = "<table border='1'>";
						table += "<tr>";
						table += "<td>아이디</td>";
						table += "<td><input type='text' name='uid'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>이름</td>";
						table += "<td><input type='text' name='name'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>휴대폰</td>";
						table += "<td><input type='text' name='hp'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td>나이</td>";
						table += "<td><input type='number' name='age'/></td>";
						table += "</tr>";
						table += "<tr>";
						table += "<td colspan='2' align='right'><input type='submit' value='등록'/></td>";
						table += "</tr>";
						table += "</table>";
					
					$('section').append(table);
					
					
				});
				
				
				
				
			});
		
		</script>
		
		
	</head>
	<body>
		<h3>user2 관리자</h3>
		
		<nav></nav>
		<section></section>
		
	</body>
</html>