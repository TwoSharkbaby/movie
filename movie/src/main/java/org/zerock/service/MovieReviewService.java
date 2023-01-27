package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewService {
	
	// ���� ������ ���� ������ �ҷ�����
	public MovieReviewVO read(Long mov_rev_num);

	// ���� ���
	public int insert(MovieReviewVO movieReviewVO);
	
	// ���� ����
	public int modify(MovieReviewVO movieReviewVO);

	// ���� ����
	public int delete(Long mov_rev_num);
	
	// ��ȭ �� ���� �ҷ�����
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	// ���� ���ƿ�
	public ChoiceVO goodUpdate(Long mov_rev_num, Long mem_num);
	
	// ���� �Ⱦ��
	public ChoiceVO badUpdate(Long mov_rev_num, Long mem_num);

}
