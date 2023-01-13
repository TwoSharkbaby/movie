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
<title>접근권한 없음</title>
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
	text-align: center;
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
	
	<main class="m-auto">
	<h1 class="mb-5">접근권한이 없습니다</h1>
	<h1>관리자에게 문의하세요</h1>
	</main>

</body>
</html>