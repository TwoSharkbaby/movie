package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MovieVO;

public interface MovieService {

	public List<MovieVO> getList(Criteria cri);
	
	public MovieVO get(Long mov_idn);
	
	public void register(MovieVO vo);
	
	
	public boolean remove(Long mov_idn);

	
	public boolean modify(MovieVO vo);
	
	public int getTotal(Criteria cri);
	

	
}
