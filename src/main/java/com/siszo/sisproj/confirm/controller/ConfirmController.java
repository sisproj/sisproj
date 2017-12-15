package com.siszo.sisproj.confirm.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.confirm.model.DocumentFormService;
import com.siszo.sisproj.confirm.model.DocumentFormVO;

@Controller
@RequestMapping("/confirm")
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
	
	@Autowired
	private DocumentFormService dfService;
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
	
	//admin
	@RequestMapping(value="/adm/instypeform.do", method=RequestMethod.GET)
	public String instypeform_get() {
		logger.info("결재 양식 등록 화면 보여주기");
		return "confirm/adm/instypeform";
	}
	
	@RequestMapping(value="/adm/instypeform.do", method=RequestMethod.POST)
	public String instypeform_post(@ModelAttribute DocumentFormVO vo, Model model) {
		logger.info("결재 양식 등록 처리, 파라미터 vo={}",vo);
		
		int resArr[] = dfService.insertDocForm(vo);
		logger.info("결재 양식 등록 처리 결과 resArr[1]={}",resArr[1]);
		
		String msg="", url="";
		if(resArr[1]>0) {
			msg="결재 양식 등록이 처리되었습니다.";
			url="/confirm/adm/uptypeform.do?formNo="+resArr[0];
		} else {
			msg="결재 양식 등록 실패";
			url="/confirm/adm/instypeform.do";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/adm/uptypeform.do", method=RequestMethod.GET)
	public String uptypeform_get(@RequestParam String formNo, Model model) {
		logger.info("결재 양식 수정 화면 보여주기");
		
		String msg="", url="";
		if(formNo==null || formNo.isEmpty()) {
			msg="잘못된 URL 입니다.";
			url="/confirm/main.do";
			
			return "common/message";
		}
		
		DocumentFormVO vo = dfService.selectDocFormByFormNo(Integer.parseInt(formNo));
		
		return "confirm/adm/uptypeform";
	}
	
	@RequestMapping("/adm/typeform.do")
	public String typeform() {
		logger.info("결재 환경 설정 보여주기");
		return "confirm/adm/typeform";
	}
	
}
