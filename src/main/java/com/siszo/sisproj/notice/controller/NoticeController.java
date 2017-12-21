package com.siszo.sisproj.notice.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


@Controller
@RequestMapping("/notice")
public class NoticeController {
	private static final Logger logger
		= LoggerFactory.getLogger(NoticeController.class);
	
	/*@Autowired
	private NoticeService noticeService;*/
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.GET)
	public String noticeWrite_get() {
		logger.info("공지사항 글쓰기");
		
		return "notice/noticeWrite";
	}
	
	@RequestMapping(value="/noticeWrite.do", method=RequestMethod.POST)
	public String noticeWrite_post() {
		logger.info("공지사항 글쓰기");
		
		return "common/message";	
	}
	
	@RequestMapping("/noticeList.do")
	public void noticeList() {
		logger.info("공지사항 리스트");
	}
	
	@RequestMapping("/noticeUpdate.do")
	public void noticeUpdate() {
		logger.info("공지사항 글 수정하기");
	}
	
	@RequestMapping("/noticeDetail.do")
	public void noticeDetail() {
		logger.info("공지사항 상세보기");
	}
	
	
}


