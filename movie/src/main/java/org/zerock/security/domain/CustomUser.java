package org.zerock.security.domain;

import java.util.Collection;
import java.util.stream.Collectors;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.zerock.domain.MemberVO;
import org.zerock.security.CustomUserDetailsService;

import lombok.Getter;
import lombok.extern.log4j.Log4j;

@Log4j
@Getter
public class CustomUser extends User { // id pw ºñ±³
	
	private MemberVO member;
	
	public CustomUser(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}
	
	public CustomUser(MemberVO vo) {
		super(
			vo.getMem_id(), 
			vo.getMem_pw(),
			vo.getAuthList()
			.stream()
			.map(auth -> new SimpleGrantedAuthority(auth.getAuth()))
			.collect(Collectors.toList())
		);
		log.info("CustomUser" + vo);
		this.member = vo;
	}
	
	
}




