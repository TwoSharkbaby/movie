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
						<h3 class="panel-title">회원가입하기</h3>
					</div>
					<div class="panel-body">
						<form id="regForm" method="post" action="/customSingup">
							<fieldset>
								<div class="form-group">
									<input class="form-control" placeholder="ID" name="mem_id"
										type="text" autofocus>
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Password"
										name="mem_pw" type="password" value="">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Username" type="text" name="mem_name">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Nickname" type="text" name="mem_nickname">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Email" type="text" name="mem_email">
								</div>
								<div class="form-group">
									<input class="form-control" placeholder="Phone" type="text" name="mem_contact">
								</div>
								<button type="submit" class="btn btn-lg btn-success btn-block">회원가입</button>
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
		var regForm = $('#regForm');
		$("#regForm .btn-success").on("click", function(e) {
			e.preventDefault();
			if (!regForm.find("input[name='mem_id']").val()) {
				alert("아이디를 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mem_pw']").val()) {
				alert("비밀번호를 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mem_name']").val()) {
				alert("이름을 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mem_nickname']").val()) {
				alert("닉네임을 입력해주세요!");
				return false;
			}
			if(!regForm.find("input[name='mem_email']").val()){
				alert("이메일을 등록해주세요!");
				return false;
			}
			if(!regForm.find("input[name='mem_contact']").val()){
				alert("연락처를 입력해주세요!");
				return false;
			}
			regForm.submit();
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
