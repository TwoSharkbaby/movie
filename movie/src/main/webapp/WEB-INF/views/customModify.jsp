<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
img {
	width: 100px;
	height: 100px;
}
</style>
</head>

<body>

	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">회원수정하기</h3>
					</div>
					<div class="panel-body">
						<form id="regForm" method="post" action="/customModify">
							<fieldset>
								<div class="form-group">
									비밀번호<input class="form-control" placeholder="Password"
										id="user_pw" name="mem_pw" type="password" >
										<div>4~12자리</div>
										<div id="pw_check"></div>
								</div>
								<div class="form-group">
									비밀번호<input class="form-control" placeholder="Password2"
										id="user_pw2" name="mem_pw2" type="password" >
										<div id="pw2_check"></div>
								</div>
								<div class="form-group">
									닉네임<input class="form-control" type="text" name="mem_nickname" 
									id="user_nickname" type="text" value="<c:out value="${member.mem_nickname}"/>"/> 
									<div>2~16자리</div><button type="button" id="nicknameCheck">닉네임 중복 확인</button></div>
									<div id="nickname_check"></div>
								</div>
								<div class="form-group">
									이메일<input class="form-control" placeholder="Email" id="user_email"
									type="text" name="mem_email" value="<c:out value="${member.mem_email}"/>">
									<div id="email_check"></div>
								</div>
								<div class="form-group">
									연락처<input class="form-control" placeholder="Phone" id="user_phone"
									type="text" name="mem_contact" value="<c:out value="${member.mem_contact}"/>">
									<div>10~11자리(-를 생략하고)</div>
									<div id="phone_check"></div>
								</div>
								<button type="submit" class="btn btn-lg btn-success btn-block">회원수정</button>
								<input type="hidden" name="mem_num" value="<c:out value="${member.mem_num}"/>" />
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
							</fieldset>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
<script type="text/javascript">
$(document).ready(function() {
	
	//모든 공백 체크 정규식
	var empJ = /\s/g;
	// 비밀번호 정규식
	var pwJ = /^[A-Za-z0-9]{4,12}$/; 
	// 닉네임 정규식
	var nicknameJ = /^(?=.*[a-z0-9가-힣])[a-z0-9가-힣]{2,16}$/;
	// 이메일 검사 정규식
	var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	// 휴대폰 번호 정규식
	var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;
	
	var inval_Arr = new Array(5).fill(false);
	var regForm = $('#regForm');
	var nicknameCheck = true;
	
	$(".btn-success").on("click", function(e) {
		e.preventDefault();
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('#user_pw').val() == ($('#user_pw2').val()))
				&& pwJ.test($('#user_pw').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
		}
		// 닉네임 정규식
		if (nicknameJ.test($('#user_nickname').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
		}
		// 이메일 정규식
		if (mailJ.test($('#user_email').val())){
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
		}
		// 휴대폰번호 정규식
		if (phoneJ.test($('#user_phone').val())) {
			inval_Arr[3] = true;
		} else {
			inval_Arr[3] = false;
		}
		// 닉네임 중복 체크
		if (nicknameCheck) {
			inval_Arr[4] = true;
		} else {
			inval_Arr[4] = false;
			alert("닉네임 중복 확인을 눌러주세요");
		}

		var validAll = true;
		for(var i = 0; i < inval_Arr.length; i++){
			
			if(inval_Arr[i] == false){
				validAll = false;
			}
		}
		
		if(validAll){ // 유효성 모두 통과
			regForm.submit();
		} else{
			alert('입력한 정보들을 다시 한번 확인해주세요 :)')
		}	 
		
	});
	
	$('#nicknameCheck').on("click", function(e) {
		e.preventDefault();
		
		var mem_nickname = $('#user_nickname').val();
		console.log(mem_nickname);
		
		$.ajax({
			type : "GET",
			url : "/nicknameCheck/" + mem_nickname,
			contentType : "application/json; charset=utf-8", 
			dataType : "json"
			}).done(function(response) { 
				if(response == false){
					nicknameCheck = true;
					alert("사용 가능한 닉네임 입니다");
				} else {
					alert("이미 사용중인 닉네임 입니다");
				}
			}).fail(function(error) {
				alert("올바른 경로가 아닙니다");
			});

	});
	
	$('#user_nickname').change(function(){
		nicknameCheck = false;
	});
	
	$("#user_pw").blur(function(){
		if(pwJ.test($("#user_pw").val())){
			console.log("true");
			$("#pw_check").text("");
		} else {
			console.log("false");
			$("#pw_check").text("숫자 or 문자로만 4~12자리 입력");
			$("#pw_check").css("color", "red");
		}
	});
	
	$("#user_pw2").blur(function(){
		if($("#user_pw").val() != $(this).val()){
			$("#pw2_check").text("비밀번호가 일치하지 않습니다");
			$("#pw2_check").css("color", "red");
		} else {
			$("#pw2_check").text("");
		}
	});
	
	$("#user_nickname").blur(function() {
		if (nicknameJ.test($(this).val())) {
				console.log(nicknameJ.test($(this).val()));
				$("#nickname_check").text('');
		} else {
			$('#nickname_check').text('닉네임을 확인해주세요');
			$('#nickname_check').css('color', 'red');
		}
	});
	
	$('#user_email').blur(function(){
		if(mailJ.test($(this).val())){
			console.log(mailJ.test($(this).val()));
			$("#email_check").text('');
		} else {
			$('#email_check').text('이메일을 확인해주세요 :)');
			$('#email_check').css('color', 'red');
		}
	});

	$('#user_phone').blur(function(){
		if(phoneJ.test($(this).val())){
			console.log(phoneJ.test($(this).val()));
			$("#phone_check").text('');
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
			$('#phone_check').css('color', 'red');
		}
	});


});
</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

</body>

</html>
