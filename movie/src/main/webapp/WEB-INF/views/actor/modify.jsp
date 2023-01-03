<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>
	
	<form action="/actor/modify" method="post">
		<input type="text" name="act_name" placeholder="이름"/>
		<input type="date" name="act_birth" placeholder="생일"/>
		<input type="text" name="act_sex" placeholder="성별"/>
		<input type="text" name=act_info placeholder="정보"/>
		<input type="text" name=act_img placeholder="이미지"/>
		<input type="text" name=act_thumb placeholder="섬네일"/>
		<input type="hidden" name="act_num" value="<c:out value="${actor.act_num}" />"/>
		<input type="hidden" name="mov_num" value="<c:out value="${actor.mov_num}" />"/>
		<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
		<button value="submit">등록하기</button>
	</form>
	
<%@include file="../includes/footer.jsp"%>