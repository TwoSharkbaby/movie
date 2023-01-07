package org.zerock.exception;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CommonExceptionAdvice {

	// ���� ������
	@ExceptionHandler(Exception.class) 
	public String exception(Exception ex) {
		return "error_page";
	}
	
}
