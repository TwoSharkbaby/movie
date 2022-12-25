package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieScoreVO;
import org.zerock.mapper.MovieScoreMapper;
import org.zerock.service.MovieScoreService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieScoreServiceImpl implements MovieScoreService{

	private final MovieScoreMapper movieScoreMapper;

	@Override
	public List<MovieScoreVO> getList() {
		return movieScoreMapper.getList();
	}

	@Override
	public MovieScoreVO read(Long mov_sco_num) {
		return movieScoreMapper.read(mov_sco_num);
	}

	@Override
	public void insert(MovieScoreVO movieScoreVO) {
		movieScoreMapper.insert(movieScoreVO);
	}

	@Override
	public int delete(Long mov_sco_num) {
		return movieScoreMapper.delete(mov_sco_num);
	}

	@Override
	public double score(Long mov_sco_num) {
		return movieScoreMapper.score(mov_sco_num);
	}
	
}
