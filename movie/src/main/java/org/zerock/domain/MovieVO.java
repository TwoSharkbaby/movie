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
public class MovieVO {

	private Long mov_num;
	
	private String mov_title;
	
	private String mov_director;
	
	private String mov_genre;
	
	private String mov_synopsis;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mov_release;
	
	@DateTimeFormat(pattern = "HH:mm")
	private Date mov_runtime;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private Date mov_regdate;
	
	private String mov_img;
	
	private String mov_thumb;
	
	public double mov_sco_point;
	 
}
