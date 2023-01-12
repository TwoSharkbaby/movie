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
					<img src="resources/imgs/img_slider1.jpg" width="100%" height="100%" /> <a href="#" target="_self"> <rect width="100%" height="100%" fill="#777" />
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
					<img src="resources/imgs/img_slider2.jpg" width="100%" height="100%" /> <a href="#" target="_self"> <rect width="100%" height="100%" fill="#777" />
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
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/Hope_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">1</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 아르코 라이브 뮤지컬 호프</div>
															<div class="movie-detail-info">개봉일: 2023.03.16</div>
															<div class="movie-detail-info">장르: 로멘스</div>
															<div class="movie-detail-info">감독: 한국문화예술위원회</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/DolPhin_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">2</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 돌핀보이</div>
															<div class="movie-detail-info">개봉일: 2023.01.25</div>
															<div class="movie-detail-info">장르: 코미디</div>
															<div class="movie-detail-info">감독: 모하마드 케이란디시</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/Ghost_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">3</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 유령</div>
															<div class="movie-detail-info">개봉일: 2023.01.18</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 이해영</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/Ambush_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">4</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 매복</div>
															<div class="movie-detail-info">개봉일: 2023.01.12</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 피에르 모렐</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/Smile_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">5</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 웃는남자 감독판</div>
															<div class="movie-detail-info">개봉일: 2023.01.09</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 김수기</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/3000_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">6</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 3000년의 기다림</div>
															<div class="movie-detail-info">개봉일: 2023.01.04</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 조지 밀러</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/Boots_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">7</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 장화신은 고양이(끝내주는 모험)</div>
															<div class="movie-detail-info">개봉일: 2023.01.04</div>
															<div class="movie-detail-info">장르: 코미디</div>
															<div class="movie-detail-info">감독: 조엘 크로포드</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img alt="패닉 런의 포스터" src="resources/mov_imgs/Latest/DesperateHour_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">8</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 패닉런</div>
															<div class="movie-detail-info">개봉일: 2023.01.04</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 필립 노이스</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/SlamDunk_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">9</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 더 퍼스트 슬램덩크</div>
															<div class="movie-detail-info">개봉일: 2023.01.04</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 이노우에 다케히코</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Latest/Switch_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">10</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 스위치</div>
															<div class="movie-detail-info">개봉일: 2023.01.04</div>
															<div class="movie-detail-info">장르: 코미디</div>
															<div class="movie-detail-info">감독: 마대윤</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
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
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/Sherlock_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">11</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 셜록 홈즈</div>
															<div class="movie-detail-info">개봉일: 2009.12.23</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 가이 리치</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/TheBourne_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">12</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 본 아이덴티티</div>
															<div class="movie-detail-info">개봉일: 2002.10.18</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 더그 라이만</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/Mummy_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">13</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 미이라</div>
															<div class="movie-detail-info">개봉일: 2017.06.06</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 알렉스 커츠만</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/AmaginSpider_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">14</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 어메이징 스파이더맨</div>
															<div class="movie-detail-info">개봉일: 2012.06.28</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 마크 웹</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/SourceCode_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">15</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 소스 코드</div>
															<div class="movie-detail-info">개봉일: 2011.05.04</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 던칸 존스</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/District9_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">16</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 디스트릭트 9</div>
															<div class="movie-detail-info">개봉일: 2009.10.15</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 닐 블롬캠프</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/WithTheGod_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">17</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 신과 함께(인과 연)</div>
															<div class="movie-detail-info">개봉일: 2018.08.01</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 김용화</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/Matrix_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">18</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 매트릭스</div>
															<div class="movie-detail-info">개봉일: 1999.05.15</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 릴리 워쇼스키</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/Alien_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">19</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 에일리언</div>
															<div class="movie-detail-info">개봉일: 1987.10.01</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 리들리 스콧</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Action/HungerGames_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">20</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 헝거게임(판엠의 불꽃)</div>
															<div class="movie-detail-info">개봉일: 2012.04.05</div>
															<div class="movie-detail-info">장르: 액션</div>
															<div class="movie-detail-info">감독: 게리 로스</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
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
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img alt="해리포터와 마법사의 돌의 포스터" src="resources/mov_imgs/Fantasy/PoterMagicStone_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">21</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 해리포터(마법사의 돌)</div>
															<div class="movie-detail-info">개봉일: 2001.12.14</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 크리스 콜럼버스</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/FantasticBeasts_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">22</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 신비한 동물사전</div>
															<div class="movie-detail-info">개봉일: 2016.11.16</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 데이빗 예이츠</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/Hobbit_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">23</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 호빗(뜻밖의 여정)</div>
															<div class="movie-detail-info">개봉일: 2012.12.13</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 피터 잭슨</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/PoterAzkaban_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">2</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 해리포터(아즈카반의 죄수)</div>
															<div class="movie-detail-info">개봉일: 2004.07.16</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 알폰소 쿠아론</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/NarniaLion_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">25</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 나니아 연대기(사자,마녀 그리고 옷장)</div>
															<div class="movie-detail-info">개봉일: 2005.12.29</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 앤드류 애덤슨</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/NarniaCaspian_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">26</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 나니아 연대기(캐스피언 왕자)</div>
															<div class="movie-detail-info">개봉일: 2008.05.15</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 앤드류 애덤슨</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/PoterPrince_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">27</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 해리포터(혼혈왕자)</div>
															<div class="movie-detail-info">개봉일: 2009.07.15</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 데이빗 예이츠</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/PoterPhoenix_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">28</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 해리포터(불사조 기사단)</div>
															<div class="movie-detail-info">개봉일: 2007.07.11</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 데이빗 예이츠</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/SnowQueen_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">29</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 눈의 여왕5(스노우 프린세스와 미러랜드의 비밀)</div>
															<div class="movie-detail-info">개봉일: 2022.12.22</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 알렉세이 트시칠린</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Fantasy/Dumbledore_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">30</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 신비한 동물들과 덤블도어의 비밀</div>
															<div class="movie-detail-info">개봉일: 2022.04.13</div>
															<div class="movie-detail-info">장르: 판타지</div>
															<div class="movie-detail-info">감독: 데이빗 예이츠</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								</ul>
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
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Juon_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">31</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 주온(극장판)</div>
															<div class="movie-detail-info">개봉일: 2003.06.27</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 시미즈 다카시</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Gonjiam_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">22</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 곤지암</div>
															<div class="movie-detail-info">개봉일: 2018.03.28</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 정범식</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Orphan_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">23</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 오펀(천사의 비밀)</div>
															<div class="movie-detail-info">개봉일: 2009.08.20</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 자움 콜렛 세라</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Conjuring1_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">2</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 컨저링</div>
															<div class="movie-detail-info">개봉일: 2013.09.17</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 제임스 완</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Shutter_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">25</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 셔터</div>
															<div class="movie-detail-info">개봉일: 2005.06.30</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 반종 피산다 나쿤</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								<div class="carousel-item">
									<div class="row">
										<div class="col">
											<ul class="movie-list-Visual">
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Conjuring2_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">26</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 컨저링2</div>
															<div class="movie-detail-info">개봉일: 2016.06.09</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 제임스 완</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Scream1_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">27</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 스크림</div>
															<div class="movie-detail-info">개봉일: 1999.01.16</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 웨스 크레이븐</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Annabelle_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">28</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 애나벨</div>
															<div class="movie-detail-info">개봉일: 2014.10.02</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 존 R 레오네티</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Quija_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">29</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 위자(저주의 시작)</div>
															<div class="movie-detail-info">개봉일: 2016.11.09</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 마이크 플래너건</div>
														</div>
												</a></li>
												<li class="main-movie"><a title="movie_title" href="상세 영화 페이지로">
														<div class="main-movie-image">
															<div class=" movie-image-src num1">
																<img src="resources/mov_imgs/Horror/Scream5_main.jpg" class="movie-image-url num2">
															</div>
															<div class="movie-no">30</div>
														</div>
														<div class="movie-info">
															<div class="movie-title">제목: 스크림 5</div>
															<div class="movie-detail-info">개봉일: 2022.02.17</div>
															<div class="movie-detail-info">장르: 공포</div>
															<div class="movie-detail-info">감독: 맷 베티넬리 올핀</div>
														</div>
												</a></li>
											</ul>
										</div>
									</div>
								</div>
								</ul>
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