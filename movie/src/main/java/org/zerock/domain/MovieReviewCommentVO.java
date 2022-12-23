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
	
	public String mov_rev_com_content;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss") 
	public Date regdage;
	
	public Long mov_rev_com_good;
	
	public Long mov_rev_com_bad;
	
	public Long mem_num;
	
	
	public Long mov_rev_num;
	
}
