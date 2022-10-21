<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="./_header.jsp" %>

<script>
	// 데이터 검증에 사용하는 정규표현식
	let reUid   = /^[a-z]+[a-z0-9]{5,19}$/g;
	let rePass  = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{5,16}$/;
	let reName  = /^[가-힣]+$/ 
	let reNick  = /^[a-zA-Zㄱ-힣0-9][a-zA-Zㄱ-힣0-9]*$/;
	let reEmail = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
	let reHp    = /^01(?:0|1|[6-9])-(?:\d{4})-\d{4}$/;
	
	// 폼 데이터 검증 결과 상태변수
	let isUidOk   = false;
	let isPassOk  = false;
	let isNameOk  = false;
	let isNickOk  = false;
	let isEmailOk = false;
	let isHpOk 	  = false;
	
	$(function(){
		
		// 아이디 검사하기
		$('#btnIdCheck').click(function(){
			
			let uid = $('input[name=uid]').val();
			
			if(!reUid.test(uid)){				
				$('.uidResult').css('color', 'red').text('유효한 아이디가 아닙니다.');
				isUidOk = false;
				return;
			}
			
			let jsonData = {
				"uid": uid
			};
			
			$.ajax({
				url: './proc/checkUid.jsp',
				method: 'get',
				data: jsonData,
				dataType: 'json',
				success: function(data){
					if(data.result == 0){
						$('.uidResult').css('color', 'green').text('사용 가능한 아이디 입니다.');
						isUidOk = true;
					}else{
						$('.uidResult').css('color', 'red').text('이미 사용중인 아이디 입니다.');
						isUidOk = false;
					}					
				}				
			});
		});
		
		// 비밀번호 검사하기
		$('input[name=pass2]').focusout(function(){
			
			let pass1 = $('input[name=pass1]').val();
			let pass2 = $('input[name=pass2]').val();
			
			if(rePass.test(pass2)){
				
				if(pass1 == pass2){
					isPassOk = true;
					$('.passResult').css('color', 'green').text('사용하실 수 있는 비밀번호 입니다.');
				}else{
					isPassOk = false;
					$('.passResult').css('color', 'red').text('비밀번호가 일치하지 않습니다.');	
				}
				
			}else{
				isPassOk = false;
				$('.passResult').css('color', 'red').text('숫자,영문,특수문자 포함 5자리 이상 이어야 합니다.');
			}			
			
		});
		
		// 이름 검사하기
		$('input[name=name]').focusout(function(){
			
			let name = $(this).val();
			
			if(reName.test(name)){
				isNameOk = true;
				$('.nameResult').text('');
			}else{
				isNameOk = false;
				$('.nameResult').css('color', 'red').text('유효한 이름이 아닙니다.');
			}			
		});
		
		// 별명 검사하기
		$('input[name=nick]').focusout(function(){
			
			let nick = $(this).val();
			
			if(reNick.test(nick)){
				isNickOk = true;
				$('.nickResult').text('');
			}else{
				isNickOk = false;
				$('.nickResult').css('color', 'red').text('유효하지 않는 별명입니다.');
			}			
		});
		
		// 이메일 검사하기
		$('input[name=email]').focusout(function(){
			
			let email = $(this).val();
			
			if(reEmail.test(email)){
				isEmailOk = true;
				$('.emailResult').text('');
			}else{
				isEmailOk = false;
				$('.emailResult').css('color', 'red').text('유효하지 않는 이메일 입니다.');
			}			
		});
		
		// 휴대폰 검사하기
		$('input[name=hp]').focusout(function(){
			
			let hp = $(this).val();
			
			if(reHp.test(hp)){
				isHpOk = true;
				$('.hpResult').text('');
			}else{
				isHpOk = false;
				$('.hpResult').css('color', 'red').text('유효하지 않는 휴대폰 입니다.');
			}			
		});
		
		
		// 최종 폼 전송할 때
		$('.register > form').submit(function(){
			
			// 아이디 검증
			if(!isUidOk){
				alert('아이디가 유효하지 않습니다.');
				return false;
			}
			
			// 비밀번호 검증
			if(!isPassOk){
				alert('비밀번호가 유효하지 않습니다.');
				return false;
			}
			
			// 이름 검증
			if(!isNameOk){
				alert('이름이 유효하지 않습니다.');
				return false;
			}
			
			// 별명 검증
			if(!isNickOk){
				alert('별명이 유효하지 않습니다.');
				return false;
			}
			
			// 이메일 검증
			if(!isEmailOk){
				alert('이메일이 유효하지 않습니다.');
				return false;
			}
			
			// 휴대폰 검증
			if(!isHpOk){
				alert('휴대폰이 유효하지 않습니다.');
				return false;
			}
			
			return true;
		});	
	});

</script>



<main id="user">
    <section class="register">

        <form action="/Jboard1/user/proc/registerProc.jsp" method="post">
            <table border="1">
                <caption>사이트 이용정보 입력</caption>
                <tr>
                    <td>아이디</td>
                    <td>
                        <input type="text" name="uid" placeholder="아이디 입력"/>
                        <button type="button" id="btnIdCheck"><img src="/Jboard1/img/chk_id.gif" alt="중복확인"/></button>
                        <span class="uidResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="pass1" placeholder="비밀번호 입력"/></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td>
                    	<input type="password" name="pass2" placeholder="비밀번호 입력 확인"/>
                    	<span class="passResult"></span>
                    </td>
                </tr>
            </table>

            <table border="1">
                <caption>개인정보 입력</caption>
                <tr>
                    <td>이름</td>
                    <td>
                        <input type="text" name="name" placeholder="이름 입력"/>
                        <span class="nameResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>별명</td>
                    <td>
                        <p class="nickInfo">공백없는 한글, 영문, 숫자 입력</p>
                        <input type="text" name="nick" placeholder="별명 입력"/>
                        <button type="button"><img src="/Jboard1/img/chk_id.gif" alt="중복확인"/></button>
                        <span class="nickResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td>
                    	<input type="email" name="email" placeholder="이메일 입력"/>
                    	<span class="emailResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>휴대폰</td>
                    <td>
                    	<input type="text" name="hp" placeholder="휴대폰 입력"/>
                    	<span class="hpResult"></span>
                    </td>
                </tr>
                <tr>
                    <td>주소</td>
                    <td>
                        <input type="text" name="zip" placeholder="우편번호"/>
                        <button type="button"><img src="/Jboard1/img/chk_post.gif" alt="우편번호찾기"/></button>
                        <input type="text" name="addr1" placeholder="주소 검색"/>
                        <input type="text" name="addr2" placeholder="상세주소 입력"/>
                    </td>
                </tr>
            </table>

            <div>
                <a href="/Jboard1/user/login.jsp" class="btn btnCancel">취소</a>
                <input type="submit" value="회원가입" class="btn btnRegister"/>
            </div>

        </form>

    </section>
</main>
<%@ include file="./_footer.jsp" %>