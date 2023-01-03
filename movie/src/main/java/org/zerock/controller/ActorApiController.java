package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.ActorVO;
import org.zerock.service.ActorService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@RestController
@Log4j
@RequestMapping("/actor/*")
@RequiredArgsConstructor
public class ActorApiController {

	private final ActorService actorService;
	
	@GetMapping(value = "/{act_num}", produces = { MediaType.APPLICATION_JSON_VALUE, MediaType.APPLICATION_XML_VALUE })
	public ResponseEntity<ActorVO> read(@PathVariable("act_num") Long act_num) {
		return new ResponseEntity<>(actorService.read(act_num), HttpStatus.OK);
	}
	
}
