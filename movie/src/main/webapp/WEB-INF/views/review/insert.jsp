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
	
	<form action="/review/insert" method="post">
		<input type="text" name="mov_rev_title" placeholder="제목"/>
		<input type="text" name="mov_rev_content" placeholder="내용"/>
		<input type="text" name="mov_sco_point" placeholder="점수"/>
		<input type="text" name="mem_num" value="1" placeholder="작성자"/>
		<input type="hidden" name="mov_num" value="<c:out value="${mov_num}" />"/>
		<button value="submit">등록하기</button>
	</form>
	
</body>
</html>