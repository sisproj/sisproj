package com.siszo.sisproj.commue.controller;

import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.siszo.sisproj.commue.model.CommueService;
import com.siszo.sisproj.commue.model.CommueVO;
import com.siszo.sisproj.commue.model.DateSearchVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

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
	public String commueDateList(@ModelAttribute DateSearchVO dateSearchVo,Model model) {
		logger.info("출퇴근 일별 통계 보여주기 파라미터 dateSearchVo={}",dateSearchVo);
				
		List<Map<String, Object>> list=null;
		if(dateSearchVo.getStartDay()!=null && !dateSearchVo.getStartDay().isEmpty()) {
			list=commueService.searchDate(dateSearchVo);
			logger.info("출퇴근 일별 조회 결과, list.size()={}", list.size());		
		}
		
		model.addAttribute("list", list);	
			
		return "commue/employeeDateList";
	}
	@RequestMapping("/commueDateList2.do")
	public String commueDateList2(@ModelAttribute DateSearchVO dateSearchVo,Model model) {
		logger.info("출퇴근 일별 통계 보여주기 파라미터 dateSearchVo={}",dateSearchVo);
				
		List<Map<String, Object>> list=null;
		if(dateSearchVo.getStartDay()!=null && !dateSearchVo.getStartDay().isEmpty()) {
			list=commueService.searchDate(dateSearchVo);
			logger.info("출퇴근 일별 조회 결과, list.size()={}", list.size());		
		}
		
		model.addAttribute("list", list);	
			
		return "commue/employeeDateList2";
	}
	@RequestMapping("/commueIn.do")
	public String commueIn(@ModelAttribute CommueVO cmtVo,HttpSession session,Model model) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		logger.info("출근 하기 파라미터 empNo={},cmtVo={}",empNo,cmtVo);
		
		cmtVo.setEmpNo(empNo);
		
		int result=commueService.selectInChk(empNo);
		String msg="",url="/home.do";
		if(result==commueService.CHECK_IN) {
			int cnt = commueService.insertIn(cmtVo);
			logger.info("출근 하기 결과 cnt={}",cnt);
			if(cnt>0) {
				msg="출근 성공";				
			}
		}else if(result==commueService.CHECK_IN_OK) {
			msg="이미 출근 버튼을 누르셨습니다";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/commueOut.do")
	public String commueOut(HttpSession session,Model model) {
		EmployeeVO vo = (EmployeeVO) session.getAttribute("empVo");
		int empNo = vo.getEmpNo(); 
		CommueVO cmtVo = commueService.selectByEmpNo(empNo);
		logger.info("퇴근하기 cmtVo={}",cmtVo);
				
		logger.info("퇴근 하기 파라미터 cmtNo={}",cmtVo.getCmtNo());
		int result = commueService.selectOutChk(empNo);
		
		String msg="",url="/home.do";
		if(result==commueService.CHECK_OUT) {
			int cnt = commueService.updateOut(cmtVo.getCmtNo());
			logger.info("퇴근 하기 결과 조회 cnt={}",cnt);
			msg="퇴근 성공";
		}else if(result==commueService.selectInChk(empNo)) {
			msg="퇴근 실패";
		}
	
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
		
	}
}
