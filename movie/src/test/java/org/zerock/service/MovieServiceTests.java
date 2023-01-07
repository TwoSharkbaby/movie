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
public class MovieServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieService movieService;

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		movieService.read(1L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testReadAttachFileDTO() {
		log.info("----------------------------------------------");
		log.info(movieService.readAttachFileDTO(16L));
		log.info("----------------------------------------------");
	}

}
