<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="./includes/header.jsp"%>

<!-- <div>
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
			<input type="text" name="keyword" />
		</div>
		<div>
			<button>Search</button>
		</div>
	</form>
</div>

<hr /> -->

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div>
		<a href="/movie/insert"><button>등록하기</button></a>
	</div>
</sec:authorize>

<main>
	<div id="bigCarousel" class="carousel slide" data-bs-ride="carousel">
		<div class="carousel-indicators">
			<button type="button" data-bs-target="#bigCarousel" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			<button type="button" data-bs-target="#bigCarousel" data-bs-slide-to="1" aria-label="Slide 2"></button>
		</div>
		<div class="carousel-inner">
			<div class="carousel-item active">
				<div class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true" preserveAspectRatio="none"
					focusable="false">
					<img src="resources/imgs/img_slider1.jpg" width="100%" height="100%" /> <a href="#" target="_self"> <rect width="100%" height="100%"
							fill="#777" />
					</a>
				</div>
				<div class="container">
					<div class="carousel-caption text-start">
						<h1></h1>
						<p></p>
					</div>
				</div>
			</div>
			<div class="carousel-item">
				<div class="bd-placeholder-img" width="100%" height="100%" xmlns="http://www.w3.org/2000/svg" aria-hidden="true"
					preserveAspectRatio="xMidYMid slice" focusable="false">
					<img src="resources/imgs/img_slider2.jpg" width="100%" height="100%" /> <a href="#" target="_self"> <rect width="100%" height="100%"
							fill="#777" />
					</a>
				</div>

				<div class="container">
					<div class="carousel-caption text-start">
						<h1>#팀프로젝트</h1>
						<p>함께 합시다!!!!!</p>
					</div>
				</div>
			</div>
		</div>
		<button class="carousel-control-prev1" type="button" data-bs-target="#bigCarousel" data-bs-slide="prev" style="background: none">
			<span aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next1" type="button" data-bs-target="#bigCarousel" data-bs-slide="next" style="background: none">
			<span aria-hidden="true"></span> <span class="visually-hidden">Next</span>
		</button>
	</div>
	<section class="main-page-frame1">
		<!-- <div class="main-page-frame2"> -->
		<div class="main-page-movie-list">
			<p class="main-page-movie-title">최신 영화</p>
		</div>
		<div class="movie-list-frame">
			<div class="movie-list-frame1">
				<div class="movie-list-frame2">
					<div class="movie-list-frame3">
						<div id="minCarousel1" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner1">
								<div class="carousel-item active">
									<c:choose>
										<c:when test="${empty latest}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty latest}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${latest}" var="movie" begin="0" end="4">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
								<div class="carousel-item">
									<c:choose>
										<c:when test="${empty latest}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty latest}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${latest}" var="movie" begin="5" end="9">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#minCarousel1" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#minCarousel1" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>

		<div class="main-page-movie-list">
			<p class="main-page-movie-title">액션 영화</p>
		</div>
		<div class="movie-list-frame">
			<div class="movie-list-frame1">
				<div class="movie-list-frame2">
					<div class="movie-list-frame3">
						<div id="minCarousel2" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner1">
								<div class="carousel-item active">
									<c:choose>
										<c:when test="${empty action}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty action}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${action}" var="movie" begin="0" end="4">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
								<div class="carousel-item">
									<c:choose>
										<c:when test="${empty action}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty action}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${action}" var="movie" begin="5" end="9">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#minCarousel2" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#minCarousel2" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>

		<div class="main-page-movie-list">
			<p class="main-page-movie-title">판타지 영화</p>
		</div>
		<div class="movie-list-frame">
			<div class="movie-list-frame1">
				<div class="movie-list-frame2">
					<div class="movie-list-frame3">
						<div id="minCarousel3" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner1">
								<div class="carousel-item active">
									<c:choose>
										<c:when test="${empty fantasy}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty fantasy}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${fantasy}" var="movie" begin="0" end="4">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
								<div class="carousel-item">
									<c:choose>
										<c:when test="${empty fantasy}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty fantasy}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${fantasy}" var="movie" begin="5" end="9">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#minCarousel3" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#minCarousel3" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>

		<div class="main-page-movie-list">
			<p class="main-page-movie-title">공포 영화</p>
		</div>
		<div class="movie-list-frame">
			<div class="movie-list-frame1">
				<div class="movie-list-frame2">
					<div class="movie-list-frame3">
						<div id="minCarousel4" class="carousel slide" data-bs-ride="carousel">
							<div class="carousel-inner1">
								<div class="carousel-item active">
									<c:choose>
										<c:when test="${empty horror}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty horror}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${horror}" var="movie" begin="0" end="4">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
								<div class="carousel-item">
									<c:choose>
										<c:when test="${empty horror}">
											<tr>
												<td colspan="5">[없음]
											</tr>
										</c:when>
										<c:when test="${!empty horror}">
											<div class="row">
												<div class="col">
													<ul class="movie-list-Visual">
														<c:forEach items="${horror}" var="movie" begin="5" end="9">
															<li class="main-movie">
																<div class="main-movie-image">
																	<div class=" movie-image-src num1">
																		<a title="movie_title" href='/movie/read/<c:out value="${movie.mov_num}" />'><img
																			src="resources/mov_imgs/<c:out value="${movie.mov_img}" />" class="movie-image-url num2">
																	</div>
																	<div class="movie-no">
																		<a href="#"><c:out value="${movie.mov_num}" /></a>
																	</div>
																</div>
																<div class="movie-info">
																	<div class="movie-title">
																		제목:
																		<c:out value="${movie.mov_title}" />
																	</div>
																	<div class="movie-detail-info">
																		개봉일:
																		<fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" />
																	</div>
																	<div class="movie-detail-info">
																		장르:
																		<c:out value="${movie.mov_genre}" />
																	</div>
																	<div class="movie-detail-info">
																		감독:
																		<c:out value="${movie.mov_director}" />
																	</div>
																</div> </a>
															</li>
														</c:forEach>
													</ul>
												</div>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>
						</div>
					</div>
				</div>
				<button class="carousel-control-prev" type="button" data-bs-target="#minCarousel4" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button" data-bs-target="#minCarousel4" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
				</button>
			</div>
		</div>
		<!-- </div> -->
	</section>

</main>

<%-- <h1>최신영화</h1>
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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<th>작성자 닉네임</th>
			</sec:authorize>
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
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><c:out value="${movie.mem_nickname}" /></td>
						</sec:authorize>
						<td><img src='resource/mov_imgs/<c:out value="${movie.mov_img}" />'></td>
						<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<th>작성자 닉네임</th>
			</sec:authorize>
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
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><c:out value="${movie.mem_nickname}" /></td>
						</sec:authorize>
						<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
						<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<th>작성자 닉네임</th>
			</sec:authorize>
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
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><c:out value="${movie.mem_nickname}" /></td>
						</sec:authorize>
						<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
						<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<th>작성자 닉네임</th>
			</sec:authorize>
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
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><c:out value="${movie.mem_nickname}" /></td>
						</sec:authorize>
						<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
						<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
						<td><c:out value="${movie.mov_sco_point}" /></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
</table> --%>

<%-- <hr />

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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<th>작성자 닉네임</th>
			</sec:authorize>
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
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><c:out value="${movie.mem_nickname}" /></td>
						</sec:authorize>
						<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
						<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<th>작성자 닉네임</th>
			</sec:authorize>
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
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><c:out value="${movie.mem_nickname}" /></td>
						</sec:authorize>
						<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
						<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
						<td><c:out value="${movie.mov_sco_point}" /></td>
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
</table> --%>

<!-- <script type="text/javascript">
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

		});
</script> -->

<%@include file="./includes/footer.jsp"%>