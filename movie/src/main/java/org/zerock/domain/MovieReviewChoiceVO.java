package org.zerock.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieReviewChoiceVO {

	
	public Long mov_rev_cho_num;

	public Long mov_rev_num;
	
	public Long mem_num;
	
	
}
