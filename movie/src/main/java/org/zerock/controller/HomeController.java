package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.service.MovieService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class HomeController {
	
	private final MovieService movieService;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {
		model.addAttribute("latest", movieService.getLatestList());
		model.addAttribute("action", movieService.getActionList());
		model.addAttribute("fantasy", movieService.getFantasyList());
		model.addAttribute("horror", movieService.getHorrorList());
		model.addAttribute("romance", movieService.getRomanceList());
		model.addAttribute("comedy", movieService.getComedyList());
		return "home";
	}
	
	@GetMapping("/error_page")
	public String noMapping() {
		return "error_page";
	}
	
}
