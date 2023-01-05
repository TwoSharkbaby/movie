package org.zerock.domain;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.extern.log4j.Log4j;

@Data
@AllArgsConstructor
@Log4j
public class CommentPageDTO {

	private int commentCnt;
	
	private List<MovieReviewCommentVO> list;  
}
