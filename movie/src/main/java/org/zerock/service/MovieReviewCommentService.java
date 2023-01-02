package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewCommentVO;

public interface MovieReviewCommentService {

//	public List<MovieReviewCommentVO> getList();
//	
	public MovieReviewCommentVO read(Long mov_rev_com_num);
//
	public int insert(MovieReviewCommentVO movieReviewCommentVO);
//
	public int delete(Long mov_rev_com_num);
//	
	public List<MovieReviewCommentVO> getCommentList(Long mov_rev_num);
	
//	public int modify(MovieReviewCommentVO vo);
//	
//	public int remove(Long mov_rev_com_num); //
	
	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num);
	
}
