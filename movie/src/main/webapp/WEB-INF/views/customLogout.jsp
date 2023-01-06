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
<title>Insert title here</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<h1>Logout Page</h1>
	<form class="logout" action="/logout" method='post'>
		<input type="hidden" name="${_csrf.parameterName}"
			value="${_csrf.token}" />
		<button>로그아웃</button>
	</form>
	
<script type="text/javascript">
$(document).ready(function() {
	
	var result = '<c:out value="${result}"/>';
	
	console.log(result);

	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) {
			return;
		} else {
			alert(result);
		}

	};

	var logout = $(".logout");
	logout.submit();
	
});
</script>
</body>
</html>