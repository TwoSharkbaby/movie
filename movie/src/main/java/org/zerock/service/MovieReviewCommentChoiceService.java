package org.zerock.service;

import java.util.List;

import org.zerock.domain.CommentPageDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentChoiceVO;

public interface MovieReviewCommentChoiceService {

	
	public CommentPageDTO getListPage(Criteria cri, Long mov_rev_com_cho_num);
	
	public List<MovieReviewCommentChoiceVO> getList(Criteria cri, Long mov_rev_com_cho_num);
	
	//CRUD
	
	public int register(MovieReviewCommentChoiceVO vo);
	
	
	public MovieReviewCommentChoiceVO get(Long mov_rev_com_cho_num);
	
	public int modify(MovieReviewCommentChoiceVO vo);
	
	public int remove(Long mov_rev_com_cho_num);
	
}
