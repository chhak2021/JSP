<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="./_header.jsp"/>
<script src="/Jboard2/js/emailAuth.js"></script>
<script>
	
	$(function(){
		
		$('.btnNext').click(function(e){
			e.preventDefault();
			
			if(!isEmailAuthOk){
				alert('이메일 인증을 하십시요.');
				return;
			}
			
			let uid  = $('input[name=uid]').val();
			let email = $('input[name=email]').val();
			
			let jsonData = {
				"uid": uid,
				"email": email
			};
			
			$.ajax({
				url: '/Jboard2/user/findPw.do',
				type: 'post',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					
					if(data.result > 0){
						location.href = "/Jboard2/user/findPwChange.do";
					}else{
						alert('일치하는 회원이 없습니다.\n아이디와 이메일을 다시 확인 하시기 바랍니다.');
					}
					
				}
			});
			
		});
		
	});

</script>
<main id="user">
    <section class="find findPw">
        <form action="#">
            <table border="0">
                <caption>비밀번호 찾기</caption>                        
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="uid" placeholder="아이디 입력"/></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                        <div>
                            <input type="email" name="email" placeholder="이메일 입력"/>
                            <span class="resultEmail"></span>
                            <button type="button" class="btnAuth" id="btnEmail">인증번호 받기</button>
                        </div>
                        <div>
                            <input type="text" name="auth" placeholder="인증번호 입력"/>
                            <button type="button" class="btnConfirm" id="btnEmailConfirm">확인</button>
                        </div>
                    </td>
                </tr>                        
            </table>                                        
        </form>
        
        <p>
            비밀번호를 찾고자 하는 아이디와 이메일을 입력해 주세요.<br>                    
            회원가입시 입력한 아이디와 이메일 주소가 같아야, 인증번호를 받을 수 있습니다.<br>
            인증번호를 입력 후 확인 버튼을 누르세요.
        </p>

        <div>
            <a href="/Jboard2/user/login.do" class="btn btnCancel">취소</a>
            <a href="/Jboard2/user/findPwChange.do" class="btn btnNext">다음</a>
        </div>
    </section>
</main>
<jsp:include page="./_footer.jsp"/>