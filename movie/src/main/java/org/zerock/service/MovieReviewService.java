package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewService {

	public List<MovieReviewVO> getList(Criteria cri);
	
	public MovieReviewVO get(Long mov_rev_idn);
	
	public void register(MovieReviewVO vo);
	
	public boolean remove(Long mov_rev_idn);
	
	
	public boolean modify(MovieReviewVO vo);
	
	
	
	public int getTotal(Criteria cri);
}
