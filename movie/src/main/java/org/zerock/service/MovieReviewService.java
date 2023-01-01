package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewService {

//	public List<MovieReviewVO> getList();
	
	public MovieReviewVO read(Long mov_rev_num);

	public int insert(MovieReviewVO movieReviewVO);
	
	public int modify(MovieReviewVO movieReviewVO);

	public int delete(Long mov_rev_num);
	
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	// mem_num은 리뷰를 쓴사람이 아니고 좋아요싫어요의 맴버를 뜻함
	public ChoiceVO goodUpdate(Long mov_rev_num, Long mem_num);
	
	// mem_num은 리뷰를 쓴사람이 아니고 좋아요싫어요의 맴버를 뜻함
	public ChoiceVO badUpdate(Long mov_rev_num, Long mem_num);
	
//	public int getTotal(Criteria cri);
}
