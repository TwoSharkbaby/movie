package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ActorVO;
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.ImgVO;
import org.zerock.service.ActorService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/actor/*")
@RequiredArgsConstructor
public class ActorController {

	private final ActorService actorService;
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/insert/{mov_num}")
	public String insert(@PathVariable Long mov_num, Model model) {
		model.addAttribute("mov_num", mov_num);
		return "actor/insert";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modify/{act_num}")
	public String modify(@PathVariable Long act_num, Model model) {
		model.addAttribute("actor", actorService.read(act_num));
		return "actor/modify";
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/insert") 
	public String insert(ActorVO vo, RedirectAttributes rtts) {
		if (actorService.insert(vo) == 1) {
			rtts.addFlashAttribute("result", "배우 등록 성공");
		} else {
			rtts.addFlashAttribute("result", "배우 등록 실패");
		}
		return "redirect:/movie/read/" + vo.getMov_num();
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modify(ActorVO vo, RedirectAttributes rtts) {
		if (actorService.modify(vo) == 1) {
			rtts.addFlashAttribute("result", "배우 수정 성공");
		} else {
			rtts.addFlashAttribute("result", "배우 수정 실패");
		}
		return "redirect:/movie/read/" + vo.getMov_num();
	}

	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/delete")
	public String delete(Long act_num, Long mov_num, RedirectAttributes rtts) {
		ImgVO vo = actorService.readImgThumb(act_num);
		if (actorService.delete(act_num) == 1) {
			deleteFile(vo);
			rtts.addFlashAttribute("result", "배우 삭제 성공");
		} else {
			rtts.addFlashAttribute("result", "배우 삭제 실패");
		}
		return "redirect:/movie/read/" + mov_num;
	}
	
	@GetMapping(value = "/{act_num}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public ResponseEntity<ActorVO> read(@PathVariable("act_num") Long act_num) {
		return new ResponseEntity<>(actorService.read(act_num), HttpStatus.OK);
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<AttachFileDTO> getAttachList(Long act_num) {
		return new ResponseEntity<>(actorService.readAttachFileDTO(act_num), HttpStatus.OK);
	}

	private void deleteFile(ImgVO vo) {
		try {
			Path img = Paths.get(vo.getImg());
			Files.deleteIfExists(img);
			Path thumb = Paths.get(vo.getThumb());
			Files.deleteIfExists(thumb);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
}
