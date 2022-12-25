<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>
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
							<td><c:out value="${review.mov_rev_num}" /></td>
							<td><c:out value="${review.mov_rev_title}" /></td>
							<td><c:out value="${review.mov_rev_content}" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
									value="${review.mov_rev_regdate}" /></td>
							<td><c:out value="${review.mov_rev_good}" /></td>
							<td><c:out value="${review.mov_rev_bad}" /></td>
							<td><c:out value="${review.mov_num}" /></td>
							<td><c:out value="${review.mem_num}" /></td>
							<td><c:out value="${review.mov_sco_point}" /></td>
						</tr>
						<br />
						<c:forEach items="${comment}" var="comment">
							<thead>
								<tr>
									<th>댓글번호</th>
									<th>댓글내용</th>
									<th>등록일</th>
									<th>좋아요</th>
									<th>싫어요</th>
									<th>작성자</th>
									<th>영화리뷰번호</th>
								</tr>
							</thead>
							<tbody>
							<tr>
								<td><c:out value="${comment.mov_rev_com_num}" /></td>
								<td><c:out value="${comment.mov_rev_com_content}" /></td>
								<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
										value="${comment.mov_rev_com_regdate}" /></td>
								<td><c:out value="${comment.mov_rev_com_good}" /></td>
								<td><c:out value="${comment.mov_rev_com_bad}" /></td>
								<td><c:out value="${comment.mem_num}" /></td>
								<td><c:out value="${comment.mov_rev_num}" /></td>
							</tr>
							</tbody>
							<hr/>
						</c:forEach>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

</body>
</html>