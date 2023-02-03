package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentVO;

public interface MovieReviewCommentService {
	
	// ´ñ±Û ÁÁ¾Æ¿ä
	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	// ´ñ±Û ½È¾î¿ä
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num);
	
	// ´ñ±Û Á¶È¸
	public MovieReviewCommentVO read(Long mov_rev_com_num);
	
	// ´ñ±Û »ý¼º
	public int insert(MovieReviewCommentVO movieReviewCommentVO);
	
	
	// ´ñ±Û »èÁ¦
	public int delete(Long mov_rev_com_num);
	
	
	// ´ñ±Û ¸ñ·Ï
	public List<MovieReviewCommentVO> getList(Criteria cri, Long mov_rev_num);
	
	// ´ñ±Û ¼öÁ¤
	public int update(MovieReviewCommentVO vo);
	
}
