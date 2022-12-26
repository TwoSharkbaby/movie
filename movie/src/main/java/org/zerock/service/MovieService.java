package org.zerock.service;

import java.util.List;

import org.zerock.domain.MovieVO;

public interface MovieService {

	public List<MovieVO> getList();
	
	public MovieVO read(Long mov_num);

//	public void insert(MovieVO movieVO);
//
//	public int delete(Long mov_num);

//	public boolean modify(MovieVO vo);
//	
//	public int getTotal(Criteria cri);
	

	
}
