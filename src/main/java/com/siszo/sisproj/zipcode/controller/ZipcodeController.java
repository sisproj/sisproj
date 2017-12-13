package com.siszo.sisproj.zipcode.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/zipcode")
public class ZipcodeController {
	private Logger logger = LoggerFactory.getLogger(ZipcodeController.class);
	
	@RequestMapping("/zipcode.do")
	public void selectZipcode() {
		logger.info("우편번호 화면보여주기");
	}
}
