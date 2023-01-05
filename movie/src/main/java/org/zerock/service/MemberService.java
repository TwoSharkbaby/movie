package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

//	public List<MemberVO> getList();
	
	public MemberVO read(String mem_id);

	public int insert(MemberVO memberVO);
	
	public int update(MemberVO memberVO);

	public int delete(String mem_num);
	
	public MemberVO memberInfo(Long mem_num);
	
	public int memberModify(MemberVO memberVO);

}
