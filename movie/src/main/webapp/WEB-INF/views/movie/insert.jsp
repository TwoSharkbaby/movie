<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	
	<form action="/movie/insert" method="post">
		<input type="text" name="mov_title" placeholder="제목"/>
		<input type="text" name="mov_director" placeholder="감독"/>
		<input type="text" name="mov_genre" placeholder="장르"/>
		<input type="text" name="mov_synopsis" placeholder="줄거리"/>
		<input type="date" name="mov_release" />
		<input type="time" name="mov_runtime"/>
		<input type="text" name="mov_img"/>
		<input type="text" name="mov_thumb"/>
		<input type="text" name="mov_nickname"  placeholder="닉네임"/>
		<button value="submit">등록하기</button>
	</form>
</body>
</html>