package org.zerock.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.security.domain.CustomUser;

import lombok.Setter;

public class CustomUserDetailsService implements UserDetailsService { 

	@Setter(onMethod_ = @Autowired)
	private MemberMapper memberMapper;

	// 아이디 체크
	@Override
	public UserDetails loadUserByUsername(String mem_id) throws UsernameNotFoundException {
		MemberVO vo = memberMapper.findById(mem_id);
		return vo == null ? null : new CustomUser(vo);         
	
	}
	

	
	
}
