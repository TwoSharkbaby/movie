package org.zerock.domain;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {

	private int pageNum;
	private int amount;
	
	private String type; 
	private String keyword;
	
	// 기본 페이지 설정
	public Criteria() {
		this(1, 12);
	}

	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	

	public int getPageStart() {
		if(pageNum <= 0) 
			pageNum = 1;
		return (pageNum-1)*amount;
	} 
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split(""); 
	}
	
	public String getListLink() {
		UriComponentsBuilder builder;
		builder = UriComponentsBuilder.fromPath("")
				.queryParam("pageNum", pageNum)
				.queryParam("amount", amount)
				.queryParam("type", type)
				.queryParam("keyword", keyword);
		return builder.toUriString();
	}
}