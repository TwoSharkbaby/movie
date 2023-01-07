package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.mapper.ActorMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class ActorMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ActorMapper actorMapper;
	
	@Test
	public void testMovieActorList() {
		log.info("----------------------------------------------");
		actorMapper.movieActorList(1L).forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testReadActorImgs() {
		log.info("----------------------------------------------");
		actorMapper.readActorImgs(3L).forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}

}
