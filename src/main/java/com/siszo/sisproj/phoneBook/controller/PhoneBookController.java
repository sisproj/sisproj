package com.siszo.sisproj.phoneBook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/phoneBook")
public class PhoneBookController {
	private static final Logger logger=LoggerFactory.getLogger(PhoneBookController.class);
	
	@RequestMapping("/phoneBookList.do")
	public void list() {
		logger.info("주소록 화면 보여주기");
	}
	
	@RequestMapping("/phoneBookWrite.do")
	public void write() {
		logger.info("연락처 등록 화면 보여주기");
	}
	@RequestMapping("/phoneBookTrash.do")
	public void trash() {
		logger.info("휴지통 화면 보여주기");
	}
}
