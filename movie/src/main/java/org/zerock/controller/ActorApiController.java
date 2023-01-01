package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ActorVO;
import org.zerock.service.ActorService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/actor/*")
@RequiredArgsConstructor
public class ActorApiController {

	private final ActorService actorService;
	
	@GetMapping(value = "/{act_num}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<ActorVO> read(@PathVariable("act_num") Long act_num) {
		return new ResponseEntity<>(actorService.read(act_num), HttpStatus.OK);
	}
	
	
//	@GetMapping("/list")
//	public void list(Criteria cri, Model model) {
//		log.info("list......" + cri);
//		model.addAttribute("list", service.getList(cri));
//		model.addAttribute("pageMaker", 
//		new PageDTO(cri, service.getTotal(cri)));
//	}


//	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("act_num") Long act_num, @ModelAttribute("cri") Criteria cri, Model model) {
//		log.info(act_num);
//		model.addAttribute("actor", service.get(act_num));
//	}
//	
//	@PostMapping("/modify")
//	public String modify(ActorVO vo, @ModelAttribute("cri") Criteria cri, RedirectAttributes rtts) {
//		log.info("modify...............................");
//		if(service.modify(vo)) {
//			rtts.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/actor/list" + cri.getListLink();	}
//
//	@PostMapping("/register")
//	public String register(ActorVO vo, RedirectAttributes rtts) {
//		log.info("register : " + vo);
//		rtts.addFlashAttribute("result", vo.getAct_num());
//		return "redirect:/actor/list";
//	}
//	
//	@GetMapping("/register")
//	public void register() {
//		
//	}
//	
//	@PostMapping("remove")
//	public String remove(@RequestParam("act_num") Long act_num, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
//		
//		log.info("remove....................");
//		if(service.remove(act_num)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		return "redirect:/actor/list";
//	}
	
	
}
