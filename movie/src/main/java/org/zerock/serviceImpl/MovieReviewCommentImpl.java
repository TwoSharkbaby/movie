package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.domain.MovieReviewCommentVO;
import org.zerock.mapper.MovieReviewCommentChoiceMapper;
import org.zerock.mapper.MovieReviewCommentMapper;
import org.zerock.service.MovieReviewCommentService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MovieReviewCommentImpl implements MovieReviewCommentService {
	
	private final MovieReviewCommentMapper movieReviewCommentMapper;
	private final MovieReviewCommentChoiceMapper movieReviewCommentChoiceMapper;
	@Override
	public List<MovieReviewCommentVO> getList(Criteria cri, Long mov_rev_num) {
		return movieReviewCommentMapper.getListWithPaging(cri, mov_rev_num);
	}
	


	@Override
	public MovieReviewCommentVO read(Long mov_rev_com_num) {
		return movieReviewCommentMapper.read(mov_rev_com_num);
	}

	@Override
	public int insert(MovieReviewCommentVO movieReviewCommentVO) {
	
		return movieReviewCommentMapper.insert(movieReviewCommentVO);
		
	}

	@Override
	public int delete(Long mov_rev_com_num) {
		return movieReviewCommentMapper.delete(mov_rev_com_num);
	}
	
@Override
public int update(MovieReviewCommentVO vo) {
	// TODO Auto-generated method stub
	return movieReviewCommentMapper.update(vo);
}
	// 리뷰 좋아요 / 싫어요 기록이 있으면 싫어요 취소 후 좋아요 등록
	// 좋아요 기록이 있으면 좋아요 취소 / 기록이 없으면 좋아요 등록 / 좋아요 1
	@Transactional
	@Override
	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num) {
		MovieReviewCommentChoiceVO movieReviewCommentChoiceVO = 
				MovieReviewCommentChoiceVO.builder().mov_rev_com_num(mov_rev_com_num)
				.mem_num(mem_num).mov_rev_com_cho_which(1).build();
		MovieReviewCommentChoiceVO checkVO = movieReviewCommentChoiceMapper.choiceRead(movieReviewCommentChoiceVO);
		if(checkVO == null) {
			movieReviewCommentMapper.goodUpdate(mov_rev_com_num);
			movieReviewCommentChoiceMapper.insert(movieReviewCommentChoiceVO);
			return movieReviewCommentMapper.checkChoice(mov_rev_com_num);
		} else {
			if(checkVO.getMov_rev_com_cho_which() == 1) {
				movieReviewCommentMapper.goodDowndate(mov_rev_com_num);
				movieReviewCommentChoiceMapper.delete(movieReviewCommentChoiceVO);
				return movieReviewCommentMapper.checkChoice(mov_rev_com_num);
			} else {
				movieReviewCommentMapper.badDowndate(mov_rev_com_num);
				movieReviewCommentMapper.goodUpdate(mov_rev_com_num);
				checkVO.setMov_rev_com_cho_which(1);
				movieReviewCommentChoiceMapper.update(checkVO);
				return movieReviewCommentMapper.checkChoice(mov_rev_com_num);
			}
		}
	}
	// 리뷰 좋아요 / 싫어요 기록이 있으면 싫어요 취소 후 좋아요 등록
	// 좋아요 기록이 있으면 좋아요 취소 / 기록이 없으면 좋아요 등록 / 싫어요2
	@Transactional
	@Override
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num) {
		MovieReviewCommentChoiceVO movieReviewCommentChoiceVO = 
				MovieReviewCommentChoiceVO.builder().mov_rev_com_num(mov_rev_com_num)
				.mem_num(mem_num).mov_rev_com_cho_which(2).build();
		MovieReviewCommentChoiceVO checkVO = movieReviewCommentChoiceMapper.choiceRead(movieReviewCommentChoiceVO);
		if(checkVO == null) {
			movieReviewCommentMapper.badUpdate(mov_rev_com_num);
			movieReviewCommentChoiceMapper.insert(movieReviewCommentChoiceVO);
			return movieReviewCommentMapper.checkChoice(mov_rev_com_num);
		} else {
			if(checkVO.getMov_rev_com_cho_which() == 2) {
				movieReviewCommentMapper.badDowndate(mov_rev_com_num);
				movieReviewCommentChoiceMapper.delete(movieReviewCommentChoiceVO);
				return movieReviewCommentMapper.checkChoice(mov_rev_com_num);
			} else {
				movieReviewCommentMapper.goodDowndate(mov_rev_com_num);
				movieReviewCommentMapper.badUpdate(mov_rev_com_num);
				checkVO.setMov_rev_com_cho_which(2);
				movieReviewCommentChoiceMapper.update(checkVO);
				return movieReviewCommentMapper.checkChoice(mov_rev_com_num);
			}
		}
	}

}
