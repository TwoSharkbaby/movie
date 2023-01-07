package org.zerock.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberServiceTests {
	
	@Setter(onMethod_ = @Autowired)
	private MemberService memberService;

	@Test
	public void testMemberInfo() {
		log.info("----------------------------------------------");
		log.info(memberService.memberInfo(2L));
		log.info("----------------------------------------------");
	}

}
