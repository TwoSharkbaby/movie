package org.zerock.mapper;

import org.zerock.domain.MovieReviewChoiceVO;

public interface MovieReviewChoiceMapper {

	// ���� ���� ���
	public void insert(MovieReviewChoiceVO movieReviewChoiceVO);
	
	// ���� ���� �ҷ�����
	public MovieReviewChoiceVO choiceRead(MovieReviewChoiceVO movieReviewChoiceVO);

	// ���� ���� ����
	public int delete(MovieReviewChoiceVO movieReviewChoiceVO);
	
	// ���� ���� ����
	public void update(MovieReviewChoiceVO movieReviewChoiceVO);
	
	// ���� ������ �������� ����
	public void deleteReviewChoices(Long mov_num);
	
	
}
