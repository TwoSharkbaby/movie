<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>
	
	<form id="regForm" action="/review/modify" method="post">
		<input type="text" name="mov_rev_title" value="<c:out value="${review.mov_rev_title}" />" placeholder="제목"/>
		<input type="text" name="mov_rev_content" value="<c:out value="${review.mov_rev_content}" />" placeholder="내용"/>
		<input type="text" name="mov_sco_point" value="<c:out value="${review.mov_sco_point}" />" placeholder="점수"/>
		<input type="hidden" name="mov_rev_num" value="<c:out value="${review.mov_rev_num}" />"/>
		<input type="hidden" name="mov_num" value="<c:out value="${review.mov_num}" />"/>
		<input type="hidden" name="mem_num" value="<c:out value="${principal.member.mem_num}"/>" />
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<button value="submit">등록하기</button>
	</form>
	
	<script type="text/javascript">
	$(document).ready(function() {
		var regForm = $('#regForm');
		$("#regForm button").on("click", function(e) {
			e.preventDefault();
			if (!regForm.find("input[name='mov_rev_title']").val()) {
				alert("제목을 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mov_rev_content']").val()) {
				alert("내용을 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mov_sco_point']").val()) {
				alert("점수를 입력해주세요!");
				return false;
			}
			regForm.submit();
		});

	});
</script>
	
<%@include file="../includes/footer.jsp"%>