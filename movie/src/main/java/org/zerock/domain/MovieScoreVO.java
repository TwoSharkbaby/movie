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

	public Long mov_sco_num;
	
	public double mov_sco_point;
	
	public Long mov_num;
	
	public Long mov_rev_num;
}
