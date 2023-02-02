<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="./includes/header.jsp"%>

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

	<sec:authorize access="hasRole('ROLE_ADMIN')">
		<div>
			<a href="/movie/insert"><button class="btn btn-danger">등록하기</button></a>
		</div>
	</sec:authorize>

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

<%@include file="./includes/footer.jsp"%>