package org.zerock.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieScoreVO {

	private Long mov_sco_num;
	
	private Double mov_sco_point;
	
	private Long mov_num;
	
	private Long mov_rev_num;
}
