package org.zerock.serviceImpl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieReviewVO;
import org.zerock.domain.MovieVO;
import org.zerock.mapper.MovieReviewMapper;
import org.zerock.mapper.MovieScoreMapper;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieReviewServiceImpl implements MovieReviewService {

	private final MovieReviewMapper movieReviewMapper;
	private final MovieScoreMapper movieScoreMapper;

	@Override
	public List<MovieReviewVO> getList() {
		return movieReviewMapper.getList();
	}

	@Override
	public MovieReviewVO read(Long mov_rev_num) {
		return movieReviewMapper.read(mov_rev_num);
	}

	@Override
	public void insert(MovieReviewVO movieReviewVO) {
		movieReviewMapper.insert(movieReviewVO);
		
	}

	@Override
	public int delete(Long mov_rev_num) {
		return movieReviewMapper.delete(mov_rev_num);
	}

	@Override
	public List<MovieReviewVO> movieReviewRead(Long mov_num) {
		List<MovieReviewVO> list = new ArrayList<MovieReviewVO>();
		list =  movieReviewMapper.movieReviewRead(mov_num);
		list.forEach(lists -> {
			lists.setMov_sco_point(movieScoreMapper.reviewRead(lists.getMov_rev_num()));
		});
		return list;
	}
	
	
}
