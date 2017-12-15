package com.siszo.sisproj.employee.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeService;

@Controller
@RequestMapping("/organization")
public class OrganizationController {
	private EmployeeService empService;
	private DeptService deptService;
	
	private Logger logger=LoggerFactory.getLogger(OrganizationController.class);
	
	@RequestMapping("/orgList.do")
	public String selectDept_list(Model model) {
		logger.info("조직도 부서명 리스트");
		
		List<DeptVO> deptList=deptService.selectDeptName();
		logger.info("부서명 조회결과 deptList.size()={}", deptList.size());
		
		model.addAttribute("deptList", deptList);
		
		return "organization/orgList";
	}
}
