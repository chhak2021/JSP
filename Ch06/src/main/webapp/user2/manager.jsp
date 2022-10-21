<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>user2 manager</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
		<script src="./js/list.js"></script>
		<script src="./js/register.js"></script>
		<script>
			$(document).ready(function(){
				
				// user2 목록 불러오기
				list();
				
				// user2 목록화면
				$(document).on('click', '#userList', function(e){
					e.preventDefault();
					list();
				});
				
				// user2 등록화면
				$(document).on('click', '#userAdd', function(e){
					e.preventDefault();
					register();
				});
				
				// user2 등록하기
				$(document).on('click', '#btnRegister', function(){
					// 데이터 가져오기
					let uid  = $('input[name=uid]').val();
					let name = $('input[name=name]').val();
					let hp   = $('input[name=hp]').val();
					let age  = $('input[name=age]').val();
					
					// JSON 생성
					let jsonData = {
							"uid":uid,
							"name":name,
							"hp":hp,
							"age":age
							};
					
					console.log(jsonData);
					
					// 전송하기
					$.ajax({
						url: './data/register.jsp',
						method: 'post',
						data: jsonData,
						dataType: 'json',
						success: function(data){
							
							if(data.result == 1){
								alert('입력 성공!');
							}else{
								alert('입력 실패! 아이디가 중복 되었습니다.');
							}
								
						}
					});
					
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