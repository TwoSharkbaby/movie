package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieReviewChoiceVO;
import org.zerock.mapper.MovieReviewChoiceMapper;
import org.zerock.service.MovieReviewChoiceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieReviewChoiceServiceImpl implements MovieReviewChoiceService {

	private final MovieReviewChoiceMapper movieReviewChoiceMapper;
	
	@Override
	public List<MovieReviewChoiceVO> getList() {
		return movieReviewChoiceMapper.getList();
	}

	@Override
	public MovieReviewChoiceVO read(Long mov_rev_cho_num) {
		return movieReviewChoiceMapper.read(mov_rev_cho_num);
	}

	@Override
	public void insert(MovieReviewChoiceVO movieReviewChoiceVO) {
		movieReviewChoiceMapper.insert(movieReviewChoiceVO);
	}

	@Override
	public int delete(Long mov_rev_cho_num) {
		return movieReviewChoiceMapper.delete(mov_rev_cho_num);
	}

	
	
}
