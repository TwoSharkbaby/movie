package org.zerock.service;

import org.zerock.domain.ChoiceVO;

public interface MovieReviewCommentService {

//	public List<MovieReviewCommentVO> getList();
//	
//	public MovieReviewCommentVO read(Long mov_rev_com_num);
//
//	public void insert(MovieReviewCommentVO movieReviewCommentVO);
//
//	public int delete(Long mov_rev_com_num);
//	
//	public List<MovieReviewCommentVO> getCommentList(Long mov_rev_num);
	
//	public int modify(MovieReviewCommentVO vo);
//	
//	public int remove(Long mov_rev_com_num); //
	
	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num);
	
}
