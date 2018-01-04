package com.siszo.sisproj.reservation.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.common.SchedulerUtility;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.reservation.model.ReservationService;
import com.siszo.sisproj.reservation.model.ReservationVO;

@Controller
@RequestMapping("/resource")
public class ReservationController {
	private static final Logger logger=LoggerFactory.getLogger(ReservationController.class);
	private SchedulerUtility schUtil = new SchedulerUtility();
	@Autowired
	private ReservationService resService;
	
	@RequestMapping("/resourceWrite.do")
	public String reservationInsert(@ModelAttribute ReservationVO resVo, HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		int deptNo=empVo.getDeptNo();
		resVo.setEmpNo(empNo);
		resVo.setDeptNo(deptNo);
		
		
		
		logger.info("자원관리 입력작업 resVo={}",resVo);
		resVo.setRvStart(schUtil.ChangeDate(resVo.getRvStart()));
		resVo.setRvEnd(schUtil.ChangeDate(resVo.getRvEnd()));
		int cnt=resService.insertReservation(resVo);
		String msg="", url="";
		if(cnt>0)
		{
			msg="등록 성공";
			url="/resource/resource.do";
		}else {
			msg="등록 실패";
			url="/resource/resource.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";
	}

}
