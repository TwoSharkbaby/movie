package org.zerock.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {

	// 에러 페이지
	@ExceptionHandler(Exception.class) 
	public String exception(Exception ex) {
		return "error_page";
	}
	
}
