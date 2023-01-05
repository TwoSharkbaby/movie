package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ActorVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ActorServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private ActorService actorService;

//	@Test
//	public void testGetList() {
//		log.info("----------------------------------------------");
//		actorService.getList().forEach(b -> log.info(b));
//		log.info("----------------------------------------------");
//
//	}
//
//	@Test
//	public void testRead() {
//		log.info("----------------------------------------------");
//		actorService.read(1L);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testInsert() {
//		log.info("----------------------------------------------");
//		ActorVO actorVO = ActorVO.builder().act_name("kkk11").mov_num(3L).build();
//		actorService.insert(actorVO);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testDelete() {
//		log.info("----------------------------------------------");
//		actorService.delete(7L);
//		log.info("----------------------------------------------");
//	}
	
//	@Test
//	public void testTotal() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?…Œ?Š¤?Š¸");
//		log.info(".........................Total:" + boardMapper.getTotalCount(cri));
//	}
//	
//	@Test
//	public void testGetListWithPaging() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?…Œ?Š¤?Š¸");
//		boardMapper.getListWithPaging(cri);
//	}
//	@Test
//	public void testUpdate() {
//		BoardVO vo = BoardVO.builder().bno(3L).title("?‚œ?‚˜?‚œ").content("ë¬´ë‚˜?‚œ").writer("ë£¨ë¼?ž„").build();
//		int result = boardMapper.update(vo);
//		log.info("===========================================================");
//		log.info("count.............." + result);
//		log.info("===========================================================");
//	}
	
	@Test
	public void testMovieActorList() {
		log.info("----------------------------------------------");
		actorService.movieActorList(1L).forEach(b -> log.info(b));
		log.info("----------------------------------------------");

	}

}
