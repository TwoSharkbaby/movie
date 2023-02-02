package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentVO;

public interface MovieReviewCommentService {
	
	// ��� ���ƿ�
	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	// ��� �Ⱦ��
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num);
	
	// 댓글 조회
	public MovieReviewCommentVO read(Long mov_rev_com_num);
	
	
	// 댓글 생성
	public int insert(MovieReviewCommentVO movieReviewCommentVO);
	
	
	// 댓글 삭제
	public int delete(Long mov_rev_com_num);
	
	
	// 댓글 목록
	public List<MovieReviewCommentVO> getList(Criteria cri, Long mov_rev_num);
	
	// 댓글 수정
	public int update(MovieReviewCommentVO vo);
}
