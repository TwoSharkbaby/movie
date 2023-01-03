<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>

<%@include file="../includes/header.jsp"%>

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
				<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
				<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
				<td><c:out value="${movie.mov_sco_point}" /></td>
			</tr>
		</tbody>
	</table>

	<a href="/movie/list"><button>뒤로 돌아가기</button></a>
	<a href="/movie/modify/<c:out value="${movie.mov_num}" />"><button>수정하기</button></a>
	<form action="/movie/delete" method="post">
		<input type="hidden" name="mov_num"
			value="<c:out value="${movie.mov_num}" />">
			<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
		<button type="submit">삭제하기</button>
	</form>

	<hr />

	<div>
		<a href="/actor/insert/<c:out value="${movie.mov_num}" />"><button
				type="submit">배우등록하기</button></a>
	</div>

	<table width="100%">
		<thead>
			<tr>
				<th>배우번호</th>
				<th>배우이름</th>
				<th>섬네일사진</th>
				<th>수정</th>
				<th>삭제</th>
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
							<td>
								<!-- Button trigger modal -->
								<button name="actor_modal" class="btn btn-primary"
									data-idx="<c:out value="${actor.act_num}" />">
									<c:out value="${actor.act_name}" />
								</button>
							</td>
							<td><c:out value="${actor.act_thumb}" /></td>
							<td><a
								href="/actor/modify/<c:out value="${actor.act_num}" />"><button>수정하기</button></a></td>
							<td><form action="/actor/delete" method="post">
									<input type="hidden" name="act_num"
										value="<c:out value="${actor.act_num}" />"> <input
										type="hidden" name="mov_num"
										value="<c:out value="${actor.mov_num}" />">
										<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
									<button type="submit">삭제하기</button>
								</form></td>
						</tr>
					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<!-- Modal -->
	<div class="modal" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title">배우상세페이지</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body-act_birth">
					<p>modal-body-act_birth</p>
				</div>
				<div class="modal-body-act_sex">
					<p>modal-body-act_sex</p>
				</div>
				<div class="modal-body-act_info">
					<p>modal-body-act_info</p>
				</div>
				<div class="modal-body-act_img">
					<p>modal-body-act_img</p>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Close</button>
				</div>
			</div>
		</div>
	</div>

	<hr />

	<div>
		<a href="/review/insert/<c:out value="${movie.mov_num}" />"><button
				type="submit">리뷰등록하기</button></a>
	</div>

	<table width="100%">
		<thead>
			<tr>
				<th>리뷰번호</th>
				<th>리뷰제목</th>
				<th>리뷰내용</th>
				<th>등록일</th>
				<th>좋아요싫어요</th>
				<th>영화번호</th>
				<th>작성자</th>
				<th>평점</th>
				<th>수정</th>
				<th>삭제</th>
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
							<td><button id="review_good" name="review_good"
									data-idx="<c:out value="${review.mov_rev_num}" />">
									<c:out value="${review.mov_rev_good}" />
								</button>
								<button id="review_bad" name="review_bad"
									data-idx="<c:out value="${review.mov_rev_num}" />">
									<c:out value="${review.mov_rev_bad}" />
								</button></td>
							<td><c:out value="${review.mov_num}" /></td>
							<td><c:out value="${review.mem_num}" /></td>
							<td><c:out value="${review.mov_sco_point}" /></td>
							<td><a
								href="/review/modify/<c:out value="${review.mov_num}" />/<c:out value="${review.mov_rev_num}" />"><button>수정하기</button></a></td>
							<td><form action="/review/delete" method="post">
									<input type="hidden" name="mov_rev_num"
										value="<c:out value="${review.mov_rev_num}" />"> <input
										type="hidden" name="mov_num"
										value="<c:out value="${review.mov_num}" />">
										<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
									<button type="submit">삭제하기</button>
								</form></td>
						</tr>
						<br />

						<!-- 자바스크립트로 리뷰에 달린 덧글 처리 -->

					</c:forEach>
				</c:when>
			</c:choose>
		</tbody>
	</table>

	<script type="text/javascript">
		$(document).ready(
				function() {

					var result = '<c:out value="${result}"/>';

					checkModal(result);

					history.replaceState({}, null, null);

					function checkModal(result) {

						if (result === '' || history.state) {
							return;
						} else {
							alert(result);
						}

					};

					var modal = $(".modal");

					$("button[name='actor_modal']").on("click", function(e) {

						e.preventDefault();
						var act_num = $(this).data("idx");

						var data = {
							act_num : act_num
						};
						$.ajax({
							type : "GET",
							url : "/actor/" + act_num,
							contentType : "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(mine)
							dataType : "json" // 요청을 서버로해서 응답이 왔을때 데이터타입이 버퍼드문자열을 json오브젝으로 변경하여
						}).done(function(response) { // resp <= 과 같이 담아서 사용하기 위함
							showActorDetail(response);
						}).fail(function(error) {
							alert("올바른 경로가 아닙니다");
						});

					});

					function showActorDetail(response) {
						$(".modal-title").html(response.act_name + "상세내용");
						$(".modal-body-act_birth").html(displayTime(response.act_birth));
						$(".modal-body-act_sex").html(response.act_sex);
						$(".modal-body-act_info").html(response.act_info);
						$(".modal-body-act_img").html(response.act_img);
						$(".modal").modal("show");
					};

					function displayTime(timeValue) {
						var today = new Date();
						var gap = today.getTime() - timeValue;
						var dateObj = new Date(timeValue);

						if (gap < (1000 * 60 * 60 * 24)) {
							var hh = dateObj.getHours();
							var mi = dateObj.getMinutes();
							var ss = dateObj.getSeconds();
							return [ (hh > 9 ? '' : '0') + hh, ':',
									(mi > 9 ? '' : '0') + mi, ':',
									(ss > 9 ? '' : '0') + ss ].join('');
						} else {
							var yy = dateObj.getFullYear();
							var mm = dateObj.getMonth() + 1;
							var dd = dateObj.getDate();
							return [ yy, '/', (mm > 9 ? '' : '0') + mm, '/',
									(dd > 9 ? '' : '0') + dd ].join('');
						}
					};

					$("button[name='review_good']").on("click", function(e) {

						var mov_rev_num = $(this).data("idx");
						var good = $(this);
						var bad = $(this).next('button');

						var data = {
							mov_rev_num : mov_rev_num,
							mem_num : 1
						// ## 로그인 처리하면 고정값 수정필요 ##
						};
						$.ajax({
							type : "POST",
							url : "/review/good",
							data : JSON.stringify(data), // http body 데이터
							contentType : "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(mine)
							dataType : "json" // 요청을 서버로해서 응답이 왔을때 데이터타입이 버퍼드문자열을 json오브젝으로 변경하여
						}).done(function(response) { // resp <= 과 같이 담아서 사용하기 위함
							good.html(response.good);
							bad.html(response.bad);
						}).fail(function(error) {
							alert("올바른 경로가 아닙니다");
						});

					});

					$("button[name='review_bad']").on("click", function(e) {

						var mov_rev_num = $(this).data("idx");
						var bad = $(this);
						var good = $(this).prev('button');
						;

						var data = {
							mov_rev_num : mov_rev_num,
							mem_num : 1
						// ## 로그인 처리하면 고정값 수정필요 ##
						};
						$.ajax({
							type : "POST",
							url : "/review/bad",
							data : JSON.stringify(data), // http body 데이터
							contentType : "application/json; charset=utf-8", // body 데이터가 어떤 타입인지(mine)
							dataType : "json" // 요청을 서버로해서 응답이 왔을때 데이터타입이 버퍼드문자열을 json오브젝으로 변경하여
						}).done(function(response) { // resp <= 과 같이 담아서 사용하기 위함
							good.html(response.good);
							bad.html(response.bad);
						}).fail(function(error) {
							alert("올바른 경로가 아닙니다");
						});
					});

				});
	</script>
	
<%@include file="../includes/footer.jsp"%>>