package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieReviewVO;
import org.zerock.mapper.MovieReviewMapper;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieReviewServiceImpl implements MovieReviewService {

	private final MovieReviewMapper movieReviewMapper;

//	@Override
//	public List<MovieReviewVO> getList() {
//		return movieReviewMapper.getList();
//	}
//
//	@Override
//	public MovieReviewVO read(Long mov_rev_num) {
//		return movieReviewMapper.read(mov_rev_num);
//	}
//
//	@Override
//	public void insert(MovieReviewVO movieReviewVO) {
//		movieReviewMapper.insert(movieReviewVO);
//		
//	}
//
//	@Override
//	public int delete(Long mov_rev_num) {
//		return movieReviewMapper.delete(mov_rev_num);
//	}

	@Override
	public List<MovieReviewVO> movieReviewRead(Long mov_num) {
		return movieReviewMapper.movieReviewRead(mov_num);
	}
	
	
}
