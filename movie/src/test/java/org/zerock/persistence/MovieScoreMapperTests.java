package org.zerock.persistence;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.ActorVO;
import org.zerock.domain.MovieScoreVO;
import org.zerock.mapper.MovieScoreMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieScoreMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieScoreMapper movieScoreMapper;

	@Test
	public void testGetList() {
		log.info("----------------------------------------------");
		movieScoreMapper.getList().forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		movieScoreMapper.read(1L);
		log.info("----------------------------------------------");
	}

	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		MovieScoreVO movieScoreVO = MovieScoreVO.builder().mov_sco_point(5).mov_num(2L).mov_rev_num(1L).build();
		movieScoreMapper.insert(movieScoreVO);
		log.info("----------------------------------------------");
	}

	@Test
	public void testDelete() {
		log.info("----------------------------------------------");
		movieScoreMapper.delete(4L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testScore() {
		log.info("----------------------------------------------");
		movieScoreMapper.score(1L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testReviewRead() {
		log.info("----------------------------------------------");
		movieScoreMapper.reviewRead(1L);
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
