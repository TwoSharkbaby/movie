package org.zerock.persistence;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentVO;
import org.zerock.mapper.MovieReviewCommentMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class MovieReviewCommentMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieReviewCommentMapper movieReviewCommentMapper;
	
	private Long[] mov_rev_numArr = { 1L, 2L, 3L, 4L, 5L, 6L };
	
	@Test
	public void testList() {
		Criteria cri = new Criteria();
		
		List<MovieReviewCommentVO> comments = movieReviewCommentMapper.getListWithPaging(cri, mov_rev_numArr[0]);
		
		comments.forEach(comment -> log.info(comment));
	}
	
	@Test
	public void testCheckChoice() {
		log.info("----------------------------------------------");
		log.info(movieReviewCommentMapper.checkChoice(1L));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testFindByReviewComment() {
		log.info("----------------------------------------------");
		movieReviewCommentMapper.findByReviewComment(3L);
		log.info("----------------------------------------------");
	}

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		movieReviewCommentMapper.read(1L);
		log.info("----------------------------------------------");
	}
//
	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		MovieReviewCommentVO movieReviewCommentVO = 
				MovieReviewCommentVO.builder().mov_rev_com_content("우왕굳4").mem_num(1L).mov_rev_num(6L).build();
		movieReviewCommentMapper.insert(movieReviewCommentVO);
		log.info("----------------------------------------------");
	}

//
	@Test
	public void testDelete() {
		log.info("----------------------------------------------");
		movieReviewCommentMapper.delete(32L);
		log.info("----------------------------------------------");
	}
//	
	
	@Test
	public void testUpdate() {
		Long targetMov_rev_com_num = 31L;
		
		MovieReviewCommentVO vo = movieReviewCommentMapper.read(targetMov_rev_com_num);
		vo.setMov_rev_com_content("업데이트2");
		int count = movieReviewCommentMapper.update(vo);
		
		log.info("update count" + count);
		
	}
	
	
//	@Test
//	public void testTotal() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?��?��?��");
//		log.info(".........................Total:" + boardMapper.getTotalCount(cri));
//	}
//	
//	@Test
//	public void testUpdate() {
//		BoardVO vo = BoardVO.builder().bno(3L).title("?��?��?��").content("무나?��").writer("루라?��").build();
//		int result = boardMapper.update(vo);
//		log.info("===========================================================");
//		log.info("count.............." + result);
//		log.info("===========================================================");
//	}

}
