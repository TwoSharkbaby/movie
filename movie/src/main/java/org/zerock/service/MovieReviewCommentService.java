package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentVO;

public interface MovieReviewCommentService {

//	
	public MovieReviewCommentVO read(Long mov_rev_com_num);
//
	public int insert(MovieReviewCommentVO movieReviewCommentVO);
//
	public int delete(Long mov_rev_com_num);
//	
	public List<MovieReviewCommentVO> getList(Criteria cri, Long mov_rev_num);
	
	public int update(MovieReviewCommentVO vo);

	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num);
	
}
