package org.zerock.service;

import java.util.List;

import org.zerock.domain.MovieReviewCommentVO;


public interface MovieReviewCommentService {

	public List<MovieReviewCommentVO> getList();
	
	public MovieReviewCommentVO read(Long mov_rev_com_num);

	public void insert(MovieReviewCommentVO movieReviewCommentVO);

	public int delete(Long mov_rev_com_num);
	
//	public int modify(MovieReviewCommentVO vo);
//	
//	public int remove(Long mov_rev_com_num); //
	
	
	
}
