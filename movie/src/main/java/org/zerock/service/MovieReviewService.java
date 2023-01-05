package org.zerock.service;

import java.util.List;

import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewVO;

public interface MovieReviewService {

//	public List<MovieReviewVO> getList();
	
	public MovieReviewVO read(Long mov_rev_num);

	public int insert(MovieReviewVO movieReviewVO);
	
	public int modify(MovieReviewVO movieReviewVO);

	public int delete(Long mov_rev_num);
	
	public List<MovieReviewVO> movieReviewRead(Long mov_num);
	
	// mem_num�� ���並 ������� �ƴϰ� ���ƿ�Ⱦ���� �ɹ��� ����
	public ChoiceVO goodUpdate(Long mov_rev_num, Long mem_num);
	
	// mem_num�� ���並 ������� �ƴϰ� ���ƿ�Ⱦ���� �ɹ��� ����
	public ChoiceVO badUpdate(Long mov_rev_num, Long mem_num);
	
//	public int getTotal(Criteria cri);
}
