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
public class ActorVO {

	private Long act_num;
	
	private String act_name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date act_birth;
	
	private String act_sex;
	
	private String act_info;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date act_regdate;
	
	private String act_img;
	
	private String act_thumb;
	
	private Long mov_num;
	
}
