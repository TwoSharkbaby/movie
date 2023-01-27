package org.zerock.mapper;

import org.zerock.domain.MovieReviewVO;
import org.zerock.domain.MovieScoreVO;

public interface MovieScoreMapper {

	// ���� ���
	public int insert(MovieReviewVO movieReviewVO);
	
	// ���� ����
	public int update(MovieReviewVO movieReviewVO);
	
	// ���� ��ȭ ��� ����
	public Double score(Long mov_sco_num);
	
	// �� ��ȭ ����
	public double reviewRead(Long mov_rev_num);
	
	// ���� ������ ���� ����
	public void deleteScores(Long mov_rev_num);
	
}
