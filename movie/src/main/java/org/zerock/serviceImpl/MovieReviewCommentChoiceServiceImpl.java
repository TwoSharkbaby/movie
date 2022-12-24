package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.mapper.MovieReviewCommentChoiceMapper;
import org.zerock.service.MovieReviewCommentChoiceService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieReviewCommentChoiceServiceImpl implements MovieReviewCommentChoiceService {

	private final MovieReviewCommentChoiceMapper movieReviewCommentChoiceMapper;
	
	@Override
	public List<MovieReviewCommentChoiceVO> getList() {
		return movieReviewCommentChoiceMapper.getList();
	}

	@Override
	public MovieReviewCommentChoiceVO read(Long mov_rev_com_cho_num) {
		return movieReviewCommentChoiceMapper.read(mov_rev_com_cho_num);
	}

	@Override
	public void insert(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO) {
		movieReviewCommentChoiceMapper.insert(movieReviewCommentChoiceVO);
		
	}

	@Override
	public int delete(Long mov_rev_com_cho_num) {
		return movieReviewCommentChoiceMapper.delete(mov_rev_com_cho_num);
	}

}
