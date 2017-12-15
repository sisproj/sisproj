package com.siszo.sisproj.commue.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/commue")
public class CommueController {
	private static final Logger logger = LoggerFactory.getLogger(CommueController.class);
	
	@RequestMapping("/commueMonthList.do")
	public void commueMonthList() {
		logger.info("출퇴근 월별 통계 보여주기");
	}
	@RequestMapping("/commueDateList.do")
	public void commueDateList() {
		logger.info("출퇴근 일별 통계 보여주기");
	}
}
