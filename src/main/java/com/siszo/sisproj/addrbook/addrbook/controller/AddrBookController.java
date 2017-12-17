package com.siszo.sisproj.addrbook.addrbook.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookService;
import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;

@Controller
@RequestMapping("/phoneBook")
public class AddrBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddrBookController.class);
	
	@Autowired
	private AddrBookService addrBookService;
/*	
	@RequestMapping("/phoneBookList.do")
	public String list(Model model) {
		logger.info("개인주소록 보여주기");
		
		List<AddrBookVO> addrBookList=addrBookService.selectAddrBookAll();
		logger.info("개인 주소록 조회 결과, addrBookList.size()={}", addrBookList.size());
		
		return "phoneBook/phoneBookList";
	}*/
}
