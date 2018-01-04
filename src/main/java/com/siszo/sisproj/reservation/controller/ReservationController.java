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
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.reservation.model.ReservationSearchVO;

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

	@RequestMapping("/requsetList.do")
	public void requestList(@ModelAttribute ReservationSearchVO searchVo,Model model) {
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
		
		
		
		
		int totalRecord = 0;
		logger.info("승인대기 전체 개수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);

	}
}
