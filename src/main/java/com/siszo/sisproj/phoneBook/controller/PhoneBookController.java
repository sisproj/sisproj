package com.siszo.sisproj.phoneBook.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/phoneBook")
public class PhoneBookController {
	private static final Logger logger=LoggerFactory.getLogger(PhoneBookController.class);
	
	@RequestMapping("/phoneBook.do")
	public void main_view() {
		logger.info("주소록 화면 보여주기");
	}
}
