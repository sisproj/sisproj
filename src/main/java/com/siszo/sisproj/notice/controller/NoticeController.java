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
		logger.info("공지사항 리스트");
	}
	
	@RequestMapping("/noticeWrite.do")
	public void noticeWrite() {
		logger.info("공지사항 글쓰기");
	}
	
	@RequestMapping("/noticeUpdate.do")
	public void noticeUpdate() {
		logger.info("공지사항 글 수정하기");
	}
}


