<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>로그아웃 페이지</title>
<script src="/resources/jquery-3.6.3.min.js"></script>
</head>
<body style="background-color: #000;">
	
	<form class="logout" action="/logout" method='post' hidden>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<button>로그아웃</button>
	</form>
	
<script type="text/javascript">
$(document).ready(function() {

	var logout = $(".logout");
	logout.submit();
	
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