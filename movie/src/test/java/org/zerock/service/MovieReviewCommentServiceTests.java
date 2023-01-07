package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieReviewCommentServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewCommentService movieReviewCommentService;
	
	@Test
	public void testGoodUpdate() {
		log.info("----------------------------------------------");
		movieReviewCommentService.goodUpdate(1L, 1L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testBadUpdate() {
		log.info("----------------------------------------------");
		movieReviewCommentService.badUpdate(1L, 1L);
		log.info("----------------------------------------------");
	}

}
