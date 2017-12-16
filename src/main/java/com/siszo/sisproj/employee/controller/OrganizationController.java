package com.siszo.sisproj.employee.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeService;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.organization.model.OrganizationService;

@Controller
@RequestMapping("/organization")
public class OrganizationController {
	
	@Autowired
	private DeptService deptService;
	@Autowired
	private OrganizationService orgService;
	
	private Logger logger=LoggerFactory.getLogger(OrganizationController.class);
	
	@RequestMapping("/orgList.do")
	public String selectDept_list(@RequestParam(defaultValue="0") int deptNo, Model model) {
		logger.info("조직도 부서명 리스트 and 부서별 사원리스트, 파라미터 deptNo={}", deptNo);
		
		List<DeptVO> deptList=deptService.selectDeptName();
		logger.info("부서명 조회결과 deptList.size()={}", deptList.size());
		DeptVO vo = deptList.get(0);
		
		List<EmployeeVO> empList=orgService.selectEmp();
		logger.info("부서별 사원리스트 조회 결과 empList.size()={}",empList.size());
		
		System.out.println("이름 : "+vo.getDeptName());
		System.out.println("번호 : "+vo.getDeptNo());
		
		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
		return "organization/orgList";
	}
}
