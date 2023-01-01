package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewCommentVO;

public interface MovieReviewCommentMapper {
	
//	public List<MovieReviewCommentVO> getList();
//	
//	public MovieReviewCommentVO read(Long mov_rev_com_num);
//
//	public void insert(MovieReviewCommentVO movieReviewCommentVO);
//
//	public int delete(Long mov_rev_com_num);
//	
	public List<MovieReviewCommentVO> getCommentList(Long mov_rev_num);
	
	public void goodUpdate(Long mov_rev_com_num);
	
	public void goodDowndate(Long mov_rev_com_num);
	
	public void badUpdate(Long mov_rev_com_num);
	
	public void badDowndate(Long mov_rev_com_num);
	
	public ChoiceVO checkChoice(Long mov_rev_com_num);
	
	public List<Long> findByReviewComment(Long mov_rev_num);
	
	public void deleteReviewComments(Long mov_rev_num);
	
}
