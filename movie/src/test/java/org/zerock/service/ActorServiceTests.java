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
public class ActorServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ActorService actorService;
	
	@Test
	public void testMovieActorList() {
		log.info("----------------------------------------------");
		actorService.movieActorList(1L).forEach(b -> log.info(b));
		log.info("----------------------------------------------");

	}

}
