package com.siszo.sisproj.webhard.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/webhard")
public class WebhardController {
	private static final Logger logger = LoggerFactory.getLogger(WebhardController.class);
	
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("웹하드 메인 화면 보여주기");
		
		return "webhard/main";
	}
}
