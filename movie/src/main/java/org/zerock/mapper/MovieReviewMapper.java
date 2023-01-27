package org.zerock.mapper;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewMapper {
	
	// ���� ������ ���� ���� �ҷ�����
	public MovieReviewVO read(Long mov_rev_num);

	// ���� ���
	public Long insert(MovieReviewVO movieReviewVO);
	
	// ���� ����
	public int update(MovieReviewVO movieReviewVO);

	// ���� ����
	public int delete(Long mov_rev_num);
	
	// ��ȭ �� ����
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	// ���ƿ� ���
	public void goodUpdate(Long mov_rev_num);
	
	// ���ƿ� ���
	public void goodDowndate(Long mov_rev_num);
	
	// �Ⱦ�� ���
	public void badUpdate(Long mov_rev_num);
	
	// �Ⱦ�� ���
	public void badDowndate(Long mov_rev_num);
	
	// ���� ���� �Ǻ� 
	public ChoiceVO checkChoice(Long mov_rev_num);
	
	// ��ȭ ������ ��ȭ�� �޸� ���� �˻�
	public List<Long> findByReview(Long mov_num);
	
	// ��ȭ ������ �������
	public void deleteReviews(Long mov_num);
	
	// ���� ���̵� ���� �ߺ� ����
	public Long repetitionCheck(MovieReviewVO movieReviewVO);
	
}
