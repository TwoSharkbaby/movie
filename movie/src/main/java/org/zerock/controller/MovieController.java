package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieVO;
import org.zerock.domain.PageDTO;
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
		model.addAttribute("latest", movieService.getLatestList());
		model.addAttribute("action", movieService.getActionList());
		model.addAttribute("fantasy", movieService.getFantasyList());
		model.addAttribute("horror", movieService.getHorrorList());
		model.addAttribute("romance", movieService.getRomanceList());
		model.addAttribute("comedy", movieService.getComedyList());
	}

	@GetMapping("/read/{mov_num}")
	public String read(@PathVariable Long mov_num, Model model) {
		model.addAttribute("movie", movieService.read(mov_num));
		model.addAttribute("review", movieReviewService.movieReviewRead(mov_num));
		model.addAttribute("actor", actorService.movieActorList(mov_num));
		return "movie/read";
	}

	@GetMapping("/search")
	public String search(Criteria cri, Model model) {
		model.addAttribute("list", movieService.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, movieService.getTotalCount(cri)));
		return "movie/search";
	}

	@GetMapping("/insert")
	public void insert() {
	}

	@GetMapping("/modify/{mov_num}")
	public String modify(@PathVariable Long mov_num, Model model) {
		model.addAttribute("movie", movieService.read(mov_num));
		return "movie/modify";
	}

	@PostMapping("/insert")
	public String insert(MovieVO vo, RedirectAttributes rtts) {
		if (movieService.insert(vo) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/list";
	}

	@PostMapping("/modify")
	public String modify(MovieVO vo, RedirectAttributes rtts) {
		if (movieService.modify(vo) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/list";
	}

	@PostMapping("/delete")
	public String delete(Long mov_num, RedirectAttributes rtts) {
		if (movieService.delete(mov_num) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/list";
	}
	
	

}
