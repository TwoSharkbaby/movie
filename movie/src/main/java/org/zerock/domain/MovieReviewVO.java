package org.zerock.domain;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class MovieReviewVO {

	private Long mov_rev_num;
	
	private String mov_rev_title;
	
	private String mov_rev_content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date mov_rev_regdate;
	
	private Long mov_rev_good;
	
	private Long mov_rev_bad;
	
	private Long mov_num;
	
	private Long mem_num;  
	
	private Double mov_sco_point;
	
}
