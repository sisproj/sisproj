package com.siszo.sisproj.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger
		= LoggerFactory.getLogger(NoticeController.class);
	
	@RequestMapping("/noticeList.do")
	public void noticeList() {
		logger.info("공지사항 리스트 보여주기");
	}
}


