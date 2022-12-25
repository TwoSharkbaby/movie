package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewChoiceVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.MovieReviewChoiceService;

import lombok.AllArgsConstructor;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@Controller
@Log
@RequestMapping("/movie-review-choice/*")
@AllArgsConstructor
public class MovieReviewChoiceController {

	private MovieReviewChoiceService service;
	
//	@GetMapping("/list")
//	public void list(Criteria cri, Model model) {
//		log.info("list........." + cri);
//		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", 
//				new PageDTO(cri,service.getTotal(cri)));
//	}
//	
//	
//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("mov_rev_cho_num") Long mov_rev_cho_num, @ModelAttribute("cri") Criteria cri, Model model) {
//		log.info("modify...........................");
//		model.addAttribute("mov_rev_choice", service.get(mov_rev_cho_num));
//	}
//	
//	
//	@PostMapping("/modify")
//	public String modify(MovieReviewChoiceVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
//		log.info("modify...........................");
//		if(service.modify(vo)) {
//			rtts.addFlashAttribute("result", "success");
//		}
//		return "redirect:/movie-review-choice/list" + cri.getListLink();
//	}
//	
//	@PostMapping("/remove")
//	public String remove(@RequestParam("mov_rev_cho_num") Long mov_rev_cho_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		
//		log.info("remove..........................");
//		
//		
//		if(service.remove(mov_rev_cho_num)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/movie-review-choice/list";
//	}
//	
//	
//	@PostMapping("/register")
//	public String register(MovieReviewChoiceVO vo, RedirectAttributes rtts) {
//		log.info("register : " + vo);
//		
//		service.register(vo);
//		rtts.addFlashAttribute("result", vo.getMov_rev_cho_num());
//		return "redirect:/movie-review-choice/list";
//	}
//	
//	
//	@GetMapping("/register")
//	public void register() {
//		
//	}
	
	
	
	
	
	
}
