package com.siszo.sisproj.confirm.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.confirm.docform.model.DocumentFormService;
import com.siszo.sisproj.confirm.docform.model.DocumentFormVO;
import com.siszo.sisproj.confirm.model.DocumentService;
import com.siszo.sisproj.confirm.model.DocumentVO;

@Controller
@RequestMapping("/confirm")
public class ConfirmController {
	private static final Logger logger = LoggerFactory.getLogger(ConfirmController.class);
	
	@Autowired
	private DocumentFormService dfService;
	@Autowired
	private DocumentService dService;
	
	@RequestMapping("/main.do")
	public String main() {
		logger.info("전자결재 메인화면 보여주기");
		
		return "confirm/main";
	}
	
	@RequestMapping("/newcho.do")
	public String newwrite(ModelMap model) {
		logger.info("새 결재 진행 - choice 화면 보여주기");
		
		List<DocumentFormVO> docFormList = dfService.selectDocFormAll();
		List<DocumentFormVO> docTypeList = dfService.selectDocTypeAll();
		logger.info("새 결재 진행 조회 결과 docFormList.size()={}, docTypeList.size()={}",docFormList.size(),docTypeList.size());
		
		model.addAttribute("docFormList", docFormList);
		model.addAttribute("docTypeList", docTypeList);
		
		return "confirm/newcho";
	}
	
	@RequestMapping("/write.do")
	public String write(@RequestParam(defaultValue="0") int formNo, Model model) {
		logger.info("새 결재 진행 - 결재 작성 화면 보여주기");
		
		String msg="", url="";
		if(formNo==0) {
			msg="잘못된 URL입니다.";
			url="/confirm/newcho.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		DocumentFormVO vo = dfService.selectDocFormByFormNo(formNo);
		int seq = dService.selectConfirmSEQ();
		logger.info("새 결재문서 작성화면 보여주기 처리결과 vo={}, seql={}",vo, seq);
		
		Date day = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd");
		String today = sdf.format(day);
		System.out.println("오늘날짜"+today);
		
		model.addAttribute("vo",vo);
		model.addAttribute("today",today);
		model.addAttribute("seq",seq);
		
		return "confirm/write";
	}
	
	@RequestMapping("/writeOk.do")
	public String write_post(@ModelAttribute DocumentVO vo, Model model) {
		logger.info("새 결재 진행 - 결재 문서 작성 처리");
		
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

		//ajax 배우고, 조직도 구현 후 구현: 왼쪽 리스트 클릭시 오른쪽 리스트 뿌리기		
		
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
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("formName", vo.getFormName());
		map.put("typeType", vo.getTypeType());
		map.put("formSecu", vo.getFormSecu());
		map.put("formLife", vo.getFormLife());
		map.put("formEx", vo.getFormEx());
		
		dfService.insertDocForm(map);		
		
		model.addAttribute("msg", "결재 양식 등록이 처리되었습니다.");
		model.addAttribute("url", "/confirm/adm/typeform.do");
		
		return "common/message";
	}
	
	@RequestMapping(value="/adm/uptypeform.do", method=RequestMethod.GET)
	public String uptypeform_get(@RequestParam(defaultValue="0") int formNo, Model model) {
		logger.info("결재 양식 수정 화면 보여주기, 파라미터 formNo={}", formNo);
		
		String msg="", url="";
		if(formNo==0) {
			msg="잘못된 URL입니다.";
			url="/confirm/main.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		DocumentFormVO vo = dfService.selectDocFormByFormNo(formNo);
		logger.info("결재 양식 수정 화면 보여주기 처리 결과 vo={}",vo);
		
		model.addAttribute("vo",vo);
		
		return "confirm/adm/uptypeform";
	}

	@RequestMapping(value="/adm/uptypeform.do", method=RequestMethod.POST)
	public String uptypeform_post(@ModelAttribute DocumentFormVO vo, Model model) {
		logger.info("결재양식 수정 처리, 파라미터 vo={}",vo);
		
		String msg="", url="/confirm/adm/uptypeform.do?formNo="+vo.getFormNo();
		int res = dfService.updateDocForm(vo);
		logger.info("결재양식 수정 처리 결과, res={}",res);
		
		if(res>0) {
			msg="수정 되었습니다.";
		} else {
			msg="수정실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		return "common/message";
	}
	
	@RequestMapping("/adm/formDel.do")
	public String delForm(@RequestParam(defaultValue="0") int formNo, @RequestParam(defaultValue="0") int typeNo, Model model) {
		logger.info("결재양식 삭제 처리, 파라미터 formNo={}, typeNo={}",formNo, typeNo);
		
		String msg="", url="";
		if(formNo==0 || typeNo==0) {
			msg="잘못된 URL입니다.";
			url="/confirm/main.do";
			
			model.addAttribute("msg",msg);
			model.addAttribute("url",url);
			
			return "common/message";
		}
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("formNo", formNo);
		map.put("typeNo", typeNo);
		
		dfService.deleteDocForm(map);	
		
		model.addAttribute("msg", "결재 양식 삭제가 처리되었습니다.");
		model.addAttribute("url", "/confirm/adm/typeform.do");
		
		return "common/message";		
	}
	
	@RequestMapping("/adm/typeform.do")
	public String typeform(ModelMap model) {
		logger.info("결재 양식관리 보여주기");

		List<DocumentFormVO> docFormList = dfService.selectDocFormAll();
		List<DocumentFormVO> docTypeList = dfService.selectDocTypeAll();
		logger.info("결재 양식 조회 결과 docFormList.size()={}, docTypeList.size()={}",docFormList.size(),docTypeList.size());
		
		model.addAttribute("docFormList", docFormList);
		model.addAttribute("docTypeList", docTypeList);		
		
		return "confirm/adm/typeform";
	}
	
}
