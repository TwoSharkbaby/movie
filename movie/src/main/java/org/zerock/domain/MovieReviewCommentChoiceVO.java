package org.zerock.domain;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieReviewCommentChoiceVO {

	private Long mov_rev_com_cho_num;
	
	private Long mov_rev_com_num;
	
	private Long mem_num;
}
