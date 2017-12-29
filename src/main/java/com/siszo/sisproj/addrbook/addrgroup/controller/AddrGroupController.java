package com.siszo.sisproj.addrbook.addrgroup.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupService;
import com.siszo.sisproj.addrbook.addrgroup.model.AddrGroupVO;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/addrBook")
public class AddrGroupController {
	private static final Logger logger=LoggerFactory.getLogger(AddrGroupController.class);
	
	@Autowired
	private AddrGroupService addrGroupService;
	
	@RequestMapping("/addrGroupList.do")
	public String group_List(HttpSession session, Model model) {
		EmployeeVO empVo=(EmployeeVO)session.getAttribute("empVo");
		int empNo=empVo.getEmpNo();
		
		logger.info("주소록 그룹명 보여주기, 파라미터 empNo={}",empNo);
		
		List<AddrGroupVO> addrGroupList=addrGroupService.selectGroupName(empNo);
		logger.info("주소록 그룹명 조회 결과, addrGroupList.size()={}", addrGroupList.size());
		
		model.addAttribute("addrGroupList", addrGroupList);
		
		return "addrBook/addrGroupList";
	}
	
	@RequestMapping("/groupList.do")
	@ResponseBody
	public List<AddrGroupVO> groupList(@RequestParam(defaultValue="0")int empNo) {
		logger.info("좌측 내주소록 클릭시 그룹명 보여주기, 파라미터 empNo={}", empNo);
		
		List<AddrGroupVO> list=addrGroupService.selectGroupName(empNo);
		logger.info("주소록 그룹명 조회 결과, list.size()={}", list.size());
		
		return list;
	}
}
