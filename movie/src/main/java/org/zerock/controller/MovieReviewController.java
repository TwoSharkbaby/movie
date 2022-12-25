package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.MovieReviewVO;
import org.zerock.service.MovieService;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/review/*")
@RequiredArgsConstructor
public class MovieReviewController {

	private final MovieReviewService service;
	
//	@GetMapping("/list")
//	public void list(Criteria cri, Model model) {
//		log.info("list......" + cri);
//		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", 
//		new PageDTO(cri, service.getTotal(cri)));
//	}
//	
//	
//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("mov_rev_num") Long mov_rev_num, @ModelAttribute("cri") Criteria cri, Model model) {
//		log.info("modify..........");
//		model.addAttribute("movie", service.get(mov_rev_num));
//	}
//	
//	@PostMapping("/modify")
//	public String modify(MovieReviewVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
//		log.info("modify.............");
//		if(service.modify(vo)) {
//			rtts.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/review/list" + cri.getListLink();
//	}
//	
//	
//	@PostMapping("/remove")
//	public String remove(@RequestParam("mov_rev_num") Long mov_rev_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		
//		log.info("remove...................");
//		
//		if(service.remove(mov_rev_num)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		
//		return "redirect:/review/list";
//	}
//	
//	@PostMapping("/register")
//	public String register(MovieReviewVO vo, RedirectAttributes rtts) {
//		log.info("register : " + vo);
//		service.register(vo);
//		rtts.addFlashAttribute("result", vo.getMov_rev_num());
//		return "redirect:/review/list";
//	}
//	
//
//	@GetMapping("/register")
//	public void register() {
//		
//	}
	
}
