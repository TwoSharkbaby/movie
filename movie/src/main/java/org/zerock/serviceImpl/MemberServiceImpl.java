package org.zerock.serviceImpl;

import java.util.List;

import org.springframework.stereotype.Service;
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
	
	@Override
	public List<MemberVO> getList() {
		return memberMapper.getList();
	}

	@Override
	public MemberVO read(Long mem_num) {
		return memberMapper.read(mem_num);
	}

	@Override
	public void insert(MemberVO memberVO) {
		memberMapper.insert(memberVO);
	}

	@Override
	public int delete(Long mem_num) {
		return memberMapper.delete(mem_num);
	}
	
}
