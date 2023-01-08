package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

	// 맴버 등록
	public int insert(MemberVO memberVO);

	// 맴버 삭제
	public int delete(String mem_num);
	
	// 맴버 수정시 정보불러오기
	public MemberVO memberInfo(Long mem_num);
	
	// 맴버 수정
	public int memberModify(MemberVO memberVO);
	
	// 맴버 아이디 중복 체크
	public boolean idCheck(String mem_id);
	
	// 회원가입 닉네임 체크
	public boolean nicknameCheck(String mem_nickname);

}
