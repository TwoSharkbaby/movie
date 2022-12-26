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
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieReviewServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewService movieReviewService;

//	@Test
//	public void testGetList() {
//		log.info("----------------------------------------------");
//		movieReviewService.getList().forEach(b -> log.info(b));
//		log.info("----------------------------------------------");
//
//	}
//
//	@Test
//	public void testRead() {
//		log.info("----------------------------------------------");
//		movieReviewService.read(1L);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testInsert() {
//		log.info("----------------------------------------------");
//		MovieReviewVO movieReviewVO = MovieReviewVO.builder().mov_rev_title("123").mov_num(1L).mem_num(1L).build();
//		movieReviewService.insert(movieReviewVO);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testDelete() {
//		log.info("----------------------------------------------");
//		movieReviewService.delete(5L);
//		log.info("----------------------------------------------");
//	}
	
	@Test
	public void testMovieReviewRead() {
		log.info("----------------------------------------------");
		movieReviewService.movieReviewRead(1L).forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testGoodUpdatel() {
		log.info("----------------------------------------------");
		movieReviewService.goodUpdate(1L, 1L);
		log.info("----------------------------------------------");
	}
	
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
