<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Bootstrap demo</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
img {
	width: 100px;
	height: 100px;
}
</style>
</head>
<body>

	<div>
		<form id="searchForm" action="/movie/search" method="get">
			<div>
				<select name="type">
					<option value=""
						<c:out value="${pageMaker.cri.type == null
							?'selected':''}" 
							/>>--</option>
					<option value="T"
						<c:out value="${pageMaker.cri.type eq 'T'
							?'selected':''}" 
							/>>제목</option>
					<option value="G"
						<c:out value="${pageMaker.cri.type eq 'G'
							?'selected':''}" 
							/>>장르</option>
					<option value="D"
						<c:out value="${pageMaker.cri.type eq 'D'
							?'selected':''}" 
							/>>감독</option>
					<option value="A"
						<c:out value="${pageMaker.cri.type eq 'A'
							?'selected':''}" 
							/>>배우</option>
					<option value="TD"
						<c:out value="${pageMaker.cri.type eq 'TD'
							?'selected':''}" 
							/>>제목
						OR 감독</option>
					<option value="GD"
						<c:out value="${pageMaker.cri.type eq 'GD'
							?'selected':''}" 
							/>>장르
						OR 감독</option>
				</select>
			</div>
			<div style="padding: 0px;">
				<input type="text" name="keyword"
					value="<c:out value='${pageMaker.cri.keyword}'/>" />
			</div>
			<div>
				<button>Search</button>
			</div>
			<input type="hidden" name="pageNum"
				value="<c:out value="${pageMaker.cri.pageNum}" />" /> <input
				type="hidden" name="amount"
				value="<c:out value="${pageMaker.cri.amount}" />" />
		</form>
	</div>

	<h1>
		검색명 :
		<c:out value="${pageMaker.cri.keyword}" />
		와 관련된 영화
	</h1>
	<table width="100%">
		<thead>
			<tr>
				<th>영화번호</th>
				<th>영화제목</th>
				<th>감독</th>
				<th>장르</th>
				<th>줄거리</th>
				<th>개봉일</th>
				<th>상영시간</th>
				<th>등록일</th>
				<th>포스터사진</th>
				<th>섬네일사진</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="movie">
						<tr>
							<td><a href='/movie/read/<c:out value="${movie.mov_num}" />'><c:out
										value="${movie.mov_num}" /></a></td>
							<td><c:out value="${movie.mov_title}" /></td>
							<td><c:out value="${movie.mov_director}" /></td>
							<td><c:out value="${movie.mov_genre}" /></td>
							<td><c:out value="${movie.mov_synopsis}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${movie.mov_release}" /></td>
							<td><fmt:formatDate pattern="HH:mm:ss"
									value="${movie.mov_runtime}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${movie.mov_regdate}" /></td>
							<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
							<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
							<td><c:out value="${movie.mov_sco_point}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<div>
		<ul>
			<c:if test="${pageMaker.prev}">
				<li class="paginate_button previous"><a
					href="${pageMaker.startPage - 1}">Previous</a></li>
			</c:if>

			<c:forEach var="num" begin="${pageMaker.startPage}"
				end="${pageMaker.endPage}">
				<li class="paginate_button ${pageMaker.cri.pageNum == num?"active":""}">
					<a href="${num}">${num}</a>
				</li>
			</c:forEach>

			<c:if test="${pageMaker.next}">
				<li class="paginate_button next"><a
					href="${pageMaker.endPage + 1}">Next</a></li>
			</c:if>
		</ul>
	</div>

	<form id="actionForm" action="/movie/search" method="get">
		<input type="hidden" name="pageNum"
			value="<c:out value="${pageMaker.cri.pageNum}" />" /> <input
			type="hidden" name="amount"
			value="<c:out value="${pageMaker.cri.amount}" />" /> <input
			type="hidden" name="type"
			value="<c:out value="${pageMaker.cri.type}" />" /> <input
			type="hidden" name="keyword"
			value="<c:out value="${pageMaker.cri.keyword}" />" />
	</form>

	<script type="text/javascript">
	
		$(document).ready(function() {

			var searchForm = $('#searchForm');
			$('#searchForm button').on("click", function(e) {
				if (!searchForm.find("option:selected").val()) {
					alert("검색종류를 선택하세요.");
					return false;
				}
				if (!searchForm.find("input[name='keyword']").val()) {
					alert("키워드를 입력하세요.");
					return false;
				}
				e.preventDefault();
				searchForm.submit();
			});
			
			var actionForm = $("#actionForm");
			$(".paginate_button a").on("click", function(e) {
				e.preventDefault();
				actionForm.find("input[name='pageNum']").val($(this).attr("href"));
				actionForm.submit();
				});

		});
		
	</script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
		integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
		integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
		crossorigin="anonymous"></script>

</body>
</html>