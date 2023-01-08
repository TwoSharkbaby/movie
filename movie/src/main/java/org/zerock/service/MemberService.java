package org.zerock.service;

import org.zerock.domain.MemberVO;

public interface MemberService {

	// �ɹ� ���
	public int insert(MemberVO memberVO);

	// �ɹ� ����
	public int delete(String mem_num);
	
	// �ɹ� ������ �����ҷ�����
	public MemberVO memberInfo(Long mem_num);
	
	// �ɹ� ����
	public int memberModify(MemberVO memberVO);
	
	// �ɹ� ���̵� �ߺ� üũ
	public boolean idCheck(String mem_id);
	
	// ȸ������ �г��� üũ
	public boolean nicknameCheck(String mem_nickname);

}
