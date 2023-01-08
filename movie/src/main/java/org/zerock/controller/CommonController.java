package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequiredArgsConstructor
public class CommonController {

	private final MemberService memberService;

	// Ŀ������ �α���
	@PreAuthorize("isAnonymous()")
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("result", "���̵� �Ǵ� ��й�ȣ�� Ʋ�Ƚ��ϴ�");
		}
		if (logout != null) {
			model.addAttribute("result", "�α׾ƿ� �Ǽ̽��ϴ�");
		}
	}

	// �α׾ƿ�
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/customLogout")
	public void logoutGET() {
	}

	// ���ٱ���
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		model.addAttribute("msg", "Access Denied");
	}

	// ȸ������
	@PreAuthorize("isAnonymous()")
	@GetMapping("/customSingup")
	public void singup() {
	}

	// ȸ������
	@PreAuthorize("isAnonymous()")
	@PostMapping("/customSingup")
	public String singup(MemberVO vo, RedirectAttributes rtts) {
		if (memberService.insert(vo) == 1) {
			rtts.addFlashAttribute("result", "ȸ������ ����");
			return "redirect:/customLogin";
		} else {
			rtts.addFlashAttribute("result", "ȸ������ ����");
			return "redirect:/customLogin";
		}
	}

	// ȸ�� ����
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/customModify/{mem_num}")
	public String customModify(@PathVariable Long mem_num, Model model) {
		model.addAttribute("member", memberService.memberInfo(mem_num));
		return "customModify";
	}

	// ȸ�� ����
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/customModify")
	public String customModify(MemberVO memberVO, Model model, RedirectAttributes rtts) {
		if(memberService.memberModify(memberVO) == 1) {
			model.addAttribute("result","ȸ������ ����");
			return "customLogout";
		} else {
			rtts.addFlashAttribute("result", "ȸ������ ����");
			return "redirect:/customModify/" + memberVO.getMem_num();
		}
	}
	
	// ���̵� üũ
	@PreAuthorize("isAnonymous()")
	@GetMapping("/idCheck/{mem_id}")
	@ResponseBody
	public ResponseEntity<Boolean> idCheck(@PathVariable String mem_id) {
		return new ResponseEntity<>(memberService.idCheck(mem_id), HttpStatus.OK);
	}
	
	// �г��� üũ
	@PreAuthorize("isAnonymous()")
	@GetMapping("/nicknameCheck/{mem_nickname}")
	@ResponseBody
	public ResponseEntity<Boolean> nicknameCheck(@PathVariable String mem_nickname) {
		return new ResponseEntity<>(memberService.nicknameCheck(mem_nickname), HttpStatus.OK);
	}

}
