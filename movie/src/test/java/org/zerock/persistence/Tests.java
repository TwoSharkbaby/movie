package org.zerock.persistence;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class Tests {
	
	@Test
	public void test() {
		log.info("===========================================================");
		
		String text = "2023\\01\\03/s_465a8e6b-59c4-4fde-9167-bd5a8b03f44c_happy.jpg";

		text.replace("/", "\\");
		String path = text.substring(0, 10);
		log.info("path = " + path);
		
		String uuName = text.substring(text.lastIndexOf("s_")+2);
		String name = uuName.substring(uuName.lastIndexOf("_")+1);
		String uu = uuName.replace("_"+name, "");
		
		log.info("uu = " + uu);
		log.info("name = " + name);
		
		
		
		log.info("===========================================================");
	}

}
