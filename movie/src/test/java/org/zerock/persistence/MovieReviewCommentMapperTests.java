package org.zerock.persistence;

import java.util.Calendar;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MovieReviewCommentVO;
import org.zerock.mapper.MovieReviewCommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieReviewCommentMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewCommentMapper movieReviewCommentMapper;
	
	@Test
	public void testCheckChoice() {
		log.info("----------------------------------------------");
		log.info(movieReviewCommentMapper.checkChoice(1L));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testFindByReviewComment() {
		log.info("----------------------------------------------");
		movieReviewCommentMapper.findByReviewComment(3L);
		log.info("----------------------------------------------");
	}

	@Test
	public void testInsert() {
		MovieReviewCommentVO vo = new MovieReviewCommentVO();
		vo.setMov_rev_com_num(1L);
		vo.setMov_rev_com_content("Last");
		vo.setMem_nickname("lmw6434");
		vo.setMem_num(2L);
		vo.setMov_rev_num(2L);
		movieReviewCommentMapper.insert(vo);

	}
}
