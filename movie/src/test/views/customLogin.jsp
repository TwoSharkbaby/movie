<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
<meta name="generator" content="Hugo 0.104.2">
<title>로그인 페이지</title>
<script src="/resources/jquery-3.6.3.min.js"></script>
<link href="/resources/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://getbootstrap.com/docs/5.2/examples/sign-in/" rel="canonical" >
<link href="/resources/dist/css/signin.css" rel="stylesheet">
</head>

<body style="background-color: #000;" class="text-center">

  <header>
    <div class="container">
      <div style="position: absolute; right: 100px; padding: 0px;">>
        <div class="text-end">
          <a href="/">&nbsp;&nbsp;</a>
          <a href="/">&nbsp;&nbsp;</a>
        </div>
      </div>
        <div class="text-end" style="position: absolute; left: 90px; padding: 25px;">
            <a href="/"><img src="/resources/img/img_logo.png" alt="LOGO 이미지"></a>
        </div>
    </div>
  </header>
  
  <main class="form-signin w-100 m-auto">
  
    <form id="regForm" role="form" method="post" action="/login">
      <div class="form-floating mb-3">
        <input type="text" class="form-control rounded-3" id="floatingInput" placeholder="아이디" name="username">
        <label for="floatingInput" class="fw-bold">아이디</label>
      </div>
      <div class="form-floating mb-3">
        <input type="password" class="form-control rounded-3" id="floatingPassword" placeholder="비밀번호" name="password">
        <label for="floatingPassword" class="fw-bold">비밀번호</label>
      </div>

      <div class="checkbox mb-3">
        <label>
          <p class="mt-1 mb-1 text-muted text-start">
          <input name="remember-me" type="checkbox">&nbsp;자동로그인
          </p>
        </label>
      </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
      <button class="w-100 fw-bold btn btn-lg btn-danger" type="submit">로그인</button>
      <table>
        <ul>
         <p class="mt-5 mb-3 text-muted"><p><li class="fw-bold">처음 방문하셨나요?<a href="/customSingup" class="text1 ">&nbsp;&nbsp;회원가입 하러가기</a></li></p>
      </ul>
    </table>
    </form>
    
  </main>
	
<script type="text/javascript">
	$(document).ready(function() {
		var regForm = $('#regForm');
		$("#regForm .btn-danger").on("click", function(e) {
			e.preventDefault();
			if (!regForm.find("input[name='username']").val()) {
				alert("아이디를 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='password']").val()) {
				alert("비밀번호를 입력해주세요!");
				return false;
			}
			regForm.submit();
		});
		
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
				return;
			} else {
				alert(result);
			}

		}

	});
</script>

</body>

</html>
