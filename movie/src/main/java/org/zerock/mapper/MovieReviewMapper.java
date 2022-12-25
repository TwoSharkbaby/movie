package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MovieReviewVO;

public interface MovieReviewMapper {

	public List<MovieReviewVO> getList();
	
	public MovieReviewVO read(Long mov_rev_num);

	public void insert(MovieReviewVO movieReviewVO);

	public int delete(Long mov_rev_num);
	
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
}
