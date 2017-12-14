package com.siszo.sisproj.commue.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commue")
public class CommueController {
	private static final Logger logger = LoggerFactory.getLogger(CommueController.class);
	
	@RequestMapping("/commueList.do")
	public void commueList() {
		logger.info("출퇴근 통계 보여주기");
	}
}
