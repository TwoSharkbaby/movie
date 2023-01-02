package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.domain.MovieReviewCommentVO;
import org.zerock.service.MovieReviewCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/comment/*")
@RequiredArgsConstructor
public class MovieReviewCommentController {

	private final MovieReviewCommentService movieReviewCommentService;

	@GetMapping(value = "/{mov_rev_num}",
			produces = {MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE})
	public ResponseEntity<List<MovieReviewCommentVO>> getList(@PathVariable("mov_rev_num") Long mov_rev_num) {
		log.info(".................." + mov_rev_num);
			return new ResponseEntity<>(movieReviewCommentService.getCommentList(mov_rev_num), HttpStatus.OK)
					;}

	@PostMapping(value = "/good", consumes = "application/json")
	public ResponseEntity<ChoiceVO> goodUpdate(@RequestBody MovieReviewCommentChoiceVO movieReviewCommentChoiceVO) {
		ChoiceVO vo = movieReviewCommentService.goodUpdate(movieReviewCommentChoiceVO.getMov_rev_com_num(), movieReviewCommentChoiceVO.getMem_num());
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}

	@PostMapping(value = "/bad", consumes = "application/json")
	public ResponseEntity<ChoiceVO> badUpdate(@RequestBody MovieReviewCommentChoiceVO movieReviewCommentChoiceVO) {
		ChoiceVO vo = movieReviewCommentService.badUpdate(movieReviewCommentChoiceVO.getMov_rev_com_num(), movieReviewCommentChoiceVO.getMem_num());
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	@PostMapping(value = "/new",
	consumes = "application/json",
	produces = { MediaType.TEXT_PLAIN_VALUE})
public ResponseEntity<String> create(@RequestBody MovieReviewCommentVO vo){

log.info("comment" + vo);

int insertCount = movieReviewCommentService.insert(vo);

return (insertCount == 1)
		? new ResponseEntity<>("success", HttpStatus.OK)
		: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
}

}
