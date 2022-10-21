/**
 * 
 */

function register(){
 
	$(function(){
		
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
			table += "<td colspan='2' align='right'><input type='submit' id='btnRegister' value='등록'/></td>";
			table += "</tr>";
			table += "</table>";
		
		$('section').append(table);
		
	});

}