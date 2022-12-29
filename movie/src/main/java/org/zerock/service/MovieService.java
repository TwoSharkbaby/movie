package org.zerock.service;

import java.util.List;

import org.zerock.domain.MovieVO;

public interface MovieService {

	public List<MovieVO> getList();
	
	public List<MovieVO> getActionList();
	
	public List<MovieVO> getFantasyList();
	
	public List<MovieVO> getHorrorList();
	
	public List<MovieVO> getRomanceList();
	
	public List<MovieVO> getComedyList();
	
	public List<MovieVO> getLatestList();
	
	public MovieVO read(Long mov_num);

//	public void insert(MovieVO movieVO);
//
//	public int delete(Long mov_num);

//	public boolean modify(MovieVO vo);
//	
//	public int getTotal(Criteria cri);
	

	
}
