package org.zerock.mapper;

import org.zerock.domain.MovieReviewChoiceVO;

public interface MovieReviewChoiceMapper {

//	public List<MovieReviewChoiceVO> getList();
//	
//	public MovieReviewChoiceVO read(Long mov_rev_cho_num);

	public void insert(MovieReviewChoiceVO movieReviewChoiceVO);
	
	public MovieReviewChoiceVO choiceRead(Long mov_rev_num, Long mem_num);

//	public int delete(Long mov_rev_cho_num);
	
	
}
