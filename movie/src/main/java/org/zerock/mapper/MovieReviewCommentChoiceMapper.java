package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MovieReviewCommentChoiceVO;

public interface MovieReviewCommentChoiceMapper {

	public List<MovieReviewCommentChoiceVO> getList();
	
	public MovieReviewCommentChoiceVO read(Long mov_rev_com_cho_num);

	public void insert(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);

	public int delete(Long mov_rev_com_cho_num);
	
}
