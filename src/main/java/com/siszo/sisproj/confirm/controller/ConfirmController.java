package com.siszo.sisproj.confirm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/confirm")
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("전자결재 메인화면 보여주기");
		return "confirm/main";
	}
	
	@RequestMapping("/newcho.do")
	public String newwrite() {
		logger.info("새 결재 진행 - choice 화면 보여주기");
		return "confirm/newcho";
	}
	
	@RequestMapping("/write.do")
	public String write() {
		logger.info("새 결재 진행 - 결재 작성 화면 보여주기");
		return "confirm/write";
	}
	
	@RequestMapping("/tempsave.do")
	public String tempsave() {
		logger.info("임시저장함 보여주기");
		return "confirm/tempsave";
	}
	
	@RequestMapping("/setting.do")
	public String setting() {
		logger.info("결재 환경 설정 보여주기");
		return "confirm/setting";
	}

	@RequestMapping("/typeform.do")
	public String typeform() {
		logger.info("결재 환경 설정 보여주기");
		return "confirm/typeform";
	}
	
	@RequestMapping("/uptypeform.do")
	public String uptypeform() {
		logger.info("결재 양식 수정 화면 보여주기");
		return "confirm/uptypeform";
	}
	
	@RequestMapping("/await.do")
	public String await() {
		logger.info("결재대기함 화면 보여주기");
		return "confirm/await";
	}
	
	@RequestMapping("/complete.do")
	public String complete() {
		logger.info("결재완료함 화면 보여주기");
		return "confirm/complete";
	}
	
	@RequestMapping("/detail.do")
	public String detail() {
		logger.info("상세페이지 - detail.jsp 보여주기");
		return "confirm/detail";
	}
	
	@RequestMapping("/instypeform.do")
	public String instypeform() {
		logger.info("결재 양식 등록 화면 보여주기");
		return "confirm/instypeform";
	}
	
	@RequestMapping("/line.do")
	public String line() {
		logger.info("결재라인 선택화면 보여주기");
		return "confirm/line";
	}
	
	@RequestMapping("/return.do")
	public String return_get() {
		logger.info("결재 반려함 보여주기");
		return "confirm/return";
	}

	@RequestMapping("/edit.do")
	public String edit() {
		logger.info("문서 수정화면 보여주기");
		return "confirm/edit";
	}
}
