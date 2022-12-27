package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieReviewChoiceVO {

	private Long mov_rev_cho_num;

	private Long mov_rev_num;
	
	private Long mem_num;
	
	private int mov_rev_cho_which;
	
	
}
