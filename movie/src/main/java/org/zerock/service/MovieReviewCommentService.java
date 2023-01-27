package org.zerock.service;

import org.zerock.domain.ChoiceVO;

public interface MovieReviewCommentService {
	
	// ´ñ±Û ÁÁ¾Æ¿ä
	public ChoiceVO goodUpdate(Long mov_rev_com_num, Long mem_num);
	
	// ´ñ±Û ½È¾î¿ä
	public ChoiceVO badUpdate(Long mov_rev_com_num, Long mem_num);
	
}
