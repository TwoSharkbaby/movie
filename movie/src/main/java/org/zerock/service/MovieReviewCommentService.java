package org.zerock.service;

import org.zerock.domain.ChoiceVO;

public interface MovieReviewCommentService {
	
	// ��� ���ƿ�
	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	// ��� �Ⱦ��
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num);
	
}
