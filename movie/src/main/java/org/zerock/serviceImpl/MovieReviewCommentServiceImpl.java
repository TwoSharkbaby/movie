package org.zerock.serviceImpl;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.mapper.MovieReviewCommentChoiceMapper;
import org.zerock.mapper.MovieReviewCommentMapper;
import org.zerock.service.MovieReviewCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MovieReviewCommentServiceImpl implements MovieReviewCommentService {
	
	private final MovieReviewCommentMapper movieReviewCommentMapper;
	private final MovieReviewCommentChoiceMapper movieReviewCommentChoiceMapper;
	
	@Transactional
	@Override
	public void goodUpdate(Long mov_rev_com_num, Long mem_num) {
		MovieReviewCommentChoiceVO movieReviewCommentChoiceVO = 
				MovieReviewCommentChoiceVO.builder().mov_rev_com_num(mov_rev_com_num)
				.mem_num(mem_num).mov_rev_com_cho_which(1).build();
		MovieReviewCommentChoiceVO checkVO = movieReviewCommentChoiceMapper.choiceRead(movieReviewCommentChoiceVO);
		if(checkVO == null) {
			movieReviewCommentMapper.goodUpdate(mov_rev_com_num);
			movieReviewCommentChoiceMapper.insert(movieReviewCommentChoiceVO);
		} else {
			if(checkVO.getMov_rev_com_cho_which() == 1) {
				movieReviewCommentMapper.goodDowndate(mov_rev_com_num);
				movieReviewCommentChoiceMapper.delete(movieReviewCommentChoiceVO);
			} else {
				movieReviewCommentMapper.badDowndate(mov_rev_com_num);
				movieReviewCommentMapper.goodUpdate(mov_rev_com_num);
				checkVO.setMov_rev_com_cho_which(1);
				movieReviewCommentChoiceMapper.update(checkVO);
			}
		}
	}
	
	@Transactional
	@Override
	public void badUpdate(Long mov_rev_com_num, Long mem_num) {
		MovieReviewCommentChoiceVO movieReviewCommentChoiceVO = 
				MovieReviewCommentChoiceVO.builder().mov_rev_com_num(mov_rev_com_num)
				.mem_num(mem_num).mov_rev_com_cho_which(2).build();
		MovieReviewCommentChoiceVO checkVO = movieReviewCommentChoiceMapper.choiceRead(movieReviewCommentChoiceVO);
		if(checkVO == null) {
			movieReviewCommentMapper.badUpdate(mov_rev_com_num);
			movieReviewCommentChoiceMapper.insert(movieReviewCommentChoiceVO);
		} else {
			if(checkVO.getMov_rev_com_cho_which() == 2) {
				movieReviewCommentMapper.badDowndate(mov_rev_com_num);
				movieReviewCommentChoiceMapper.delete(movieReviewCommentChoiceVO);
			} else {
				movieReviewCommentMapper.goodDowndate(mov_rev_com_num);
				movieReviewCommentMapper.badUpdate(mov_rev_com_num);
				checkVO.setMov_rev_com_cho_which(2);
				movieReviewCommentChoiceMapper.update(checkVO);
			}
		}
	}

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
