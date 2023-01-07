package org.zerock.mapper;

import org.zerock.domain.MovieReviewVO;
import org.zerock.domain.MovieScoreVO;

public interface MovieScoreMapper {

	// 평점 등록
	public int insert(MovieReviewVO movieReviewVO);
	
	// 평점 수정
	public int update(MovieReviewVO movieReviewVO);
	
	// 메인 영화 평균 평점
	public Double score(Long mov_sco_num);
	
	// 상세 영화 평점
	public double reviewRead(Long mov_rev_num);
	
	// 리뷰 삭제시 평점 삭제
	public void deleteScores(Long mov_rev_num);
	
}
