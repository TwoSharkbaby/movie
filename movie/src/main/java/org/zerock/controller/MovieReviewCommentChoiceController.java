package org.zerock.controller;

import static org.springframework.test.web.client.match.MockRestRequestMatchers.method;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.CommentPageDTO;
import org.zerock.domain.Criteria;
import org.zerock.domain.MovieReviewCommentChoiceVO;
import org.zerock.service.MovieReviewCommentChoiceService;
import org.zerock.service.MovieReviewCommentService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/mov_rev_comment_cho/*")
@RequiredArgsConstructor
public class MovieReviewCommentChoiceController {

	private final MovieReviewCommentChoiceService service;
	
//	
//	@RequestMapping(
//			value = "{mov_rev_com_cho_num}",
//			consumes  = "application/json",
//			produces = {MediaType.TEXT_PLAIN_VALUE},
//			method = {RequestMethod.PUT , RequestMethod.PATCH})
//		public ResponseEntity<String> modify(@RequestBody MovieReviewCommentChoiceVO vo, @PathVariable("mov_rev_com_cho_num") Long mov_rev_com_cho_num){
//		
//			vo.setMov_rev_com_cho_num(mov_rev_com_cho_num);
//		
//			
//			return (service.modify(vo) == 1)
//					? new ResponseEntity<>("success", HttpStatus.OK)
//					: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
//			
//	
//	@DeleteMapping(value = "/{mov_rev_com_cho_num}", produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> remove(@PathVariable("mov_rev_com_cho_num") Long mov_rev_com_cho_num) {
//		log.info("remove"+mov_rev_com_cho_num);
//		return service.remove(mov_rev_com_cho_num) == 1 
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//		
//	}
//			
//	
//	@GetMapping(value = "{mov_rev_com_cho_num}", produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
//	public ResponseEntity<MovieReviewCommentChoiceVO> get(@PathVariable("mov_rev_com_cho_num") Long mov_rev_com_cho_num){
//		return new ResponseEntity<>(service.get(mov_rev_com_cho_num), HttpStatus.OK);
//	}
//	
//	@GetMapping(value = "/pages/{mov_rev_com_cho_num}/{page}",
//				produces = {MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE})
//	public ResponseEntity<CommentPageDTO> getList(@PathVariable("page") int page ,@PathVariable("mov_rev_com_cho_num") Long mov_rev_com_cho_num){
//		log.info("......................." + page);
//		Criteria cri = new Criteria(page,10);
//		 return new ResponseEntity<>(service.getListPage(cri, mov_rev_com_cho_num), HttpStatus.OK);
//	}
//	
//	@PostMapping(value = "/new",
//				consumes = "application/json",
//				produces = {MediaType.TEXT_PLAIN_VALUE})
//	public ResponseEntity<String> create(@RequestBody MovieReviewCommentChoiceVO vo){
//		log.info("comment" + vo);
//		int insertCount =service.register(vo);
//		
//		return (insertCount == 1)
//				? new ResponseEntity<>("success", HttpStatus.OK)
//				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}
	
	
	
	
	
}
