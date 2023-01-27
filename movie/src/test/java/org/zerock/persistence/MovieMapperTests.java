package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieVO;
import org.zerock.mapper.MovieMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MovieMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MovieMapper movieMapper ;
	
	@Test
	public void testGenreList() {
		log.info("----------------------------------------------");
		movieMapper.getActionList().forEach(b -> log.info(b));
		movieMapper.getFantasyList().forEach(b -> log.info(b));
		movieMapper.getHorrorList().forEach(b -> log.info(b));
		movieMapper.getRomanceList().forEach(b -> log.info(b));
		movieMapper.getComedyList().forEach(b -> log.info(b));
		movieMapper.getLatestList().forEach(b -> log.info(b));
		log.info("----------------------------------------------");
	}

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		movieMapper.read(1L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testGetTotalCount() {
		Criteria cri = new Criteria();
		cri.setType("TGD");
		cri.setKeyword("1");
		log.info(".........................Total:" + movieMapper.getTotalCount(cri));
	}
	
	@Test
	public void testGetListWithPaging() {
		Criteria cri = new Criteria();
		cri.setType("TGD");
		cri.setKeyword("1");
		log.info(".........................testGetListWithPaging:" + movieMapper.getListWithPaging(cri));
	}
	
	@Test
	public void testGetActorListWithPaging() {
		Criteria cri = new Criteria();
		cri.setKeyword("길동이");
		log.info(".........................getActorListWithPaging:" + movieMapper.getActorListWithPaging(cri));
	}

	@Test
	public void testInsert() {
		log.info("----------------------------------------------");
		MovieVO movieVO = MovieVO.builder().mov_title("고라").mov_director("kim").build();
		movieMapper.insert(movieVO);
		log.info("----------------------------------------------");
	}

	@Test
	public void testDelete() {
		log.info("----------------------------------------------");
		movieMapper.delete(145L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testUpdate() {
		log.info("===========================================================");
		MovieVO vo = MovieVO.builder().mov_num(145L).mov_title("고라").mov_director("kim").build();
		movieMapper.update(vo);
		log.info("===========================================================");
	}
	
	@Test
	public void testReadAttachFileDTO() {
		log.info("----------------------------------------------");
		movieMapper.readAttachFileDTO(16L);
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testReadImgThumb() {
		log.info("----------------------------------------------");
		log.info(movieMapper.readImgThumb(2L));
		log.info("----------------------------------------------");
	}

}
