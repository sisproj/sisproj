package com.siszo.sisproj.confirm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/confirm")
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("전자결재 메인화면 보여주기");
		return "confirm/main";
	}
	
	@RequestMapping("/newcho.do")
	public String newwrite() {
		logger.info("새 결재 진행 - choice 화면 보여주기");
		return "confirm/newcho";
	}
	
	@RequestMapping("/write.do")
	public String write() {
		logger.info("새 결재 진행 - choice 화면 보여주기");
		return "confirm/write";
	}
}
