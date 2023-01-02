package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewChoiceVO;
import org.zerock.domain.MovieReviewVO;
import org.zerock.domain.MovieVO;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController // REST + Controller
@RequestMapping("/review/*")
@RequiredArgsConstructor
@Log4j
public class MovieReviewApiController {

	private final MovieReviewService movieReviewService;
	
	@PostMapping(value = "/good", consumes = "application/json")
	public ResponseEntity<ChoiceVO> goodUpdate(@RequestBody MovieReviewChoiceVO movieReviewChoiceVO) {
		ChoiceVO vo = movieReviewService.goodUpdate(movieReviewChoiceVO.getMov_rev_num(),movieReviewChoiceVO.getMem_num());
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@PostMapping(value = "/bad", consumes = "application/json")
	public ResponseEntity<ChoiceVO> badUpdate(@RequestBody MovieReviewChoiceVO movieReviewChoiceVO) {
		ChoiceVO vo = movieReviewService.badUpdate(movieReviewChoiceVO.getMov_rev_num(),movieReviewChoiceVO.getMem_num());
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}

}
