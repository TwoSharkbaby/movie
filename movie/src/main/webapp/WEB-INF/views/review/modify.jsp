<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<style>
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
</style>

<%@include file="../includes/header.jsp"%>

<main class="form-signin mt-5 mb-5 w-100 m-auto">
	<form id="regForm" action="/review/modify" method="post" style="width:50em;" class="m-auto">
		<fieldset>
			<h1 class="h3 mb-3 fw-bold">리뷰 등록</h1>
			<div id="myform" class="mb-4">
				<fieldset>
					<legend>별점</legend>
					<input type="radio" name="mov_sco_point" value="5" id="rate1"><label for="rate1">⭐</label>
     	 		    <input type="radio" name="mov_sco_point" value="4" id="rate2"><label for="rate2">⭐</label>
		     	    <input type="radio" name="mov_sco_point" value="3" id="rate3"><label for="rate3">⭐</label>
		     	    <input type="radio" name="mov_sco_point" value="2" id="rate4"><label for="rate4">⭐</label>
		     	    <input type="radio" name="mov_sco_point" value="1" id="rate5"><label for="rate5">⭐</label>
     		    </fieldset>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control rounded-3" id="floatingInput" name="mov_rev_title" placeholder="리뷰 제목" value="<c:out value="${review.mov_rev_title}" />"/> 
				<label for="floatingInput" class="fw-bold">리뷰 제목</label>
			</div>
			<div class="form-floating mb-3">
				<textarea class="form-control rounded-3" name="mov_rev_content" placeholder="리뷰 내용" style="height:250px;" ><c:out value="${review.mov_rev_content}" /></textarea>
				<label for="floatingInput" class="fw-bold">리뷰 내용</label>
			</div>
			<div class="form-floating mb-3">
				<input type="text" class="form-control rounded-3" id="floatingInput" name="mem_nickname" value="<c:out value="${principal.member.mem_nickname}"/>" readonly />
				<label for="floatingInput" class="fw-bold">닉네임</label>
			</div>
			<input type="hidden" name="mov_rev_num" value="<c:out value="${review.mov_rev_num}" />"/>
			<input type="hidden" name="mov_num" value="<c:out value="${review.mov_num}" />"/>
			<input type="hidden" name="mem_num" value="<c:out value="${principal.member.mem_num}"/>" />
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			<button value="submit" class="btn btn-danger mt-3" >등록하기</button>
		</fieldset>
	</form>
</main>
	
<script type="text/javascript">
	$(document).ready(function() {
		var regForm = $('#regForm');
		$("#regForm button").on("click", function(e) {
			e.preventDefault();
			if (!regForm.find("input[name='mov_rev_title']").val()) {
				alert("제목을 입력해주세요!");
				return false;
			}
			if (!regForm.find("textarea[name='mov_rev_content']").val()) {
				alert("내용을 입력해주세요!");
				return false;
			}
			if (!regForm.find("input[name='mov_sco_point']:checked").val()) {
				alert("점수를 입력해주세요!");
				return false;
			} 
			regForm.submit();
		});

	});
</script>
	
<%@include file="../includes/footer.jsp"%>