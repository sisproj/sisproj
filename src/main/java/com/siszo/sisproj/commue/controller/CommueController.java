package com.siszo.sisproj.commue.controller;

import java.util.List;

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
	public String commueDateList(Model model) {
		logger.info("출퇴근 일별 통계 보여주기");
		
		List<CommueVO> list= commueService.selectAll();
		logger.info("출퇴근 일별 통계 조회 결과 list.size()={}",list.size());
		
		model.addAttribute("list",list);
		
		return "commue/employeeDateList";
	}
	@RequestMapping("/commueIn.do")
	public String commueIn(@ModelAttribute CommueVO cmtVo,HttpSession session,Model model) {
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		int empNo = empVo.getEmpNo();
		logger.info("출근 하기 파라미터 empNo={},cmtVo={}",empNo,cmtVo);
		
		cmtVo.setEmpNo(empNo);
		int cnt = commueService.insertIn(cmtVo);
		logger.info("출근 하기 결과 cnt={}",cnt);
		
		String msg="",url="/home.do";
		if(cnt>0) {
			msg="출근 성공";
		}else {
			msg="출근 실패";
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
		
		int cnt = commueService.updateOut(cmtVo.getCmtNo());
		logger.info("퇴근 하기 결과 조회 cnt={}",cnt);
		
		String msg="",url="/home.do";
		if(cnt>0) {
			msg="퇴근 성공";
		}else {
			msg="퇴근 실패";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	/*@RequestMapping("/commuePage.do")
	public String commuePage() {
		
	}*/
}
