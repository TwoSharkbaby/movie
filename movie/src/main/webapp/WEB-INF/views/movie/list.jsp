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
			<c:choose>
				<c:when test="${empty list}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty list}">
					<c:forEach items="${list}" var="movie">
						<tr>
							<td><a href='/movie/read/<c:out value="${movie.mov_num}" />'><c:out value="${movie.mov_num}" /></a></td>
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
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

</body>
</html>