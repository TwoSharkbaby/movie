package org.zerock.serviceImpl;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.zerock.domain.AuthVO;
import org.zerock.domain.MemberVO;
import org.zerock.mapper.MemberMapper;
import org.zerock.service.MemberService;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MemberServiceImpl implements MemberService {

	private final MemberMapper memberMapper;
	private final PasswordEncoder passwordEncoder;

	// �ɹ� ��� / ���̵� üũ �� ��й�ȣ ��ȣȭ ó�� �� ���� �ο�
	@Transactional
	@Override
	public int insert(MemberVO memberVO) {
		if (memberVO.getMem_id() != null && memberVO.getMem_id() != "") {
			if (memberVO.getMem_id().equals(memberMapper.checkId(memberVO.getMem_id()))) {
				return 0;
			} else {
				try {
					String pass = passwordEncoder.encode(memberVO.getMem_pw());
					memberVO.setMem_pw(pass);
					memberMapper.insert(memberVO);
					AuthVO auth = AuthVO.builder().mem_num(memberVO.getMem_num()).auth("ROLE_USER").build();
					memberMapper.insertAuth(auth);
					return 1;
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
		return 0;
	}

	// �ɹ� ����
	@Transactional
	@Override
	public int delete(String mem_num) {
		memberMapper.delete(mem_num);
		return memberMapper.deleteAuth(mem_num);
	}

	// �ɹ� ������ �����ҷ�����
	@Override
	public MemberVO memberInfo(Long mem_num) {
		return memberMapper.memberInfo(mem_num);
	}

	// �ɹ� ���� / ��й�ȣ ��ȣȭ
	@Override
	public int memberModify(MemberVO memberVO) {
		try {
			String pass = passwordEncoder.encode(memberVO.getMem_pw());
			memberVO.setMem_pw(pass);
			return memberMapper.memberModify(memberVO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
