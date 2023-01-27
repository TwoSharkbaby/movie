package org.zerock.mapper;

import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;

public interface MemberMapper {

	public MemberVO read(String mem_id);

	// �ɹ� ����
	public int insert(MemberVO memberVO);

	// �ɹ� ����
	public int delete(String mem_num);
	
	// �ʹ� ���� ���
	public int insertAuth(AuthVO auth);
	
	// �α���
	public MemberVO findById(String mem_id);
	
	// ȸ������ ���̵� üũ
	public String checkId(String mem_id);
	
	// �ɹ������� ���ѻ���
	public int deleteAuth(String mem_num);
	
	// �ɹ� ������ �������� �ҷ�����
	public MemberVO memberInfo(Long mem_num);
	
	// �ɹ� ����
	public int memberModify(MemberVO memberVO);
	
	// ȸ������ �г��� üũ
	public String nicknameCheck(String mem_nickname);

}
