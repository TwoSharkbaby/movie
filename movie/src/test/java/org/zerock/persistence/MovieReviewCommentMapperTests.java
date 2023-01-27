package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
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

}
