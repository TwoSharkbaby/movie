package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MovieReviewVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MovieReviewServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewService movieReviewService;

	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		MovieReviewVO movieReviewVO = MovieReviewVO.builder()
				.mov_rev_title("123").mov_num(1L).mem_num(1L).mov_sco_point(2.0).build();
		movieReviewService.insert(movieReviewVO);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testMovieReviewRead() {
		log.info("----------------------------------------------");
		movieReviewService.movieReviewRead(1L).forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testGoodUpdate() {
		log.info("----------------------------------------------");
		movieReviewService.goodUpdate(1L, 1L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testBadUpdate() {
		log.info("----------------------------------------------");
		movieReviewService.badUpdate(1L, 1L);
		log.info("----------------------------------------------");
	}

}
