package org.zerock.service;

import java.util.List;

import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;

public interface MemberService {

		public List<MemberVO> getList(Criteria cri);
		
		public MemberVO get(Long mem_idn);
		
		public void register(MemberVO vo);
		
		public boolean remove(Long mem_idn);
		
		public boolean modify(MemberVO vo);
		
		public int getTotal(Criteria cri);
		
	
}
