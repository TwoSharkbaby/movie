package org.zerock.service;

import java.util.List;

import org.zerock.domain.MovieReviewVO;

public interface MovieReviewService {

//	public List<MovieReviewVO> getList();
//	
//	public MovieReviewVO read(Long mov_rev_num);
//
//	public void insert(MovieReviewVO movieReviewVO);
//
//	public int delete(Long mov_rev_num);
	
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	public void goodUpdate(Long mov_rev_num, Long mem_num);
	
//	public boolean modify(MovieReviewVO vo);
//	
//	public int getTotal(Criteria cri);
}
