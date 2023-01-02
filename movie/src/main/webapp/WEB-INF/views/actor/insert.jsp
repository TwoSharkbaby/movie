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
	
	<form action="/actor/insert" method="post">
		<input type="text" name="act_name" placeholder="이름"/>
		<input type="date" name="act_birth" placeholder="생일"/>
		<input type="text" name="act_sex" placeholder="성별"/>
		<input type="text" name=act_info placeholder="정보"/>
		<input type="text" name=act_img placeholder="이미지"/>
		<input type="text" name=act_thumb placeholder="섬네일"/>
		<input type="hidden" name="mov_num" value="<c:out value="${mov_num}" />"/>
		<button value="submit">등록하기</button>
	</form>
	
</body>
</html>