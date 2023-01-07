package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MovieReviewChoiceVO;
import org.zerock.mapper.MovieReviewChoiceMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieReviewChoiceMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewChoiceMapper movieReviewChoiceMapper;

	@Test
	public void testChoiceRead() {
		log.info("----------------------------------------------");
		MovieReviewChoiceVO movieReviewChoiceVO = MovieReviewChoiceVO.builder().mov_rev_num(2L).mem_num(1L).build(); 
		if(movieReviewChoiceMapper.choiceRead(movieReviewChoiceVO) == null) {
			log.info("--------널임------------");
		} else {
			log.info("--------널이 아님--------------------------------");
		}
		log.info("----------------------------------------------");
	}

}
