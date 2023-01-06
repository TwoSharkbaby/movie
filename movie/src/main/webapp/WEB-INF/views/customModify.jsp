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
						<form method="post" action="/customModify">
							<fieldset>
								<div class="form-group">
									비밀번호<input class="form-control" placeholder="Password"
										name="mem_pw" type="password" value="">
								</div>
								<div class="form-group">
									닉네임<input class="form-control" type="text" name="mem_nickname" 
									value="<c:out value="${member.mem_nickname}"/>"/> 
								</div>
								<div class="form-group">
									이메일<input class="form-control" placeholder="Email" 
									name="mem_email" value="<c:out value="${member.mem_email}"/>">
								</div>
								<div class="form-group">
									연락처<input class="form-control" placeholder="Phone" 
									name="mem_contact" value="<c:out value="${member.mem_contact}"/>">
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
		var result = '<c:out value="${result}"/>';

		checkModal(result);

		history.replaceState({}, null, null);

		function checkModal(result) {

			if (result === '' || history.state) {
				return;
			} else {
				alert(result);
			}

		};
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
