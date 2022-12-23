package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.BoardVO;
import org.zerock.domain.Criteria;
import org.zerock.mapper.BoardMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j

public class BoardMapperTests {
	@Setter(onMethod_ = @Autowired)
	private BoardMapper boardMapper;

	@Test
	public void testTotal() {
		Criteria cri = new Criteria();
		cri.setType("TC");
		cri.setKeyword("테스트");
		log.info(".........................Total:" + boardMapper.getTotalCount(cri));
	}
	
	@Test
	public void testGetListWithPaging() {
		Criteria cri = new Criteria();
		cri.setType("TC");
		cri.setKeyword("테스트");
		boardMapper.getListWithPaging(cri);
	}
	
	@Test
	public void testGetList() {
		log.info("----------------------------------------------");
		boardMapper.getList().forEach(b -> log.info(b));
		log.info("----------------------------------------------");

	}

	@Test
	public void testRead() {
		log.info(boardMapper.read(113L));
	}

	@Test
	public void testInsert() {

		log.info("----------------------------------------------");
//		BoardVO board = new BoardVO();
//		board.setTitle("ASDF");
//		board.setContent("QWER");
//		board.setWriter("ZXCV");
		BoardVO board = BoardVO.builder().title("ASDF").content("QWER").writer("ZXCV").build();
//		boardMapper.insert(board);
		boardMapper.insertSelectKey(board);
		log.info("----------------------------------------------");

	}

	@Test
	public void testDelete() {
		boardMapper.delete(2L);
	}

	@Test
	public void testUpdate() {
		BoardVO vo = BoardVO.builder().bno(3L).title("난나난").content("무나난").writer("루라랄").build();
		int result = boardMapper.update(vo);
		log.info("===========================================================");
		log.info("count.............." + result);
		log.info("===========================================================");
	}

}
