package org.zerock.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentVO;

public interface MovieReviewCommentMapper {
	
	// ���ƿ� ���
	public void goodUpdate(Long mov_rev_com_num);
	
	// ���ƿ� ���
	public void goodDowndate(Long mov_rev_com_num);
	
	// �Ⱦ�� ���
	public void badUpdate(Long mov_rev_com_num);
	
	// �Ⱦ�� ���
	public void badDowndate(Long mov_rev_com_num);
	
	// ���� �Ǻ�
	public ChoiceVO checkChoice(Long mov_rev_com_num);
	
	// ���信 �޸� ��� �ҷ�����
	public List<Long> findByReviewComment(Long mov_rev_num);
	
	// ���� ������ ��� ����
	public void deleteReviewComments(Long mov_rev_num);
	
	// 댓글 조회
	public MovieReviewCommentVO read(Long mov_rev_com_num);
	
	
	// 댓글 생성
	public int insert(MovieReviewCommentVO movieReviewCommentVO);
	
	
	// 댓글 삭제
	public int delete(Long mov_rev_com_num);
	
	
	// 댓글 수정
	public int update(MovieReviewCommentVO movieReviewCommentVO);
	
	
	// 댓글 목록
	public List<MovieReviewCommentVO> getList(Criteria cri, Long mov_rev_num);
	
	// 댓글 페이징 처리
	public List<MovieReviewCommentVO> getListWithPaging(
			@Param("cri") Criteria cri,
			@Param("mov_rev_num") Long mov_rev_num);

}
