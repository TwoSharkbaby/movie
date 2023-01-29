package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentVO;

public interface MovieReviewCommentMapper {
	
	// 좋아요 등록
	public void goodUpdate(Long mov_rev_com_num);
	
	// 좋아요 취소
	public void goodDowndate(Long mov_rev_com_num);
	
	// 싫어요 등록
	public void badUpdate(Long mov_rev_com_num);
	
	// 싫어요 취소
	public void badDowndate(Long mov_rev_com_num);
	
	// 좋싫 판별
	public ChoiceVO checkChoice(Long mov_rev_com_num);
	
	// 리뷰에 달린 댓글 불러오기
	public List<Long> findByReviewComment(Long mov_rev_num);
	
	// 리뷰 삭제시 댓글 삭제
	public void deleteReviewComments(Long mov_rev_num);
	
	public MovieReviewCommentVO read(Long mov_rev_com_num);
	
	public int insert(MovieReviewCommentVO movieReviewCommentVO);
	
	public int delete(Long mov_rev_com_num);
	
	public int update(MovieReviewCommentVO movieReviewCommentVO);
	
	public List<MovieReviewCommentVO> getList(Criteria cri, Long mov_rev_num);
	
	public List<MovieReviewCommentVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("mov_rev_num") Long mov_rev_num);

}
