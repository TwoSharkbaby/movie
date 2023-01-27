package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String mem_id);

	// 맴버 가입
	public int insert(MemberVO memberVO);

	// 맴버 삭제
	public int delete(String mem_num);
	
	// 맵버 권한 등록
	public int insertAuth(AuthVO auth);
	
	// 로그인
	public MemberVO findById(String mem_id);
	
	// 회원가입 아이디 체크
	public String checkId(String mem_id);
	
	// 맴버삭제시 권한삭제
	public int deleteAuth(String mem_num);
	
	// 맴버 수정시 기존정보 불러오기
	public MemberVO memberInfo(Long mem_num);
	
	// 맴버 수정
	public int memberModify(MemberVO memberVO);
	
	// 회원가입 닉네임 체크
	public String nicknameCheck(String mem_nickname);

}
