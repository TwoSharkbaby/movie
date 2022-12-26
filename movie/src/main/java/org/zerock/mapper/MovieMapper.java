package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.MovieVO;

public interface MovieMapper {

	public List<MovieVO> getList();

//	public List<MovieVO> getListWithPaging(Criteria cri);

	public MovieVO read(Long mov_num);

//	public void insert(MovieVO movieVO);
//
//	public int delete(Long mov_num);

//	public int update(MovieVO movieVO);
//
//	public int getTotalCount(Criteria cri);
//
//	public void updateReplyCnt(@Param("mov_num") Long mov_num, @Param("amount") int amount);
}
