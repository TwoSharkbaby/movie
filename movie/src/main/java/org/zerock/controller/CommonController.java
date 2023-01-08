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

	// 커스텀한 로그인
	@PreAuthorize("isAnonymous()")
	@GetMapping("/customLogin")
	public void loginInput(String error, String logout, Model model) {
		if (error != null) {
			model.addAttribute("result", "아이디 또는 비밀번호가 틀렸습니다");
		}
		if (logout != null) {
			model.addAttribute("result", "로그아웃 되셨습니다");
		}
	}

	// 로그아웃
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/customLogout")
	public void logoutGET() {
	}

	// 접근권한
	@GetMapping("/accessError")
	public void accessDenied(Authentication auth, Model model) {
		model.addAttribute("msg", "Access Denied");
	}

	// 회원가입
	@PreAuthorize("isAnonymous()")
	@GetMapping("/customSingup")
	public void singup() {
	}

	// 회원가입
	@PreAuthorize("isAnonymous()")
	@PostMapping("/customSingup")
	public String singup(MemberVO vo, RedirectAttributes rtts) {
		if (memberService.insert(vo) == 1) {
			rtts.addFlashAttribute("result", "회원가입 성공");
			return "redirect:/customLogin";
		} else {
			rtts.addFlashAttribute("result", "회원가입 실패");
			return "redirect:/customLogin";
		}
	}

	// 회원 수정
	@PreAuthorize("isAuthenticated()")
	@GetMapping("/customModify/{mem_num}")
	public String customModify(@PathVariable Long mem_num, Model model) {
		model.addAttribute("member", memberService.memberInfo(mem_num));
		return "customModify";
	}

	// 회원 수정
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/customModify")
	public String customModify(MemberVO memberVO, Model model, RedirectAttributes rtts) {
		if(memberService.memberModify(memberVO) == 1) {
			model.addAttribute("result","회원수정 성공");
			return "customLogout";
		} else {
			rtts.addFlashAttribute("result", "회원수정 실패");
			return "redirect:/customModify/" + memberVO.getMem_num();
		}
	}
	
	// 아이디 체크
	@PreAuthorize("isAnonymous()")
	@GetMapping("/idCheck/{mem_id}")
	@ResponseBody
	public ResponseEntity<Boolean> idCheck(@PathVariable String mem_id) {
		return new ResponseEntity<>(memberService.idCheck(mem_id), HttpStatus.OK);
	}
	
	// 닉네임 체크
	@PreAuthorize("isAnonymous()")
	@GetMapping("/nicknameCheck/{mem_nickname}")
	@ResponseBody
	public ResponseEntity<Boolean> nicknameCheck(@PathVariable String mem_nickname) {
		return new ResponseEntity<>(memberService.nicknameCheck(mem_nickname), HttpStatus.OK);
	}

}
