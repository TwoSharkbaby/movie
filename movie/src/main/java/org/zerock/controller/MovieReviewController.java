package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.MovieReviewVO;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController // REST + Controller
@RequestMapping("/review/*")
@RequiredArgsConstructor
@Log4j
public class MovieReviewController {

	private final MovieReviewService movieReviewService;

//	@GetMapping(value = "/{mov_num}", produces = { MediaType.APPLICATION_JSON_VALUE,
//			MediaType.APPLICATION_XML_VALUE })
//	public ResponseEntity<List<MovieReviewVO>> getList(@PathVariable Long mov_num) {
//		return new ResponseEntity<>(movieReviewService.movieReviewRead(mov_num), HttpStatus.OK);
//	}
	
	@PostMapping(value = "/good", consumes = "application/json")
	public ResponseEntity<String> goodUpdate(@RequestBody MovieReviewVO movieReviewVO) {
		log.info("movieReviewVO" + movieReviewVO);

//		int insertCount = movieReviewService.goodUpdate()

		return new ResponseEntity<>(HttpStatus.OK);
	}



}
