package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MovieScoreVO;

public interface MovieScoreMapper {

//	public List<MovieScoreVO> getList();
//	
//	public MovieScoreVO read(Long mov_sco_num);
//
//	public void insert(MovieScoreVO movieScoreVO);
//
//	public int delete(Long mov_sco_num);
	
	public Double score(Long mov_sco_num);
	
	public double reviewRead(Long mov_rev_num);
	
}
