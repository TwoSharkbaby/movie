package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.security.domain.CustomUser;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
public class CustomUserDetailsService implements UserDetailsService { // principal �������

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	@Override
	public UserDetails loadUserByUsername(String mem_id) throws UsernameNotFoundException {
		log.warn("Load user By UserName : " + mem_id);

		MemberVO vo = memberMapper.findById(mem_id); // ���ϴ� ������ select �ؼ� �����ü��� ����
		log.info("CustomUserDetailsService" + vo);
		return vo == null ? null : new CustomUser(vo);         
		
	}
	

	
	
}
