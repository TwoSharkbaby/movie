package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MovieReviewCommentVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieReviewCommentServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewCommentService movieReviewCommentService;

	@Test
	public void testGetList() {
		log.info("----------------------------------------------");
		movieReviewCommentService.getList().forEach(b -> log.info(b));
		log.info("----------------------------------------------");

	}

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		movieReviewCommentService.read(1L);
		log.info("----------------------------------------------");
	}

	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		MovieReviewCommentVO movieReviewCommentVO = 
				MovieReviewCommentVO.builder().mov_rev_com_content("§∂§∑§∏").mem_num(3L).mov_rev_num(1L).build();
		movieReviewCommentService.insert(movieReviewCommentVO);
		log.info("----------------------------------------------");
	}

	@Test
	public void testDelete() {
		log.info("----------------------------------------------");
		movieReviewCommentService.delete(5L);
		log.info("----------------------------------------------");
	}
	
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
