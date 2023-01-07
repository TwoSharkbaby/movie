package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MovieReviewVO;
import org.zerock.mapper.MovieReviewMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MovieReviewMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewMapper movieReviewMapper;

	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		MovieReviewVO movieReviewVO = MovieReviewVO.builder()
				.mov_rev_title("123").mov_num(1L).mem_num(1L).mov_sco_point(1.0).build();
		log.info(movieReviewMapper.insert(movieReviewVO));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testMovieReviewVO() {
		log.info("----------------------------------------------");
		movieReviewMapper.movieReviewRead(1L).forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testGoodUpdate() {
		log.info("----------------------------------------------");
		movieReviewMapper.goodUpdate(1L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testBadUpdate() {
		log.info("----------------------------------------------");
		movieReviewMapper.badUpdate(1L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testCheckChoice() {
		log.info("----------------------------------------------");
		log.info(movieReviewMapper.checkChoice(1L));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testFindByReview() {
		log.info("----------------------------------------------");
		movieReviewMapper.findByReview(1L).forEach(a -> {
			log.info(a);
		});
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testRepetitionCheck() {
		log.info("----------------------------------------------");
		MovieReviewVO vo = MovieReviewVO.builder().mov_num(1L).mem_num(2L).build();
		log.info(movieReviewMapper.repetitionCheck(vo));
		if(movieReviewMapper.repetitionCheck(vo) == null) {
			log.info("널입니다");
		} else {
			log.info("아이디가 존재합니다");
		}
		log.info("----------------------------------------------");
	}

}
