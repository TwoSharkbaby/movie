package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MovieReviewChoiceVO;
import org.zerock.domain.MovieReviewVO;
import org.zerock.mapper.MovieReviewChoiceMapper;
import org.zerock.mapper.MovieReviewMapper;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieReviewServiceImpl implements MovieReviewService {

	private final MovieReviewMapper movieReviewMapper;
	private final MovieReviewChoiceMapper movieReviewChoiceMapper;  

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

	@Transactional  // 좋아요누르고 싫어요 누르면 문제발생 고쳐야됨
	@Override       // 없으면 +1 하고 초이스 생성 있으면 -1 하고 초이스 삭제
	public void goodUpdate(Long mov_rev_num, Long mem_num) {
		MovieReviewChoiceVO movieReviewChoiceVO = 
				MovieReviewChoiceVO.builder().mov_rev_num(mov_rev_num).mem_num(mem_num).build(); 
		if(movieReviewChoiceMapper.choiceRead(movieReviewChoiceVO) == null) {
			movieReviewMapper.goodUpdate(mov_rev_num);
			movieReviewChoiceMapper.insert(movieReviewChoiceVO);
		} else {
			movieReviewMapper.goodDowndate(mov_rev_num);
			movieReviewChoiceMapper.delete(movieReviewChoiceVO);
		}
	}

	@Transactional
	@Override
	public void badUpdate(Long mov_rev_num, Long mem_num) {
		MovieReviewChoiceVO movieReviewChoiceVO = 
				MovieReviewChoiceVO.builder().mov_rev_num(mov_rev_num).mem_num(mem_num).build(); 
		if(movieReviewChoiceMapper.choiceRead(movieReviewChoiceVO) == null) {
			movieReviewMapper.badUpdate(mov_rev_num);
			movieReviewChoiceMapper.insert(movieReviewChoiceVO);
		} else {
			movieReviewMapper.badDowndate(mov_rev_num);
			movieReviewChoiceMapper.delete(movieReviewChoiceVO);
		}
	}
	
	
}
