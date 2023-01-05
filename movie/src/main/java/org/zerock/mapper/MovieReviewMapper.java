package org.zerock.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewMapper {

//	public List<MovieReviewVO> getList();
	
	public MovieReviewVO read(Long mov_rev_num);

	public Long insert(MovieReviewVO movieReviewVO);
	
	public int update(MovieReviewVO movieReviewVO);

	public int delete(Long mov_rev_num);
	
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	public void goodUpdate(Long mov_rev_num);
	
	public void goodDowndate(Long mov_rev_num);
	
	public void badUpdate(Long mov_rev_num);
	
	public void badDowndate(Long mov_rev_num);
	
	public ChoiceVO checkChoice(Long mov_rev_num);
	
	public List<Long> findByReview(Long mov_num);
	
	public void deleteReviews(Long mov_num);
	
	public Long repetitionCheck(MovieReviewVO movieReviewVO);
	
}
