<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>
	
	<form action="/review/modify" method="post">
		<input type="text" name="mov_rev_title" value="<c:out value="${review.mov_rev_title}" />" placeholder="제목"/>
		<input type="text" name="mov_rev_content" value="<c:out value="${review.mov_rev_content}" />" placeholder="내용"/>
		<input type="text" name="mov_sco_point" value="<c:out value="${review.mov_sco_point}" />" placeholder="점수"/>
		<input type="hidden" name="mov_rev_num" value="<c:out value="${review.mov_rev_num}" />"/>
		<input type="hidden" name="mov_num" value="<c:out value="${mov_num}" />"/>
		<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
		<button value="submit">등록하기</button>
	</form>
	
<%@include file="../includes/footer.jsp"%>