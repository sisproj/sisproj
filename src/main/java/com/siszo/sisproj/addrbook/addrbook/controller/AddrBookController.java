package com.siszo.sisproj.addrbook.addrbook.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.siszo.sisproj.addrbook.addrbook.model.AddrBookService;
import com.siszo.sisproj.addrbook.addrbook.model.AddrBookVO;

@Controller
@RequestMapping("/addrBook")
public class AddrBookController {
	private static final Logger logger=LoggerFactory.getLogger(AddrBookController.class);
	
	@Autowired
	private AddrBookService addrBookService;
	
	/*@RequestMapping(value="/addrBookList.do", method=RequestMethod.GET)
	public void list() {
		logger.info("개인 주소록 화면 보여주기");
	}*/
	@RequestMapping(value="/addrBookList.do")
	public String list(Model model) {
		logger.info("개인주소록 리스트 조회하기");
		
		List<AddrBookVO> addrBookList=addrBookService.selectAddrBookAll();
		logger.info("개인 주소록 리스트 조회 결과, addrBookList.size()={}", addrBookList.size());
		
		return "addrBook/addrBookList";
	}
	@RequestMapping("/addrBookWrite.do")
	public void write() {
		logger.info("연락처 등록 화면 보여주기");
	}
	@RequestMapping("/addrBookTrash.do")
	public void trash() {
		logger.info("휴지통 화면 보여주기");
	}
	
}
