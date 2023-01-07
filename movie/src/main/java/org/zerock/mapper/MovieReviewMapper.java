package org.zerock.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewMapper {
	
	// 리뷰 수정시 기존 정보 불러오기
	public MovieReviewVO read(Long mov_rev_num);

	// 리뷰 등록
	public Long insert(MovieReviewVO movieReviewVO);
	
	// 리뷰 수정
	public int update(MovieReviewVO movieReviewVO);

	// 리뷰 삭제
	public int delete(Long mov_rev_num);
	
	// 영화 상세 리뷰
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	// 좋아요 등록
	public void goodUpdate(Long mov_rev_num);
	
	// 좋아요 취소
	public void goodDowndate(Long mov_rev_num);
	
	// 싫어요 등록
	public void badUpdate(Long mov_rev_num);
	
	// 싫어요 취소
	public void badDowndate(Long mov_rev_num);
	
	// 기존 좋싫 판별 
	public ChoiceVO checkChoice(Long mov_rev_num);
	
	// 영화 삭제시 영화에 달린 리뷰 검색
	public List<Long> findByReview(Long mov_num);
	
	// 영화 삭제시 리뷰삭제
	public void deleteReviews(Long mov_num);
	
	// 동일 아이디 리뷰 중복 방지
	public Long repetitionCheck(MovieReviewVO movieReviewVO);
	
}
