<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@include file="../includes/header.jsp"%>

<main>
	<div class="main_frame">
		<div class="frame1">
			<div class="frame2">
				<div class="section_frame1">
					<div class="section_frame2">
						<div class="section_frame3-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock-RoundedCornerBlock">
							<section class="w_exposed_cell section_main" data-rowindex="5">
								<div class="section_frame4-Grid">
									<div class="section_frame5-Row">
										<header class="section_title">
											<h2 class="main_title">기본 정보</h2>
											<div class="more_view1">
												<div class="more_view2"></div>
											</div>
										</header>
									</div>
								</div>
								<div class="section_frame4-Grid">
									<div class="section_frame5-Row">
										<article class="mov_info_frame-Overview">
											<div class="container">
												<div class="row">
													<div class="col-3">
														<div class=" mov_info_thum-StyledLazyLoadingImage">
															<img alt="포스터 이미지" src='/resources/mov_imgs/<c:out value="${movie.mov_thumb}" />' class="mov_info_img-StyledImg">
														</div>
													</div>
													<div class="col">
														<div class="mov_info_part1-Summary">
															제목 :
															<c:out value="${movie.mov_title}" />
															<br> <span class="mov_info_part2-OverviewMeta">개봉일 : <c:out value="${movie.mov_release}" />
															</span><br> <span class="mov_info_part2-OverviewMeta">장르 : <c:out value="${movie.mov_genre}" /></span><br> <span
																class="mov_info_part2-OverviewMeta">상영시간 : <c:out value="${movie.mov_runtime}" /></span>
														</div>
														<div class="mov_info_part3-StyledSelf">
															<div class="mov_info_part4-StyledText">
																<c:out value="${movie.mov_synopsis}" />
															</div>
														</div>
													</div>
												</div>
											</div>
										</article>
										<hr class="section_hr">
									</div>
								</div>
							</section>
							<section class="w_exposed_cell section_main" data-rowindex="5">
								<div class="section_frame4-Grid">
									<div class="section_frame5-Row">
										<header class="section_title">
											<h2 class="main_title">리뷰/코멘트</h2>
											<div class="write_review1">
												<a href="/review/insert/<c:out value="${movie.mov_num}" />"><button type="submit">리뷰등록하기</button></a>
											</div>
										</header>
									</div>
								</div>
								<div class="section_frame4-Grid">
									<div class="section_frame5-Row">
										<div class="section_main1">
											<div class="section_main2">
												<div class="section_main3">
													<div class="section_frame4-Grid">
														<div class="section_frame5-Row">
															<ul class="ew8mnl61 ul_frame-VisualUl-CommentHorizontalUl">
																<li class="li_frame1">
																	<div class="li_frame2">
																		<div class="mov_rev_mem_frame1">
																			<div class="mov_rev_mem_frame2">
																				<div class="mov_rev_frame1-StylelessLocalLink">
																					<div class="mov_rev_mem">Emma stone</div>
																				</div>
																			</div>
																			<div class="rev_star">
																				<img src="/resources/icon_imgs/star_icon.svg" width="16px" height="16px" alt="star"><span>3.0</span>
																			</div>
																		</div>
																		<div class="mov_rev_con_frame1">
																			<div class="mov_rev_frame1-StylelessLocalLink">
																				<div class=" mov_rev_con1-StyledSelf">
																					<div class="mov_rev_con2-StyledText">감독이 관객보다 먼저 감탄해버린 영화. 얇은 스크린 너머에서 벌어지는 일들이 마치 두꺼운 유리관 너머의 수족관처럼 느껴지는데, 처음에는 신기하고 황홀하지만
																						갈수록 같은 배경에 쉽게 피로해진다.</div>
																				</div>
																			</div>
																		</div>
																		<div class="mov_rev_icon">
																			<span src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_good"></span> <em>258</em> <span
																				src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_bad"></span> <em>25</em> <span
																				src="/resources/icon_imgs/reply_icon.svg" width="18px" height="18px" class="icon_comment"></span> <em>15</em>
																		</div>
																		<div class="gb_choice_frame">
																			<button class="choice_good-StylelessButton">좋아요</button>
																			<button class="choice_bad-StylelessButton">싫어요</button>
																		</div>
																	</div>
																</li>
																<li class="li_frame1">
																	<div class="li_frame2">
																		<div class="mov_rev_mem_frame1">
																			<div class="mov_rev_mem_frame2">
																				<div class="mov_rev_frame1-StylelessLocalLink">
																					<div class="mov_rev_mem">한지민</div>
																				</div>
																			</div>
																			<div class="rev_star">
																				<img src="/resources/icon_imgs/star_icon.svg" width="16px" height="16px" alt="star"><span>4.5</span>
																			</div>
																		</div>
																		<div class="mov_rev_con_frame1">
																			<div class="mov_rev_frame1-StylelessLocalLink">
																				<div class=" mov_rev_con1-StyledSelf">
																					<div class="mov_rev_con2-StyledText">이야기를 풀어놓고 진행하는 부분은, 오락 영화로써 흠잡을 구석이 없습니다. 몰입하게 만드는 수작이 상당합니다. 터미네이터와 타이타닉을 번갈아 보는 기분이
																						들 정도로요...</div>
																				</div>
																			</div>
																		</div>
																		<div class="mov_rev_icon">
																			<span src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_good"></span> <em>679</em> <span
																				src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_bad"></span> <em>10</em> <span
																				src="/resources/icon_imgs/reply_icon.svg" width="18px" height="18px" class="icon_comment"></span> <em>150</em>
																		</div>
																		<div class="gb_choice_frame">
																			<button class="choice_good-StylelessButton">좋아요</button>
																			<button class="choice_bad-StylelessButton">싫어요</button>
																		</div>
																	</div>
																</li>
																<li class="li_frame1">
																	<div class="li_frame2">
																		<div class="mov_rev_mem_frame1">
																			<div class="mov_rev_mem_frame2">
																				<div class="mov_rev_frame1-StylelessLocalLink">
																					<div class="mov_rev_mem">무브먼트</div>
																				</div>
																			</div>
																			<div class="rev_star">
																				<img src="/resources/icon_imgs/star_icon.svg" width="16px" height="16px" alt="star"><span>5.0</span>
																			</div>
																		</div>
																		<div class="mov_rev_con_frame1">
																			<div class="mov_rev_frame1-StylelessLocalLink">
																				<div class=" mov_rev_con1-StyledSelf">
																					<div class="mov_rev_con2-StyledText">'보이는 것만이 전부는 아니다'라는 심정으로 괜스레 부정해보려는 순간, 이미 그들과 함께 판도라의 황홀한 바닷속을 유영하고 있는 나를 발견한다.</div>
																				</div>
																			</div>
																		</div>
																		<div class="mov_rev_icon">
																			<span src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_good"></span> <em>1035</em> <span
																				src="/resources/icon_imgs/good_icon.svg" width="18px" height="18px" class="icon_bad"></span> <em>5</em> <span
																				src="/resources/icon_imgs/reply_icon.svg" width="18px" height="18px" class="icon_comment"></span> <em>260</em>
																		</div>
																		<div class="gb_choice_frame">
																			<button class="choice_good-StylelessButton">좋아요</button>
																			<button class="choice_bad-StylelessButton">싫어요</button>
																		</div>
																	</div>
																</li>
															</ul>
														</div>
													</div>
													<div class="more_view1">
														<div class="more_view2">
															<a href="/ko-KR/contents/mOk7BJO/overview">더보기</a>
														</div>
													</div>
												</div>
											</div>
										</div>
										<hr class="section_hr">
									</div>
								</div>
							</section>
							<section class="w_exposed_cell section_main" data-rowindex="7" id="content_credits">
								<div class="section_frame4-Grid">
									<div class="section_frame5-Row">
										<header class="section_title">
											<h2 class="main_title">출연 배우</h2>
										</header>
									</div>
								</div>
								<div class="section_main1">
									<div id="ActCarousel" class="carousel slide" data-bs-ride="carousel">
										<div class="mov_act_frame1">
											<div class="section_main3">
												<div class="section_frame4-Grid">
													<div class="mov_act_frame2-PeopleUlRow">
														<div class="carousel-inner1">
															<div class="carousel-item active">
																<ul class="e5xrf7a0 mov_act_ul_frame-VisualUl-PeopleStackableUl">
																	<li class="mov_act_li_frame1"><a title="샘 워싱턴" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-1h9orp8-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">샘 워싱턴</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="조 샐다나" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-3zrsgm-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">조 샐다나</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="시고니 위버" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-19rtinw-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1-1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">시고니 위버</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="스티븐 랭" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-gmmbr4-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">스티븐 랭</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="케이트 윈슬렛" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-y58fr8-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">케이트 윈슬렛</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="클리프 커티스" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-l07fj5-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1-1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">클리프 커티스</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																</ul>
															</div>
															<div class="carousel-item">
																<ul class="e5xrf7a0 mov_act_ul_frame-VisualUl-PeopleStackableUl">
																	<li class="mov_act_li_frame1"><a title="샘 워싱턴" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-1h9orp8-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">샘 워싱턴</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="조 샐다나" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-3zrsgm-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">조 샐다나</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="시고니 위버" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-19rtinw-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1-1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">시고니 위버</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="샘 워싱턴" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-1h9orp8-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">샘 워싱턴</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="조 샐다나" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-3zrsgm-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">조 샐다나</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="시고니 위버" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-19rtinw-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1-1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">시고니 위버</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																</ul>
															</div>
															<div class="carousel-item">
																<ul class="e5xrf7a0 mov_act_ul_frame-VisualUl-PeopleStackableUl">
																	<li class="mov_act_li_frame1"><a title="샘 워싱턴" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-1h9orp8-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">샘 워싱턴</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="조 샐다나" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-3zrsgm-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">조 샐다나</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="시고니 위버" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-19rtinw-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1-1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">시고니 위버</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="샘 워싱턴" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-1h9orp8-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">샘 워싱턴</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="조 샐다나" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-3zrsgm-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">조 샐다나</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<li class="mov_act_li_frame1"><a title="시고니 위버" class="mov_act_li_frame2-InnerPartOfListWithImage">
																			<div class="mov_act_thum_frame1">
																				<div class="profilePhotoBlock mov_act_thum_frame2">
																					<div class="css-19rtinw-ProfilePhotoImage"></div>
																				</div>
																			</div>
																			<div class="mov_act_info_frame1-1">
																				<div class="mov_act_info_frame2">
																					<div class="mov_act_name">시고니 위버</div>
																					<div class="mov_act-StyledSubtitle">배우</div>
																				</div>
																				<div></div>
																			</div>
																	</a></li>
																	<div class="mov_act_ul_frame2"></div>
																</ul>
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
									<button class="carousel-control-prev" type="button" data-bs-target="#ActCarousel" data-bs-slide="prev">
										<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span class="visually-hidden">Previous</span>
									</button>
									<button class="carousel-control-next" type="button" data-bs-target="#ActCarousel" data-bs-slide="next">
										<span class="carousel-control-next-icon" aria-hidden="true"></span> <span class="visually-hidden">Next</span>
									</button>
								</div>
								<div class="section_frame4-Grid e1689zdh0">
									<div class="section_frame5-Row emmoxnt0">
										<hr class="section_hr">
									</div>
								</div>
							</section>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</main>
<%-- <table width="100%">
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
		<tr>
			<td><c:out value="${movie.mov_num}" /></td>
			<td><c:out value="${movie.mov_title}" /></td>
			<td><c:out value="${movie.mov_director}" /></td>
			<td><c:out value="${movie.mov_genre}" /></td>
			<td><c:out value="${movie.mov_synopsis}" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd" value="${movie.mov_release}" /></td>
			<td><fmt:formatDate pattern="HH:mm:ss" value="${movie.mov_runtime}" /></td>
			<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${movie.mov_regdate}" /></td>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<td><c:out value="${movie.mem_nickname}" /></td>
			</sec:authorize>
			<td><img src='/imgs/<c:out value="${movie.mov_img}" />'></td>
			<td><img src='/imgs/<c:out value="${movie.mov_thumb}" />'></td>
			<td><c:out value="${movie.mov_sco_point}" /></td>
		</tr>
	</tbody>
</table>

<a href="/"><button>뒤로 돌아가기</button></a>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/movie/modify/<c:out value="${movie.mov_num}" />"><button>수정하기</button></a>
	<form action="/movie/delete" method="post">
		<input type="hidden" name="mov_num" value="<c:out value="${movie.mov_num}" />">
		<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		<button type="submit">삭제하기</button>
	</form>
</sec:authorize>

<hr />

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<div>
		<a href="/actor/insert/<c:out value="${movie.mov_num}" />">
		<button type="submit">배우등록하기</button></a>
	</div>
</sec:authorize>

<table width="100%">
	<thead>
		<tr>
			<th>배우번호</th>
			<th>배우이름</th>
			<th>섬네일사진</th>
			<sec:authorize access="hasRole('ROLE_ADMIN')">
				<th>작성자 닉네임</th>
				<th>수정</th>
				<th>삭제</th>
			</sec:authorize>
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
						<td><button name="actor_modal" class="btn btn-primary"
							data-idx="<c:out value="${actor.act_num}" />">
						<c:out value="${actor.act_name}" /></button></td>
						<td><img src='/imgs/<c:out value="${actor.act_thumb}" />'></td>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<td><c:out value="${actor.mem_nickname}" /></td>
							<td><a href="/actor/modify/<c:out value="${actor.act_num}" />">
								<button>수정하기</button></a></td>
							<td><form action="/actor/delete" method="post">
									<input type="hidden" name="act_num" value="<c:out value="${actor.act_num}" />"> 
									<input type="hidden" name="mov_num" value="<c:out value="${actor.mov_num}" />">
									<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
									<button type="submit">삭제하기</button>
								</form></td>
						</sec:authorize>	
					</tr>
				</c:forEach>
			</c:when>
		</c:choose>
	</tbody>
</table>

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
			<sec:authorize access="hasRole('ROLE_ADMIN')">
			<div class="modal-body-mem_nickname">
				<p>modal-body-mem_nickname</p>
			</div>
			</sec:authorize>
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
	<a href="/review/insert/<c:out value="${movie.mov_num}" />">
	<button type="submit">리뷰등록하기</button></a>
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
			<th>작성자 닉네임</th>
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
					<td><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${review.mov_rev_regdate}" /></td>
					<td><button id="review_good" name="review_good" data-idx="<c:out value="${review.mov_rev_num}" />">
						<c:out value="${review.mov_rev_good}" /></button>
						<button id="review_bad" name="review_bad" data-idx="<c:out value="${review.mov_rev_num}" />">
						<c:out value="${review.mov_rev_bad}" /></button></td>
					<td><c:out value="${review.mov_num}" /></td>
					<td><c:out value="${review.mem_num}" /></td>
					<td><c:out value="${review.mem_nickname}" /></td>
					<td><c:out value="${review.mov_sco_point}" /></td>
					<sec:authorize access="isAuthenticated()">
						<c:if test="${principal.member.mem_num eq review.mem_num}">
							<td><a href="/review/modify/<c:out value="${review.mov_num}" />/<c:out value="${review.mov_rev_num}" />/<c:out value="${review.mem_num}"/>"><button>수정하기</button></a></td>
							<td><form action="/review/delete" method="post">
								<input type="hidden" name="mov_rev_num" value="<c:out value="${review.mov_rev_num}" />"> 
								<input type="hidden" name="mov_num" value="<c:out value="${review.mov_num}" />"> 
								<input type="hidden" name="mem_num" value="<c:out value="${review.mem_num}" />">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<button type="submit">삭제하기</button>
							</form></td>
						</c:if>
					</sec:authorize>
					<sec:authorize access="hasRole('ROLE_ADMIN')">	
						<td><form action="/review/delete" method="post">
								<input type="hidden" name="mov_rev_num" value="<c:out value="${review.mov_rev_num}" />"> 
								<input type="hidden" name="mov_num" value="<c:out value="${review.mov_num}" />"> 
								<input type="hidden" name="mem_num" value="<c:out value="${review.mem_num}" />">
								<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
								<button type="submit">관리자삭제하기</button>
							</form></td>
					</sec:authorize>		
				</tr>
				<br />

					<!-- 자바스크립트로 리뷰에 달린 덧글 처리 -->

			</c:forEach>
		</c:when>
	</c:choose>
	</tbody>
</table> --%>

<script type="text/javascript">
$(document).ready(function() {
					
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";

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
			beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
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
		<sec:authorize access="hasRole('ROLE_ADMIN')">	
		$(".modal-body-mem_nickname").html(response.mem_nickname);
		</sec:authorize>	
		$(".modal-body-act_img").html("<td><img src='/imgs/" + response.act_img + "'></td>");
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
	
	<sec:authorize access="isAuthenticated()">
	$("button[name='review_good']").on("click", function(e) {

		var mov_rev_num = $(this).data("idx");
		var good = $(this);
		var bad = $(this).next('button');
		<sec:authorize access="isAuthenticated()">
			var mem_num = "<c:out value="${principal.member.mem_num}"/>";
		</sec:authorize>
		var data = {
			mov_rev_num : mov_rev_num,
			mem_num : mem_num				
		};
		$.ajax({
			type : "POST",
			url : "/review/good",
			beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
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
						
		<sec:authorize access="isAuthenticated()">
			var mem_num = "<c:out value="${principal.member.mem_num}"/>";
		</sec:authorize>
						
		var data = {
			mov_rev_num : mov_rev_num,
			mem_num : mem_num
		};
		$.ajax({
			type : "POST",
			url : "/review/bad",
			beforeSend: function(xhr){
			xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
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
	</sec:authorize>
});
</script>

<%@include file="../includes/footer.jsp"%>
