package org.zerock.mapper;

import org.zerock.domain.MovieReviewCommentChoiceVO;

public interface MovieReviewCommentChoiceMapper {
	
	// ¥Ò±€ ¡¡Ω» µÓ∑œ
	public void insert(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	// ¥Ò±€ ¡¡Ω» ∫“∑Øø¿±‚
	public MovieReviewCommentChoiceVO choiceRead(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);

	// ¥Ò±€ ¡¡Ω» ªË¡¶
	public int delete(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	// ¥Ò±€ ¡¡Ω» ºˆ¡§
	public void update(MovieReviewCommentChoiceVO movieReviewCommentChoiceVO);
	
	// ∏Æ∫‰ ªË¡¶Ω√ ¥Ò±€ ¡¡Ω» ªË¡¶
	public void deleteReviewCommentChoices(Long mov_rev_com_num);
	
}
