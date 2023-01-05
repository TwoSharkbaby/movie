package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.zerock.domain.MemberVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;

//	@Test
//	public void testGetList() {
//		log.info("----------------------------------------------");
//		memberService.getList().forEach(b -> log.info(b));
//		log.info("----------------------------------------------");
//	}
//
	@Test
	public void testMemberInfo() {
		log.info("----------------------------------------------");
		log.info(memberService.memberInfo(2L));
		log.info("----------------------------------------------");
	}
//
//	@Test
//	public void testInsert() {
//		log.info("----------------------------------------------");
//		MemberVO memberVO = MemberVO.builder().mem_id("123").mem_pw("123").mem_name("kim").mem_nickname("kk").build();
//		memberService.insert(memberVO);
//		log.info("----------------------------------------------");
//	}
//
//	@Test
//	public void testDelete() {
//		log.info("----------------------------------------------");
//		memberService.delete(4L);
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
