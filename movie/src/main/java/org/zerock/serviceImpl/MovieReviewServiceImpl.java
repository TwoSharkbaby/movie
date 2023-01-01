package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewChoiceVO;
import org.zerock.domain.MovieReviewVO;
import org.zerock.mapper.MovieReviewChoiceMapper;
import org.zerock.mapper.MovieReviewCommentChoiceMapper;
import org.zerock.mapper.MovieReviewCommentMapper;
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
	private final MovieReviewChoiceMapper movieReviewChoiceMapper;  
	private final MovieReviewCommentMapper movieReviewCommentMapper;
	private final MovieReviewCommentChoiceMapper movieReviewCommentChoiceMapper;

//	@Override
//	public List<MovieReviewVO> getList() {
//		return movieReviewMapper.getList();
//	}

	@Transactional
	@Override
	public MovieReviewVO read(Long mov_rev_num) {
		MovieReviewVO vo = movieReviewMapper.read(mov_rev_num);
		vo.setMov_sco_point(movieScoreMapper.reviewRead(mov_rev_num));
		return vo;
	}
	
	@Transactional
	@Override
	public int insert(MovieReviewVO movieReviewVO) {
		movieReviewMapper.insert(movieReviewVO);
		movieReviewVO.setMov_rev_num(movieReviewVO.getMov_rev_num());
		return movieScoreMapper.insert(movieReviewVO);
	}

	@Transactional
	@Override
	public int modify(MovieReviewVO movieReviewVO) {
		movieReviewMapper.update(movieReviewVO);
		return movieScoreMapper.update(movieReviewVO);
	}

	@Transactional
	@Override
	public int delete(Long mov_rev_num) {
		movieReviewCommentMapper.findByReviewComment(mov_rev_num).forEach(commentNum -> {
			movieReviewCommentChoiceMapper.deleteReviewCommentChoices(commentNum);
			movieReviewCommentMapper.deleteReviewComments(commentNum);
		});
		movieReviewChoiceMapper.deleteReviewChoices(mov_rev_num);
		movieScoreMapper.deleteScores(mov_rev_num);
		return movieReviewMapper.delete(mov_rev_num);
	}

	@Transactional
	@Override
	public List<MovieReviewVO> movieReviewRead(Long mov_num) {
		return movieReviewMapper.movieReviewRead(mov_num);
	}

	@Transactional  
	@Override      
	public ChoiceVO goodUpdate(Long mov_rev_num, Long mem_num) {
		MovieReviewChoiceVO movieReviewChoiceVO = 
				MovieReviewChoiceVO.builder().mov_rev_num(mov_rev_num)
				.mem_num(mem_num).mov_rev_cho_which(1).build(); 
		MovieReviewChoiceVO checkVO = movieReviewChoiceMapper.choiceRead(movieReviewChoiceVO);
		if(checkVO == null) {
			movieReviewMapper.goodUpdate(mov_rev_num);
			movieReviewChoiceMapper.insert(movieReviewChoiceVO);
			return movieReviewMapper.checkChoice(mov_rev_num);
		} else {
			if(checkVO.getMov_rev_cho_which() == 1) {
				movieReviewMapper.goodDowndate(mov_rev_num);
				movieReviewChoiceMapper.delete(movieReviewChoiceVO);
				return movieReviewMapper.checkChoice(mov_rev_num);
			} else {
				movieReviewMapper.badDowndate(mov_rev_num);
				movieReviewMapper.goodUpdate(mov_rev_num);
				checkVO.setMov_rev_cho_which(1);
				movieReviewChoiceMapper.update(checkVO);
				return movieReviewMapper.checkChoice(mov_rev_num);
			}
		}
	}

	@Transactional
	@Override
	public ChoiceVO badUpdate(Long mov_rev_num, Long mem_num) {
		MovieReviewChoiceVO movieReviewChoiceVO = 
				MovieReviewChoiceVO.builder().mov_rev_num(mov_rev_num)
				.mem_num(mem_num).mov_rev_cho_which(2).build(); 
		MovieReviewChoiceVO checkVO = movieReviewChoiceMapper.choiceRead(movieReviewChoiceVO);
		if(checkVO == null) {
			movieReviewMapper.badUpdate(mov_rev_num);
			movieReviewChoiceMapper.insert(movieReviewChoiceVO);
			return movieReviewMapper.checkChoice(mov_rev_num);
		} else {
			if(checkVO.getMov_rev_cho_which() == 2) {
				movieReviewMapper.badDowndate(mov_rev_num);
				movieReviewChoiceMapper.delete(movieReviewChoiceVO);
				return movieReviewMapper.checkChoice(mov_rev_num);
			} else {
				movieReviewMapper.goodDowndate(mov_rev_num);
				movieReviewMapper.badUpdate(mov_rev_num);
				checkVO.setMov_rev_cho_which(2);
				movieReviewChoiceMapper.update(checkVO);
				return movieReviewMapper.checkChoice(mov_rev_num);
			}
		}
	}
	
}
