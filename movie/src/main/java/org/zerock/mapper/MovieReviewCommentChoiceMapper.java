package org.zerock.mapper;

import org.zerock.domain.MovieReviewCommentChoiceVO;

public interface MovieReviewCommentChoiceMapper {

//	public List<MovieReviewCommentChoiceVO> getList();
//	
//	public MovieReviewCommentChoiceVO read(Long mov_rev_com_cho_num);
//
//	public void insert(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
//
//	public int delete(Long mov_rev_com_cho_num);
	
	public void insert(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	public MovieReviewCommentChoiceVO choiceRead(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);

	public int delete(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	public void update(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
}
