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

@Controller
@RequestMapping("/actor/*")
@RequiredArgsConstructor
public class ActorController {
	
	private final ActorService actorService;
	
	// 배우 등록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/insert/{mov_num}")
	public String insert(@PathVariable Long mov_num, Model model) {
		model.addAttribute("mov_num", mov_num);
		return "actor/insert";
	}

	// 배우 수정
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modify/{act_num}")
	public String modify(@PathVariable Long act_num, Model model) {
		model.addAttribute("actor", actorService.read(act_num));
		return "actor/modify";
	}

	// 배우 등록
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

	// 배우 수정
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

	// 배우 삭제
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
	
	// 영화 상세보기의 출연배우
	@GetMapping(value = "/{act_num}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	@ResponseBody
	public ResponseEntity<ActorVO> read(@PathVariable("act_num") Long act_num) {
		return new ResponseEntity<>(actorService.read(act_num), HttpStatus.OK);
	}
	
	// 배우 수정창의 현제 사진불러오기
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<AttachFileDTO> getAttachList(Long act_num) {
		return new ResponseEntity<>(actorService.readAttachFileDTO(act_num), HttpStatus.OK);
	}

	// 서버 배우사진 삭제
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
