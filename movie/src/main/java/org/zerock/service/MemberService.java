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

}
