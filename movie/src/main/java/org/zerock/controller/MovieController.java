package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

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
import org.zerock.domain.AttachFileDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.ImgVO;
import org.zerock.domain.MovieVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.ActorService;
import org.zerock.service.MovieReviewService;
import org.zerock.service.MovieService;

import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/movie/*")
@RequiredArgsConstructor
public class MovieController {

	private final MovieService movieService;
	private final MovieReviewService movieReviewService;
	private final ActorService actorService;

	// 영화 상세보기
	@GetMapping("/read/{mov_num}")
	public String read(@PathVariable Long mov_num, Model model) {
		model.addAttribute("movie", movieService.read(mov_num));
		model.addAttribute("review", movieReviewService.movieReviewRead(mov_num));
		model.addAttribute("actor", actorService.movieActorList(mov_num));
		return "movie/read";
	}

	// 영화 검색
	@GetMapping("/search")
	public String search(Criteria cri, Model model) {
		model.addAttribute("list", movieService.getListWithPaging(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, movieService.getTotalCount(cri)));
		return "movie/search";
	}

	// 영화 등록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/insert")
	public void insert() {
	}

	// 영화 수정
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping("/modify/{mov_num}")
	public String modify(@PathVariable Long mov_num, Model model) {
		model.addAttribute("movie", movieService.read(mov_num));
		return "movie/modify";
	}

	// 영화 등록
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/insert")
	public String insert(MovieVO vo, RedirectAttributes rtts) {
		if (movieService.insert(vo) == 1) {
			rtts.addFlashAttribute("result", "영화 등록 성공");
		} else {
			rtts.addFlashAttribute("result", "영화 등록 실패");
		}
		return "redirect:/";
	}

	// 영화 수정
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/modify")
	public String modify(MovieVO vo, RedirectAttributes rtts) {
		if (movieService.modify(vo) == 1) {
			rtts.addFlashAttribute("result", "영화 수정 성공");
		} else {
			rtts.addFlashAttribute("result", "영화 수정 실패");
		}
		return "redirect:/movie/read/" + vo.getMov_num() ;
	}

	// 영화 삭제
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@PostMapping("/delete")
	public String delete(Long mov_num, RedirectAttributes rtts) {
		ImgVO vo = movieService.readImgThumb(mov_num);
		List<ImgVO> list = actorService.readActorImgs(mov_num);
		if (movieService.delete(mov_num) == 1) {
			list.forEach(actor -> {
				deleteFile(actor);
			});
			deleteFile(vo);
			rtts.addFlashAttribute("result", "영화 삭제 성공");
		} else {
			rtts.addFlashAttribute("result", "영화 삭제 실패");
		}
		return "redirect:/";
	}

	// 영화 수정창의 현제 사진불러오기
	@PreAuthorize("hasRole('ROLE_ADMIN')")
	@GetMapping(value = "/getAttachList", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<AttachFileDTO> getAttachList(Long mov_num) {
		return new ResponseEntity<>(movieService.readAttachFileDTO(mov_num), HttpStatus.OK);
	}

	// 서버 영화사진 삭제
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
