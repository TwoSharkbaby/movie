package org.zerock.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ChoiceVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.domain.MovieReviewCommentVO;
import org.zerock.service.MovieReviewCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@RequestMapping("/comment/*")
@RequiredArgsConstructor
@Log4j
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

	@GetMapping(value = "/pages/{mov_rev_num}/{page}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<List<MovieReviewCommentVO>> gettList(
			@PathVariable("page") int page,
			@PathVariable("mov_rev_num") Long mov_rev_num) {
		log.info(".................." + mov_rev_num);
		Criteria cri = new Criteria(page, 10);
		return new ResponseEntity<>(movieReviewCommentService.getList(cri, mov_rev_num), HttpStatus.OK);
	}
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody MovieReviewCommentVO vo) {

		log.info("comment" + vo);

		int insertCount = movieReviewCommentService.insert(vo);

		return insertCount == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}


	@GetMapping(value = "/{mov_rev_com_num}", produces = { MediaType.APPLICATION_JSON_VALUE,
			MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<MovieReviewCommentVO> get(@PathVariable("mov_rev_com_num") Long mov_rev_com_num) {
		return new ResponseEntity<>(movieReviewCommentService.read(mov_rev_com_num), HttpStatus.OK);
	}

	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH},
			value = "/{mov_rev_com_num}", consumes = "application/json", produces = {MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> modify(@RequestBody MovieReviewCommentVO vo, @PathVariable("mov_rev_com_num") Long mov_rev_com_num) {
		vo.setMov_rev_com_num(mov_rev_com_num);
		log.info("mov_rev_com_num : " +mov_rev_com_num);
		
		log.info(vo);
		
		return movieReviewCommentService.update(vo) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@DeleteMapping(value = "/{mov_rev_com_num}", produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("mov_rev_com_num") Long mov_rev_com_num) {
		log.info("remove" + mov_rev_com_num);
		return movieReviewCommentService.delete(mov_rev_com_num) == 1 
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	
}
