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
public class MovieReviewCommentVO {

	
	private Long mov_rev_com_num;
	
	private String mov_rev_com_content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss") 
	private Date mov_rev_com_regdate; 
	
	private String mem_nickname;
	
	private Long mov_rev_com_good;
	
	private Long mov_rev_com_bad;
	
	private Long mem_num;
	
	private Long mov_rev_num;
	
}
