package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

//	public List<MemberVO> getList();

	public MemberVO read(String mem_id);

	public int insert(MemberVO memberVO);
	
	public int update(MemberVO memberVO);

	public int delete(String mem_num);
	
	public int insertAuth(AuthVO auth);
	
	public MemberVO findById(String mem_id);
	
	public String checkId(String mem_id);
	
	public int deleteAuth(String mem_num);

}
