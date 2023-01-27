package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MovieVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieService movieService;

//	@Test
//	public void testGetList() {
//		log.info("----------------------------------------------");
//		movieService.getList().forEach(b -> log.info(b));
//		log.info("----------------------------------------------");
//	}
	
//	@Test
//	public void testGenreList() {
//		log.info("----------------------------------------------");
//		movieService.getActionList().forEach(b -> log.info(b));
//		log.info("----------------------------------------------");
//	}

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		movieService.read(1L);
		log.info("----------------------------------------------");
	}

//	@Test
//	public void testInsert() {
//		log.info("----------------------------------------------");
//		MovieVO movieVO = MovieVO.builder().mov_title("���").mov_director("kim").build();
//		movieService.insert(movieVO);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testDelete() {
//		log.info("----------------------------------------------");
//		movieService.delete(5L);
//		log.info("----------------------------------------------");
//	}
	
//	@Test
//	public void testTotal() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?��?��?��");
//		log.info(".........................Total:" + boardMapper.getTotalCount(cri));
//	}
//	
//	@Test
//	public void testGetListWithPaging() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?��?��?��");
//		boardMapper.getListWithPaging(cri);
//	}
//	@Test
//	public void testUpdate() {
//		BoardVO vo = BoardVO.builder().bno(3L).title("?��?��?��").content("무나?��").writer("루라?��").build();
//		int result = boardMapper.update(vo);
//		log.info("===========================================================");
//		log.info("count.............." + result);
//		log.info("===========================================================");
//	}

}
