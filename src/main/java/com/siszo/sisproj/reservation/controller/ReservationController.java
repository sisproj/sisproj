package com.siszo.sisproj.reservation.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siszo.sisproj.common.SchedulerUtility;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.reservation.model.ReservationSearchVO;

import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.reservation.model.ReservationService;
import com.siszo.sisproj.reservation.model.ReservationVO;
import com.siszo.sisproj.resource.model.ResourceService;
import com.siszo.sisproj.resource.model.ResourceVO;

@Controller
@RequestMapping("/resource")
public class ReservationController {
	private static final Logger logger=LoggerFactory.getLogger(ReservationController.class);
	private SchedulerUtility schUtil = new SchedulerUtility();
	@Autowired
	private ReservationService resService;
	@Autowired
	private ResourceService resourceService;


	@RequestMapping("/resourceWrite.do")
	public String reservationInsert(@ModelAttribute ReservationVO resVo, HttpSession session, Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		int deptNo=empVo.getDeptNo();
		resVo.setEmpNo(empNo);
		resVo.setDeptNo(deptNo);
		String msg="", url="";
		int cnt = 0;
		int count=resService.chkDupRes(resVo);
		if(count<1) {
			cnt=resService.insertReservation(resVo);
			logger.info("자원관리 입력작업 resVo={},cnt={}",resVo,cnt);
			if(cnt>0)
			{
				msg="등록 성공";
				url="/resource/resource.do";
			}else {
				msg="등록 실패";
				url="/resource/resource.do";
			}
		}else if(count>=1){
			msg="승인된 자원 중 같은시간에 중복된 자원이 존재합니다.";
			url="/resource/resource.do";
		}
		model.addAttribute("url",url);
		model.addAttribute("msg",msg);

		return "common/message";
	}

	@RequestMapping("/requestList.do")
	public String requestList(@ModelAttribute ReservationSearchVO searchVo,Model model) {
		logger.info("승인 대기중인 자원예약 리스트, 파라미터 searchVo={}", searchVo);

		//Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		//SearchVo에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값 : {}", searchVo);

		List<Map<String, Object>> list=resService.selectReservationAll(searchVo);
		logger.info("승인 대기중인 자원예약 리스트 조회결과 list.size={}", list.size());		

		int totalRecord=resService.selectTotalRecord();
		logger.info("승인대기 전체 개수 조회 결과, totalRecord={}", totalRecord);

		pagingInfo.setTotalRecord(totalRecord);

		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);

		return "resource/requestList";
	}

	@RequestMapping("/confirmY.do")
	public String updateConfirmY(@RequestParam(defaultValue="0") int rvNo, Model model) {
		logger.info("자원 예약 승인 파라미터 rvNo={}",rvNo);

		int cnt=resService.updateConfirmY(rvNo);
		logger.info("자원 예약 승인 결과 cnt={}", cnt);

		String msg="",url="/resource/requestList.do";
		if(cnt>0) {
			msg="예약이 승인 성공";
		}else {
			msg="예약이 승인 실패";			
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/confirmR.do")
	public String updateConfirmR(@RequestParam(defaultValue="0") int rvNo, Model model) {
		logger.info("자원 예약 반려 파라미터 rvNo={}",rvNo);

		int cnt=resService.updateConfirmR(rvNo);
		logger.info("자원 예약 반려 결과 cnt={}", cnt);

		String msg="",url="/resource/requestList.do";
		if(cnt>0) {
			msg="예약 반려 성공";
		}else {
			msg="예약 반려 실패";			
		}

		model.addAttribute("msg", msg);
		model.addAttribute("url", url);

		return "common/message";
	}

	@RequestMapping("/resource.do")
	public void resourceMainView(@RequestParam(defaultValue="0") int empNo, HttpSession session,Model model) {
		EmployeeVO empVo =(EmployeeVO)session.getAttribute("empVo");
		empNo=empVo.getEmpNo();
		int cnt=resService.deleteTimeOver();
		logger.info("시간지난 자원 삭제 결과값 cnt={}",cnt);
		List<ResourceVO>resourcelist =resourceService.resourceAllselect();
		List<ReservationVO>reslist = resService.reservationNselect();
		List<Map<String, Object>>myreslist=resService.reservationNotYselect(empNo);
		model.addAttribute("myreslist",myreslist);
		model.addAttribute("resourcelist",resourcelist);
		model.addAttribute("reslist",reslist);
	}

}
