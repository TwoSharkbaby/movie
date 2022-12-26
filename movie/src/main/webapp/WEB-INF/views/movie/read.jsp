<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>

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
			<tr>
				<td><c:out value="${movie.mov_num}" /></td>
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
				<td><c:out value="${movie.mov_img}" /></td>
				<td><c:out value="${movie.mov_thumb}" /></td>
				<td><c:out value="${movie.mov_sco_point}" /></td>
			</tr>
		</tbody>
	</table>

	<table width="100%">
		<thead>
			<tr>
				<th>배우번호</th>
				<th>배우이름</th>
				<th>섬네일사진</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty actor}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty actor}">
					<c:forEach items="${actor}" var="actor">
						<tr>
							<td><c:out value="${actor.act_num}" /></td>
							<td><c:out value="${actor.act_name}" /></td>
							<td><c:out value="${actor.act_thumb}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<!-- 자바스크립트로 모달창을 이용해서 배우상세정보 보기 페이지 -->

	<a href="/movie/list"><button>뒤로 돌아가기</button></a>

	<hr />

	<table width="100%">
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>리뷰제목</th>
				<th>리뷰내용</th>
				<th>등록일</th>
				<th>좋아요</th>
				<th>싫어요</th>
				<th>영화번호</th>
				<th>작성자</th>
				<th>평점</th>
			</tr>
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${empty review}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty review}">
					<c:forEach items="${review}" var="review">
						<tr>
							<td id="mov_rev_num"><c:out value="${review.mov_rev_num}" /></td>
							<td><c:out value="${review.mov_rev_title}" /></td>
							<td><c:out value="${review.mov_rev_content}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${review.mov_rev_regdate}" /></td>
							<td><c:out value="${review.mov_rev_good}" />
								<button id="review_good">좋아요</button></td>
							<td><c:out value="${review.mov_rev_bad}" />
								<button id="review_bad">싫어요</button></td>
							<td><c:out value="${review.mov_num}" /></td>
							<td><c:out value="${review.mem_num}" /></td>
							<td><c:out value="${review.mov_sco_point}" /></td>
						</tr>
						<br />

						<!-- 자바스크립트로 리뷰에 달린 덧글 처리 -->

					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<script type="text/javascript">
$(document).ready(function() {
	
	var review_good = $("#review_good");
	var review_bad = $("#review_bad");
	
	review_good.on("click", function(e){
		var review_info = $(this).closest("tr");
		console.log(review_info);
		var num = review_info.find("#mov_rev_num").val("");
		console.log(num);
		console.log("굿버튼11");
		/* var mov_rev_num = $(this).closest("#mov_rev_num").val("td");
		console.log(mov_rev_num); */
	});
	
	review_bad.on("click", function(e){
		console.log("배드버튼");
	});
	
});

</script>

</body>
</html>