package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieVO;
import org.zerock.mapper.MovieMapper;
import org.zerock.service.MovieService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieServiceImpl implements MovieService{
	
	private final MovieMapper movieMapper;
	
	@Override
	public List<MovieVO> getList() {
		return movieMapper.getList();
	}

	@Override
	public MovieVO read(Long mov_num) {
		return movieMapper.read(mov_num);
	}

	@Override
	public void insert(MovieVO movieVO) {
		movieMapper.insert(movieVO);
	}

	@Override
	public int delete(Long mov_num) {
		return movieMapper.delete(mov_num);
	}

}
