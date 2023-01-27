package org.zerock.mapper;

import org.zerock.domain.MovieReviewChoiceVO;

public interface MovieReviewChoiceMapper {

	// ∏Æ∫‰ ¡¡Ω» µÓ∑œ
	public void insert(MovieReviewChoiceVO movieReviewChoiceVO);
	
	// ∏Æ∫‰ ¡¡Ω» ∫“∑Øø¿±‚
	public MovieReviewChoiceVO choiceRead(MovieReviewChoiceVO movieReviewChoiceVO);

	// ∏Æ∫‰ ¡¡Ω» ªË¡¶
	public int delete(MovieReviewChoiceVO movieReviewChoiceVO);
	
	// ∏Æ∫‰ ¡¡Ω» ºˆ¡§
	public void update(MovieReviewChoiceVO movieReviewChoiceVO);
	
	// ∏Æ∫‰ ªË¡¶Ω√ ∏Æ∫‰¡¡Ω» ªË¡¶
	public void deleteReviewChoices(Long mov_num);
	
	
}
