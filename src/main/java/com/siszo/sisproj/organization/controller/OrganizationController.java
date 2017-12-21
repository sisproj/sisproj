package com.siszo.sisproj.organization.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String selectDept_list(Model model) {
		logger.info("조직도 부서명 리스트 and 부서별 사원리스트");
		
		List<DeptVO> deptList=deptService.selectDeptName();
		logger.info("부서명 조회결과 deptList.size()={}", deptList.size());
		
		List<EmployeeVO> empList=orgService.selectEmp();
		logger.info("부서별 사원리스트 조회결과 empList.size()={}", empList.size());

		model.addAttribute("deptList", deptList);
		model.addAttribute("empList", empList);
		
		return "organization/orgList";
	}
	
	@RequestMapping("/empInfo.do")
	@ResponseBody
	public EmployeeVO selectEmpByEmpNo(@RequestParam(defaultValue="0") int empNo) {
		logger.info("사원번호별 사원정보 조회, 파라미터 empNo={}", empNo);
		
		EmployeeVO vo=orgService.selectEmpByEmpNo(empNo);
		logger.info("사원번호로 사원 조회 결과 vo={}",vo);
		
		return vo;
	}
	
	@RequestMapping(value="/orgSearch.do",produces="application/json; charset=utf-8")
	@ResponseBody
	public List<EmployeeVO> selectMulti(@RequestParam String keyword){
		logger.info("조직도에서 검색, 파라미터 keyword={}", keyword);
		
		List<EmployeeVO> list=orgService.selectMulti(keyword);
		logger.info("조직도 내 검색 결과 list.size()={} ", list.size());
		
		return list;
	}
}
