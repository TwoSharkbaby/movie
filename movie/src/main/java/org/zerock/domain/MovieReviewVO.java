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
public class MovieReviewVO {

	public Long mov_rev_num;
	
	public String mov_rev_title;
	
	public String mov_rev_content;
	
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	public Date mov_rev_regdate;
	
	public Long mov_rev_good;
	
	public Long mov_rev_bad;
	
	public Long mov_num;
	
	public Long mem_num;  
	
}
