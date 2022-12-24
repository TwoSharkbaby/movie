package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.mapper.MovieReviewCommentChoiceMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieReviewCommentChoiceServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewCommentChoiceService movieReviewCommentChoiceService;

	@Test
	public void testGetList() {
		log.info("----------------------------------------------");
		movieReviewCommentChoiceService.getList().forEach(b -> log.info(b));
		log.info("----------------------------------------------");

	}

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		movieReviewCommentChoiceService.read(1L);
		log.info("----------------------------------------------");
	}

	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		MovieReviewCommentChoiceVO movieReviewCommentChoiceVO = 
				MovieReviewCommentChoiceVO.builder().mov_rev_com_num(1L).mem_num(3L).build();
		movieReviewCommentChoiceService.insert(movieReviewCommentChoiceVO);
		log.info("----------------------------------------------");
	}

	@Test
	public void testDelete() {
		log.info("----------------------------------------------");
		movieReviewCommentChoiceService.delete(5L);
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
