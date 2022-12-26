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

	@Transactional  
	@Override       // 맴버 중복 체크 확인바람 없으면 입력 / 있으면 삭제
	public void goodUpdate(Long mov_rev_num, Long mem_num) {
//		if() {
//			
//		} else {
//			
//		}
		movieReviewMapper.goodUpdate(mov_rev_num);
		MovieReviewChoiceVO movRevCho = 
				MovieReviewChoiceVO.builder().mov_rev_num(mov_rev_num).mem_num(mem_num).build();
		movieReviewChoiceMapper.insert(movRevCho);
	}
	
	
}
