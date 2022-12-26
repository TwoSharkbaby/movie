package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ActorVO;
import org.zerock.mapper.ActorMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ActorMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private ActorMapper actorMapper;

//	@Test
//	public void testGetList() {
//		log.info("----------------------------------------------");
//		actorMapper.getList().forEach(b -> log.info(b));
//		log.info("----------------------------------------------");
//
//	}
//
//	@Test
//	public void testRead() {
//		log.info("----------------------------------------------");
//		actorMapper.read(1L);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testInsert() {
//		log.info("----------------------------------------------");
//		ActorVO actorVO = ActorVO.builder().act_name("kkk11").mov_num(3L).build();
//		actorMapper.insert(actorVO);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testDelete() {
//		log.info("----------------------------------------------");
//		actorMapper.delete(6L);
//		log.info("----------------------------------------------");
//	}
	
//	@Test
//	public void testTotal() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?Öå?ä§?ä∏");
//		log.info(".........................Total:" + boardMapper.getTotalCount(cri));
//	}
//	
//	@Test
//	public void testGetListWithPaging() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?Öå?ä§?ä∏");
//		boardMapper.getListWithPaging(cri);
//	}
//	@Test
//	public void testUpdate() {
//		BoardVO vo = BoardVO.builder().bno(3L).title("?Çú?Çò?Çú").content("Î¨¥ÎÇò?Çú").writer("Î£®Îùº?ûÑ").build();
//		int result = boardMapper.update(vo);
//		log.info("===========================================================");
//		log.info("count.............." + result);
//		log.info("===========================================================");
//	}

}
