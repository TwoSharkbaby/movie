package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.MovieReviewVO;
import org.zerock.service.MovieReviewService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController // REST + Controller
@RequestMapping("/replies/*")
@RequiredArgsConstructor
@Log4j
public class MovieReviewController {

	private final MovieReviewService movieReviewService;

//	@GetMapping(value = "/{mov_num}", produces = { MediaType.APPLICATION_JSON_VALUE,
//			MediaType.APPLICATION_XML_VALUE })
//	public ResponseEntity<List<MovieReviewVO>> getList(@PathVariable Long mov_num) {
//		return new ResponseEntity<>(movieReviewService.movieReviewRead(mov_num), HttpStatus.OK);
//	}



}
