package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.MovieReviewVO;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@RequestMapping("/review/*")
@RequiredArgsConstructor
@Log4j
public class MovieReviewController {

	private final MovieReviewService movieReviewService;

	@GetMapping("/insert/{mov_num}")
	public String insert(@PathVariable Long mov_num, Model model) {
		model.addAttribute("mov_num", mov_num);
		return "review/insert";
	}

	@GetMapping("/modify/{mov_num}/{mov_rev_num}")
	public String modify(@PathVariable Long mov_num, @PathVariable Long mov_rev_num, Model model) {
		model.addAttribute("review", movieReviewService.read(mov_rev_num));
		return "review/modify";
	}

	@PostMapping("/insert") // 리뷰 등록한사람 중복 체크해야됨
	public String insert(MovieReviewVO vo, RedirectAttributes rtts) {
		if (movieReviewService.insert(vo) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/read/" + vo.getMov_num();
	}

	@PostMapping("/modify")
	public String modify(MovieReviewVO vo, RedirectAttributes rtts) {
		if (movieReviewService.modify(vo) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/read/" + vo.getMov_num();
	}

	@PostMapping("/delete")
	public String delete(Long mov_rev_num, Long mov_num, RedirectAttributes rtts) {
		if (movieReviewService.delete(mov_rev_num) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/read/" + mov_num;
	}


}
