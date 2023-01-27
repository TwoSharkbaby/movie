<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>회원정보 수정</title>
<script src="/resources/jquery-3.6.3.min.js"></script>
<link href="/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/examples/sign-in/" rel="canonical" >
<link href="/resources/dist/css/signin.css" rel="stylesheet">
<style>
.bd-placeholder-img {
	font-size: 1.125rem;
	text-anchor: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	user-select: none;
}

@media ( min-width : 768px) {
	.bd-placeholder-img-lg {
		font-size: 3.5rem;
	}
}

.bi {
	vertical-align: -.125em;
	fill: currentColor;
}

.nav-scroller {
	position: relative;
	z-index: 2;
	height: 2.75rem;
	overflow-y: hidden;
}

.nav-scroller .nav {
	display: flex;
	flex-wrap: nowrap;
	padding-bottom: 1rem;
	margin-top: -1px;
	overflow-x: auto;
	text-align: center;
	white-space: nowrap;
	-webkit-overflow-scrolling: touch;
}

header {
	position: fixed;
	width: 100%;
	top: 0px;
}

a {
	color: #fff;
	text-decoration: none;
}

ul {
	list-style: none;
}

li {
	color: #fff;
}

h1 {
	color: #fff;
	text-align: left;
}

h2 {
	color: #fff;
	text-align: left;
	margin-left: 200px;
}

.textone11 {
	font-size: 25px;
	color: #f00;
}

.textone {
	color: #f00;
}

.texttwo {
	color: #fff;
}

header {
	position: fixed;
	top: 0px;
}

.right-margin {
	margin-right: 50px;
}

.line1 {
	border: solid 1px #fff;
	position: relative;
	left: -130px;
	padding: 30%;
	border-width: 100%;
	width: 160%;
	margin: 10px;
	border-top: none;
}
</style>
</head>

<body style="background-color: #000;" class="text-center">

	<header>
		<div class="container">
			<div style="position: absolute; right: 100px; padding: 10px;">
				<div class="text-end">
					<a href="/">&nbsp;&nbsp;</a> <a href="/">&nbsp;&nbsp;</a>
				</div>
			</div>
			<div class="text-end" style="position: absolute; left: 90px; padding: 25px;">
				<a href="/" class="d-flex align-items-center mb-lg-0 text-decoration-none textone11"><img src="/resources/img/img_logo.png" alt="LOGO 이미지"></a>
			</div>
		</div>
	</header>
    
    <main class="form-signin w-100 m-auto">

		<form id="regForm" method="post" action="/customModify">
			<fieldset>
				<h1 class="h3 mb-3 fw-bold">회원정보 수정</h1>
				<div class="form-floating mb-3">
					<input type="password" class="form-control rounded-3 mem_pw" id="floatingInput" placeholder="비밀번호" name="mem_pw"> 
					<label for="floatingInput" class="fw-bold">비밀번호(4~12자리)</label>
					<div id="pw_check"></div>
				</div>
				<div class="form-floating mb-3">
					<input type="password" class="form-control rounded-3 mem_pw2" id="floatingInput" placeholder="비밀번호 확인" name="mem_pw2"> 
					<label for="floatingInput" class="fw-bold">비밀번호 확인</label>
					<div id="pw2_check"></div>
				</div>
				<div class="row g-0 text-center">
					<div class="col-9">
						<div class="form-floating mb-3">
						<input type="text" class="form-control rounded-3 mem_nickname" id="floatingInput" placeholder="닉네임" name="mem_nickname" value="<c:out value="${member.mem_nickname}"/>">
						<label for="floatingInput" class="fw-bold">닉네임(2~16자리)</label>
					<div id="nickname_check"></div>
						</div>
					</div>
					<div class="col-3">
						<button type="button" id="nicknameCheck" class="btn btn-secondary" style="height:3.6em;">중복 확인</button>
					</div>
				</div>
				<div class="form-floating mb-3">
					<input type="email" class="form-control rounded-3 mem_email" id="floatingPassword" placeholder="이메일" name="mem_email" value="<c:out value="${member.mem_email}"/>">
					<label for="floatingInput" class="fw-bold">이메일</label>
					<div id="email_check"></div>
				</div>
				<div class="form-floating mb-3">
					<input type="text" class="form-control rounded-3 mem_contact" id="floatingPassword" placeholder="연락처" name="mem_contact" value="<c:out value="${member.mem_contact}"/>"> 
					<label for="floatingInput" class="fw-bold">연락처(-는 생략)</label>
					<div id="phone_check"></div>
				</div>
				<button class="w-100 fw-bold btn btn-lg btn-danger mb-3" type="submit">수정 완료</button>
				<input type="hidden" name="mem_num" value="<c:out value="${member.mem_num}"/>" />
				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			</fieldset>
		</form>
	</main>
	
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
	
	$(".btn-danger").on("click", function(e) {
		e.preventDefault();
		
		// 비밀번호가 같은 경우 && 비밀번호 정규식
		if (($('.mem_pw').val() == ($('.mem_pw2').val()))
				&& pwJ.test($('.mem_pw').val())) {
			inval_Arr[0] = true;
		} else {
			inval_Arr[0] = false;
		}
		// 닉네임 정규식
		if (nicknameJ.test($('.mem_nickname').val())) {
			inval_Arr[1] = true;	
		} else {
			inval_Arr[1] = false;
		}
		// 이메일 정규식
		if (mailJ.test($('.mem_email').val())){
			inval_Arr[2] = true;
		} else {
			inval_Arr[2] = false;
		}
		// 휴대폰번호 정규식
		if (phoneJ.test($('.mem_contact').val())) {
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
		
		var mem_nickname = $('.mem_nickname').val();
		
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
	
	$('.mem_nickname').change(function(){
		nicknameCheck = false;
	});
	
	$(".mem_pw").blur(function(){
		if(pwJ.test($(".mem_pw").val())){
			$("#pw_check").text("");
		} else {
			$("#pw_check").text("숫자 or 문자로만 4~12자리 입력");
			$("#pw_check").css("color", "red");
		}
	});
	
	$(".mem_pw2").blur(function(){
		if($(".mem_pw").val() != $(this).val()){
			$("#pw2_check").text("비밀번호가 일치하지 않습니다");
			$("#pw2_check").css("color", "red");
		} else {
			$("#pw2_check").text("");
		}
	});
	
	$(".mem_nickname").blur(function() {
		if (nicknameJ.test($(this).val())) {
			$("#nickname_check").text('');
		} else {
			$('#nickname_check').text('닉네임을 확인해주세요');
			$('#nickname_check').css('color', 'red');
		}
	});
	
	$('.mem_email').blur(function(){
		if(mailJ.test($(this).val())){
			$("#email_check").text('');
		} else {
			$('#email_check').text('이메일을 확인해주세요 :)');
			$('#email_check').css('color', 'red');
		}
	});

	$('.mem_contact').blur(function(){
		if(phoneJ.test($(this).val())){
			$("#phone_check").text('');
		} else {
			$('#phone_check').text('휴대폰번호를 확인해주세요 :)');
			$('#phone_check').css('color', 'red');
		}
	});


});
</script>

</body>

</html>
