package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.service.MovieReviewCommentService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/comment/*")
@RequiredArgsConstructor
public class MovieReviewCommentController {

	private final MovieReviewCommentService movieReviewCommentService;

	// ¸®ºä ´ñ±Û ÁÁ¾Æ¿ä
	@PostMapping(value = "/good", consumes = "application/json")
	public ResponseEntity<ChoiceVO> goodUpdate(@RequestBody MovieReviewCommentChoiceVO movieReviewCommentChoiceVO) {
		ChoiceVO vo = movieReviewCommentService.goodUpdate(movieReviewCommentChoiceVO.getMov_rev_com_num(), movieReviewCommentChoiceVO.getMem_num());
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}

	// ¸®ºä ´ñ±Û ½È¾î¿ä
	@PostMapping(value = "/bad", consumes = "application/json")
	public ResponseEntity<ChoiceVO> badUpdate(@RequestBody MovieReviewCommentChoiceVO movieReviewCommentChoiceVO) {
		ChoiceVO vo = movieReviewCommentService.badUpdate(movieReviewCommentChoiceVO.getMov_rev_com_num(), movieReviewCommentChoiceVO.getMem_num());
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}

}
