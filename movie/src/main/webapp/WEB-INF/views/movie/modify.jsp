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
	
	<form action="/movie/modify" method="post">
		<input type="text" name="mov_title" value="<c:out value="${movie.mov_title}"/>" placeholder="제목"/>
		<input type="text" name="mov_director" value="<c:out value="${movie.mov_director}"/>" placeholder="감독"/>
		<input type="text" name="mov_genre" value="<c:out value="${movie.mov_genre}"/>" placeholder="장르"/>
		<input type="text" name="mov_synopsis" value="<c:out value="${movie.mov_synopsis}"/>" placeholder="줄거리"/>
		<input type="date" name="mov_release" value="<c:out value="${movie.mov_release}"/>" />
		<input type="time" name="mov_runtime" value="<c:out value="${movie.mov_runtime}"/>"/>
		<input type="text" name="mov_img" value="<c:out value="${movie.mov_img}"/>"/>
		<input type="text" name="mov_thumb" value="<c:out value="${movie.mov_thumb}"/>"/>
		<input type="hidden" name="mov_num" value="<c:out value="${movie.mov_num}"/>">
		<button value="submit">수정완료</button>
	</form>
	
</body>
</html>