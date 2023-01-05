package org.zerock.serviceImpl;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@RequiredArgsConstructor
@Log4j
public class MemberServiceImpl implements MemberService {
	
	private final MemberMapper memberMapper;
	private final PasswordEncoder passwordEncoder;
	
//	@Override
//	public List<MemberVO> getList() {
//		return memberMapper.getList();
//	}

	@Transactional
	@Override
	public MemberVO read(String mem_id) {
		return memberMapper.read(mem_id);
	}

	@Transactional
	@Override
	public int insert(MemberVO memberVO) {
		if(memberVO.getMem_id() != null && memberVO.getMem_id() != "" && 
				memberVO.getMem_id() != memberMapper.checkId(memberVO.getMem_id())) {
			try {
				String pass = passwordEncoder.encode(memberVO.getMem_pw());
				memberVO.setMem_pw(pass);
				memberMapper.insert(memberVO);
				AuthVO auth = AuthVO.builder().mem_num(memberVO.getMem_num()).auth("ROLE_USER").build();
				memberMapper.insertAuth(auth);
				return 0;
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return 1;
	}
	
	@Transactional
	@Override
	public int update(MemberVO memberVO) {
		return memberMapper.update(memberVO);
	}

	@Transactional
	@Override  
	public int delete(String mem_num) {
		memberMapper.delete(mem_num);
		return memberMapper.deleteAuth(mem_num);
	}

}
