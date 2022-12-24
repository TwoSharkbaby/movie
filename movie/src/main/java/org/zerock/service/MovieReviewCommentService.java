package org.zerock.service;

import java.util.List;

import org.zerock.domain.CommentPageDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentVO;


public interface MovieReviewCommentService {

	public CommentPageDTO getListPage(Criteria cri, Long mov_rev_com_num);
	
	public List<MovieReviewCommentVO> getList(Criteria cri, Long mov_rev_com_num);
	
	//CRUD
	
	public int register(MovieReviewCommentVO vo);
	
	
	public MovieReviewCommentVO get(Long mov_rev_com_num);
	
	
	public int modify(MovieReviewCommentVO vo);
	
	public int remove(Long mov_rev_com_num); //Long mov_rev_com_num
	
	
	
}
