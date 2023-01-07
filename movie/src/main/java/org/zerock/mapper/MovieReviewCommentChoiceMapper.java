package org.zerock.mapper;

import org.zerock.domain.MovieReviewCommentChoiceVO;

public interface MovieReviewCommentChoiceMapper {
	
	// ��� ���� ���
	public void insert(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	// ��� ���� �ҷ�����
	public MovieReviewCommentChoiceVO choiceRead(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);

	// ��� ���� ����
	public int delete(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	// ��� ���� ����
	public void update(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	// ���� ������ ��� ���� ����
	public void deleteReviewCommentChoices(Long mov_rev_com_num);
	
}
