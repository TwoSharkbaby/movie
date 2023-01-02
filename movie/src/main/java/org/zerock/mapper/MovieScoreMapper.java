package org.zerock.mapper;

import org.zerock.domain.MovieReviewVO;
import org.zerock.domain.MovieScoreVO;

public interface MovieScoreMapper {
	
	public MovieScoreVO read(Long mov_sco_num);

	public int insert(MovieReviewVO movieReviewVO);
	
	public int update(MovieReviewVO movieReviewVO);
	
	public Double score(Long mov_sco_num);
	
	public double reviewRead(Long mov_rev_num);
	
	public void deleteScores(Long mov_rev_num);
	
}
