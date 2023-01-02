package org.zerock.service;

import java.util.List;

import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.Criteria;
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
	
	public List<MovieVO> getListWithPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);

	public int insert(MovieVO movieVO);

	public int delete(Long mov_num);
	
	public int modify(MovieVO movieVO);
	
	public AttachFileDTO readAttachFileDTO(Long mov_num);
	
}
