package com.siszo.sisproj.commue.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.commue.model.CommueService;

@Controller
@RequestMapping("/commue")
public class CommueController {
	private static final Logger logger = LoggerFactory.getLogger(CommueController.class);
	
	@Autowired
	private CommueService commueService;
	
	@RequestMapping(value="/commueMonthList.do",method=RequestMethod.GET)
	public void commueMonthList_get() {
		logger.info("출퇴근 월별 통계 보여주기");
	}
	@RequestMapping("/commueDateList.do")
	public void commueDateList() {
		logger.info("출퇴근 일별 통계 보여주기");
	}
	
	@RequestMapping("/commueOut.do")
	public String commueOut(@RequestParam(defaultValue="0")int cmtNo,Model model) {
		logger.info("퇴근 하기 파라미터 cmtNo={}",cmtNo);
		
		int cnt = commueService.updateOut(cmtNo);
		logger.info("퇴근 하기 결과 조회 cnt={}",cnt);
		
		return "commue/commueOut";
	}
	
}
