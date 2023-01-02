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

	<div>
		<form id="searchForm" action="/movie/search" method="get">
			<div>
				<select name="type">
					<option value="">--</option>
					<option value="T">제목</option>
					<option value="G">장르</option>
					<option value="D">감독</option>
					<option value="A">배우</option>
					<option value="TD">제목 OR 감독</option>
					<option value="GD">장르 OR 감독</option>
				</select>
			</div>
			<div style="padding: 0px;">
				<input type="text" name="keyword"/>
			</div>
			<div>
				<button>Search</button>
			</div>
		</form>
	</div>
	
	<hr/>
	
	<div>
		<a href="/movie/insert"><button>등록하기</button></a>
	</div>

	<h1>최신영화</h1>
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
				<c:when test="${empty latest}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty latest}">
					<c:forEach items="${latest}" var="movie">
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
							<td><img src="<c:out value="${movie.mov_img}" />"></td>
							<td><img src="<c:out value="${movie.mov_thumb}" />"></td>
							<td><c:out value="${movie.mov_sco_point}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<hr />

	<h1>액션영화</h1>
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
				<c:when test="${empty action}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty action}">
					<c:forEach items="${action}" var="movie">
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
							<td><c:out value="${movie.mov_img}" /></td>
							<td><c:out value="${movie.mov_thumb}" /></td>
							<td><c:out value="${movie.mov_sco_point}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<hr />

	<h1>판타지영화</h1>
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
				<c:when test="${empty fantasy}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty fantasy}">
					<c:forEach items="${fantasy}" var="movie">
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
							<td><c:out value="${movie.mov_img}" /></td>
							<td><c:out value="${movie.mov_thumb}" /></td>
							<td><c:out value="${movie.mov_sco_point}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<hr />

	<h1>공포영화</h1>
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
				<c:when test="${empty horror}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty horror}">
					<c:forEach items="${horror}" var="movie">
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
							<td><c:out value="${movie.mov_img}" /></td>
							<td><c:out value="${movie.mov_thumb}" /></td>
							<td><c:out value="${movie.mov_sco_point}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<hr />

	<h1>로멘스영화</h1>
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
				<c:when test="${empty romance}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty romance}">
					<c:forEach items="${romance}" var="movie">
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
							<td><c:out value="${movie.mov_img}" /></td>
							<td><c:out value="${movie.mov_thumb}" /></td>
							<td><c:out value="${movie.mov_sco_point}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<hr />

	<h1>코미디영화</h1>
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
				<c:when test="${empty comedy}">
					<tr>
						<td colspan="5">[없음]
					</tr>
				</c:when>

				<c:when test="${!empty comedy}">
					<c:forEach items="${comedy}" var="movie">
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
							<td><c:out value="${movie.mov_img}" /></td>
							<td><c:out value="${movie.mov_thumb}" /></td>
							<td><c:out value="${movie.mov_sco_point}" /></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

<script type="text/javascript">

$(document).ready(function() {
	
	var result = '<c:out value="${result}"/>';

	checkModal(result);

	history.replaceState({}, null, null);

	function checkModal(result) {

		if (result === '' || history.state) {
			return;
		} else {
			alert(result);
		}
		
	}
	
	var searchForm = $('#searchForm');
	$('#searchForm button').on("click", function(e){
		if(!searchForm.find("option:selected").val()){
			alert("검색종류를 선택하세요.");
			return false;
		}
		if(!searchForm.find("input[name='keyword']").val()){
			alert("키워드를 입력하세요.");
			return false;	
		}
		e.preventDefault();
		searchForm.submit();
	});
	
});
</script>

</body>
</html>