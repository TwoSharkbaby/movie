package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.zerock.service.ActorService;
import org.zerock.service.MovieReviewService;
import org.zerock.service.MovieService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/movie/*")
@RequiredArgsConstructor
public class MovieController {

	private final MovieService movieService;
	private final MovieReviewService movieReviewService;
	private final ActorService actorService;
	
	@GetMapping("/list")
	public void list(Model model) {
		model.addAttribute("list", movieService.getList());
	}
	
	@GetMapping("/read/{mov_num}")
	public String read(@PathVariable Long mov_num, Model model) {
		model.addAttribute("movie", movieService.read(mov_num));
		model.addAttribute("review", movieReviewService.movieReviewRead(mov_num));
		model.addAttribute("actor", actorService.movieActorList(mov_num));
		return "movie/read";
	}
	
//	@GetMapping("/modify")
//	public void modify(@RequestParam("mov_num") Long mov_num, Model model) {
//		model.addAttribute("movie", service.read(mov_num));
//	}
//	@PostMapping("/modify")
//	public String modify(MovieVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
//		log.info("modify...........");
//		if(service.modify(vo)) {
//			rtts.addFlashAttribute("result", "success");
//		}
//	
//		return "redirect:/movie/list" + cri.getListLink();
//	}
//	
//	@PostMapping("/remove")
//	public String remove(@RequestParam("mov_num") Long mov_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		
//		
//		log.info("remove............................");
//		
//		if(service.remove(mov_num)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/movie/list";
//		
//	}
//
//	
//	@PostMapping("/register")
//	public String register(MovieVO vo, RedirectAttributes rtts) {
//		
//		log.info("register : " + vo);
//		
//		service.register(vo);
//		rtts.addFlashAttribute("result", vo.getMov_num());
//		return "redirect:/movie/list";	
//	}
//	
//	
//
//	@GetMapping("/register")
//	public void register() {
//
//	}
	
	
	
	
	
	
	
}
