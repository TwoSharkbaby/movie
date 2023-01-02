package org.zerock.persistence;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class Tests {
	
	@Test
	public void test() {
		log.info("===========================================================");
		
		String text = "2023\\01\\02/s_9f887ab6-dbc3-4b63-a3a7-d1f5b075d55c_¹é¾Øµå °úÁ¤.png";

		text.replace("/", "\\");
		String path = text.substring(0, 10);
		log.info("path = " + path);
		
		String uuName = text.substring(text.lastIndexOf("s_")+0);
		String name = uuName.substring(uuName.lastIndexOf("_")+1);
		
		log.info("uuName = " + uuName);
		
		log.info("name = " + name);
		
		log.info("===========================================================");
	}

}
