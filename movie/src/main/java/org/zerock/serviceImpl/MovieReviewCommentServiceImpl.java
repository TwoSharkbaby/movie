package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.zerock.domain.MovieReviewCommentVO;
import org.zerock.mapper.MovieReviewCommentMapper;
import org.zerock.service.MovieReviewCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieReviewCommentServiceImpl implements MovieReviewCommentService {
	
	private final MovieReviewCommentMapper movieReviewCommentMapper;
	
//	@Override
//	public List<MovieReviewCommentVO> getList() {
//		return movieReviewCommentMapper.getList();
//	}
//
//	@Override
//	public MovieReviewCommentVO read(Long mov_rev_com_num) {
//		return movieReviewCommentMapper.read(mov_rev_com_num);
//	}
//
//	@Override
//	public void insert(MovieReviewCommentVO movieReviewCommentVO) {
//		movieReviewCommentMapper.insert(movieReviewCommentVO);
//		
//	}
//
//	@Override
//	public int delete(Long mov_rev_com_num) {
//		return movieReviewCommentMapper.delete(mov_rev_com_num);
//	}
//
//	@Override
//	public List<MovieReviewCommentVO> getCommentList(Long mov_rev_num) {
//		return movieReviewCommentMapper.getCommentList(mov_rev_num);
//	}

}
