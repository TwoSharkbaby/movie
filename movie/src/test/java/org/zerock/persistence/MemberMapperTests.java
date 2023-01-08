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
	
	@Test
	public void testCheckId2() {
		log.info("----------------------------------------------");
		String vo = memberMapper.checkId("1234");
		log.info(vo == null);
		log.info("----------------------------------------------");
	}

}
