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
public class MemberVO {

	private Long mem_num;
	
	private String mem_id;
	
	private String mem_pw;
	
	private String mem_name;
	
	private String mem_nickname;
	
	private String mem_email;
	
	private String mem_contact;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	private Date mem_regdate;
	
	private List<AuthVO> authList; 
	
}
