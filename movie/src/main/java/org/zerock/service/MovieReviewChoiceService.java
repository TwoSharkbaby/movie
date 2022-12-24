package org.zerock.service;

import java.util.List;

import org.zerock.domain.MovieReviewChoiceVO;


public interface MovieReviewChoiceService {

	public List<MovieReviewChoiceVO> getList();
	
	public MovieReviewChoiceVO read(Long mov_rev_cho_num);

	public void insert(MovieReviewChoiceVO movieReviewChoiceVO);

	public int delete(Long mov_rev_cho_num);
	
//	public boolean modify(MovieReviewChoiceVO vo);
//	
//	public int getTotal(Criteria cri);
}
