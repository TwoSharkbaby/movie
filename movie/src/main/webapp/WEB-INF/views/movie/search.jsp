<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<h1 class="mt-5 ms-4">검색결과 : <c:out value="${pageMaker.cri.keyword}" /> 와 관련된 영화</h1>

<div class="mt-3 ms-5">
		<c:choose>
			<c:when test="${empty list}">
				<li>
					<ul>[없음]</ul>
				</li>
			</c:when>
			<c:when test="${!empty list}">
				<c:forEach items="${list}" var="movie">
					<li class="main-movie m-3"><a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'>
						<div class="main-movie-image">
							<div class=" movie-image-src num1">
								<img src='/imgs/<c:out value="${movie.mov_thumb}" />' class="movie-image-url num2"> 
							</div>
						</div>
							<div class="movie-info">
								<div class="movie-title">제목: <c:out value="${movie.mov_title}" /></div>
								<div class="movie-detail-info">개봉일: <fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" /></div>
								<div class="movie-detail-info">장르: <c:out value="${movie.mov_genre}" /></div>
								<div class="movie-detail-info">감독: <c:out value="${movie.mov_director}" /></div>
							</div>
						
					</a></li>
				</c:forEach>
			</c:when>
		</c:choose>
</div>

<div class="mt-5">
	<nav aria-label="Page navigation example">
 		<ul class="pagination justify-content-center">
		<c:if test="${pageMaker.prev}">
			<li id="paginate_button" class="page-item"><a class="page-link"
				href="${pageMaker.startPage - 1}">Previous</a></li>
		</c:if>

		<c:forEach var="num" begin="${pageMaker.startPage}"
			end="${pageMaker.endPage}">
			<li id="paginate_button" class="page-item ${pageMaker.cri.pageNum == num?"active":""}">
				<a class="page-link" href="${num}">${num}</a>
			</li>
		</c:forEach>

		<c:if test="${pageMaker.next}">
			<li id="paginate_button" class="page-item"><a class="page-link"
				href="${pageMaker.endPage + 1}">Next</a></li>
		</c:if>
	    </ul>
	</nav>
</div>

<form id="actionForm" action="/movie/search" method="get">
	<input type="hidden" name="pageNum" value="<c:out value="${pageMaker.cri.pageNum}" />" /> 
	<input type="hidden" name="amount" value="<c:out value="${pageMaker.cri.amount}" />" />
	<input type="hidden" name="type" value="<c:out value="${pageMaker.cri.type}" />" /> 
	<input type="hidden" name="keyword" value="<c:out value="${pageMaker.cri.keyword}" />" />
</form>

<script type="text/javascript">
			
		var actionForm = $("#actionForm");
		$("#paginate_button a").on("click", function(e) {
			e.preventDefault();
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit();
		});
		
		
</script>


<%@include file="../includes/footer.jsp"%>