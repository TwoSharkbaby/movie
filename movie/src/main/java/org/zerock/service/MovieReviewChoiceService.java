package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewChoiceVO;

import lombok.RequiredArgsConstructor;


public interface MovieReviewChoiceService {

	public List<MovieReviewChoiceVO> getList(Criteria cri);
	
	public MovieReviewChoiceVO get(Long mov_rev_cho_idn);
	
	
	public void register(MovieReviewChoiceVO vo);
	
	
	public boolean remove(Long mov_rev_cho_idn);
	
	public boolean modify(MovieReviewChoiceVO vo);
	
	public int getTotal(Criteria cri);
}
