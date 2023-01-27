package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewService {
	
	// 리뷰 수정시 기존 데이터 불러오기
	public MovieReviewVO read(Long mov_rev_num);

	// 리뷰 등록
	public int insert(MovieReviewVO movieReviewVO);
	
	// 리뷰 수정
	public int modify(MovieReviewVO movieReviewVO);

	// 리뷰 삭제
	public int delete(Long mov_rev_num);
	
	// 영화 상세 리뷰 불러오기
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	// 리뷰 좋아요
	public ChoiceVO goodUpdate(Long mov_rev_num, Long mem_num);
	
	// 리뷰 싫어요
	public ChoiceVO badUpdate(Long mov_rev_num, Long mem_num);

}
