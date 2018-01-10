package com.siszo.sisproj.resource.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.resource.model.ResourceListVO;
import com.siszo.sisproj.resource.model.ResourceSearchVO;
import com.siszo.sisproj.resource.model.ResourceService;
import com.siszo.sisproj.resource.model.ResourceVO;

@Controller
public class ResourceController {
	private static final Logger logger=LoggerFactory.getLogger(ResourceController.class);
	
	@Autowired
	private ResourceService resourceService;
	
	@RequestMapping("/resource/adm/resourceWrite.do")
	public String insertResource(@ModelAttribute ResourceVO resVo, HttpSession session, Model model) {
		EmployeeVO empVo=(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		
		logger.info("관리자-자원등록, 파라미터 resourceVo={},empNo={}", resVo, empNo);
		
		resVo.setEmpNo(empNo);
		
		int cnt=resourceService.insertResource(resVo);
		
		String msg="",url="/resource/adm/resourceList.do";
		if(cnt>0) {
			msg="자원 등록 성공";
		}else {
			msg="자원 등록 실패";			
		}
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
	
	@RequestMapping("/resource/adm/resourceList.do")
	public String list(@ModelAttribute ResourceSearchVO searchVo,Model model) {
		logger.info("자원 리스트 조회, 파마리터 searchVo={}",searchVo);
		
		// Paging 처리에 필요한 변수를 계산해주는 PaginationInfo 생성
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(searchVo.getCurrentPage());

		// SearchVo에 값 셋팅
		searchVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		searchVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값 : {}", searchVo);
		
		List<ResourceVO> list=resourceService.selectResourceAll(searchVo);
		logger.info("자원 리스트 조회 결과, list.size={}",list.size());
		
		int totalRecord = resourceService.selectTotalRecord();
		logger.info("승인대기 전체 개수 조회 결과, totalRecord={}", totalRecord);
		
		pagingInfo.setTotalRecord(totalRecord);
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "resource/adm/resourceList";
	}
	
	@RequestMapping("/resource/adm/deleteResource.do")
	public String deleteMulti(@ModelAttribute ResourceListVO resListVo, Model model) {
		logger.info("관리자-자원목록 멀티 삭제, 파라미터 ResourceListVO={}",resListVo);
		
		List<ResourceVO> list=resListVo.getResourceItems();
		
		int cnt=resourceService.deleteResourceMulti(list);
		logger.info("관리자-자원목록 멀티 삭제 결과 cnt={}", cnt);
		
		String msg="",url="/resource/adm/resourceList.do";
		if(cnt>0) {
			msg="선택 자원 삭제 성공";
		}else {
			msg="선택 자원 삭제 실패";			
		}
		
		model.addAttribute("msg", msg);
		model.addAttribute("url", url);
		
		return "common/message";
	}
}
