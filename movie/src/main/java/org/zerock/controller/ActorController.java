package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ActorVO;
import org.zerock.service.ActorService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/actor/*")
@RequiredArgsConstructor
public class ActorController {

	private final ActorService actorService;
	
	@GetMapping("/insert/{mov_num}")
	public String insert(@PathVariable Long mov_num, Model model) {
		model.addAttribute("mov_num", mov_num);
		return "actor/insert";
	}

	@GetMapping("/modify/{act_num}")
	public String modify(@PathVariable Long act_num, Model model) {
		model.addAttribute("actor", actorService.read(act_num));
		return "actor/modify";
	}

	@PostMapping("/insert") 
	public String insert(ActorVO vo, RedirectAttributes rtts) {
		if (actorService.insert(vo) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/read/" + vo.getMov_num();
	}

	@PostMapping("/modify")
	public String modify(ActorVO vo, RedirectAttributes rtts) {
		if (actorService.modify(vo) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/read/" + vo.getMov_num();
	}

	@PostMapping("/delete")
	public String delete(Long act_num, Long mov_num, RedirectAttributes rtts) {
		if (actorService.delete(act_num) == 1) {
			rtts.addFlashAttribute("result", "success");
		} else {
			rtts.addFlashAttribute("result", "failure");
		}
		return "redirect:/movie/read/" + mov_num;
	}
	
	
}
