package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MemberVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.MemberService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@RequiredArgsConstructor
public class MemberController {

	private final MemberService service;
	
//	@GetMapping("/list")
//	private void list(Criteria cri, Model model) {
//		
//		log.info("list" + cri);
//		
//		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, service.getTotal(cri)));
//	}
//	
//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("mem_idn")Long mem_idn, @ModelAttribute("cri") Criteria cri, Model model) {
//		log.info("modify...........");
//		model.addAttribute("member", service.get(mem_idn));
//	}
//	
//	@PostMapping("/modify")
//	public String modify(MemberVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
//		log.info("modify...........");
//		if(service.modify(vo)) {
//			rtts.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/member/list" + cri.getListLink();
//		}
//		
//	@PostMapping("/register")
//	public String register(MemberVO vo, RedirectAttributes rtts) {
//		log.info("register : " + vo);
//		service.register(vo);
//		rtts.addFlashAttribute("result", vo.getMem_num());
//		return "redirect:/member/list";
//		
//	}
//
//	@GetMapping("/register")
//	public void register() {
//		
//	}
	
	
	
	}
	
	

