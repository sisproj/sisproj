package com.siszo.sisproj.schcontroller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/scheduler")
public class SchController {

	private static final Logger logger = LoggerFactory.getLogger(SchController.class);

	@RequestMapping("/scheduler.do")
	public void schduler_get() {
		logger.info("스케쥴 화면 보여주기");
	}
	
	
}
