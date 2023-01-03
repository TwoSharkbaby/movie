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

	<sec:authentication property="principal" var="principal" />

	<sec:authorize access="isAuthenticated()">
		<h1>
			아이디 : <c:out value="${principal.username}"></c:out>
		</h1>
		<h1>
			권한 : <c:out value="${principal.authorities}"></c:out>
		</h1>
		<a href="/customLogout"><button>Logout</button></a>
	</sec:authorize>
	<sec:authorize access="isAnonymous()">
		<a href="/customLogin"><button>Login</button></a>
	</sec:authorize>

	<h1>헤더임</h1>

	<hr />