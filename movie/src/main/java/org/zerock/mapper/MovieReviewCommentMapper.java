package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.ChoiceVO;

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
	
}
