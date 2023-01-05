package org.zerock.persistence;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper ;

//	@Test
//	public void testGetList() {
//		log.info("----------------------------------------------");
//		memberMapper.getList().forEach(b -> log.info(b));
//		log.info("----------------------------------------------");
//
//	}

	@Test
	public void testRead() {
		log.info("----------------------------------------------");
		log.info(memberMapper.findById("123"));
		log.info("----------------------------------------------");
	}
	
	@Test
	public void testCheckId() {
		log.info("----------------------------------------------");
		MemberVO memberVO = MemberVO.builder().mem_id("123").build();
		String vo = memberMapper.checkId(memberVO.getMem_id());
		if(memberVO.getMem_id().equals(vo)) {
			log.info("같은 아이디가 존재함");
		} else {
			log.info("같은 아이디가 존재하지 않음");
		}
		log.info(memberVO.getMem_id());
		log.info(vo);
		log.info("----------------------------------------------");
	}

//	@Test
//	public void testInsert() {
//		log.info("----------------------------------------------");
//		MemberVO memberVO = MemberVO.builder().mem_id("123").mem_pw("123").mem_name("kim").mem_nickname("kk").build();
//		memberMapper.insert(memberVO);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testDelete() {
//		log.info("----------------------------------------------");
//		memberMapper.delete(4L);
//		log.info("----------------------------------------------");
//	}
	
//	@Test
//	public void testTotal() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?뀒?뒪?듃");
//		log.info(".........................Total:" + boardMapper.getTotalCount(cri));
//	}
//	
//	@Test
//	public void testGetListWithPaging() {
//		Criteria cri = new Criteria();
//		cri.setType("TC");
//		cri.setKeyword("?뀒?뒪?듃");
//		boardMapper.getListWithPaging(cri);
//	}
//	@Test
//	public void testUpdate() {
//		BoardVO vo = BoardVO.builder().bno(3L).title("?궃?굹?궃").content("臾대굹?궃").writer("猷⑤씪?엫").build();
//		int result = boardMapper.update(vo);
//		log.info("===========================================================");
//		log.info("count.............." + result);
//		log.info("===========================================================");
//	}

}
