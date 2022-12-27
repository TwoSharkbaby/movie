package org.zerock.service;

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
	
	public void goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	public void badUpdate(Long mov_rev_com_num, Long mem_num);
	
}
