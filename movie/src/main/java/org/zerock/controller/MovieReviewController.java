package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewChoiceVO;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController // REST + Controller
@RequestMapping("/review/*")
@RequiredArgsConstructor
@Log4j
public class MovieReviewController {

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
