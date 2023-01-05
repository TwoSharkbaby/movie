package org.zerock.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

import lombok.extern.log4j.Log4j;

@ControllerAdvice
@Log4j
public class CommonExceptionAdvice {

	@ExceptionHandler(Exception.class) 
	//@ResponseStatus(HttpStatus.NOT_FOUND) 
	public String exception(Exception ex) {
		return "error_page";
	}
	
//	@ExceptionHandler(NoSuchElementException.class)  // 런타임 에러
//	//@ResponseStatus(HttpStatus.NOT_FOUND) 
//	public String noElement(Exception ex) {
//		return "error_page";
//	}
//	
//	@ExceptionHandler(MethodArgumentNotValidException.class) // 벨리데이션 에러
//	//@ResponseStatus(HttpStatus.NOT_FOUND) 
//	public String noMethod(Exception ex) {
//		return "error_page";
//	}
}
