package com.siszo.sisproj.employee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.siszo.sisproj.employee.model.EmployeeService;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.GET)
	public void employeeRegister_get() {
		logger.info("사원등록 화면 보여주기");		
	}	
	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.POST)
	public void employeeRegister_post(@ModelAttribute EmployeeVO vo,Model model) {
		logger.info("사원 등록 , 파라미터 vo={}",vo);
		
		
	}
	
	@RequestMapping("/employeeEdit.do")
	public void employeeEdit_get() {
		logger.info("사원가입 화면 보여주기");		
	}
	@RequestMapping("/employeeList.do")
	public void employeeList() {
		logger.info("사원가입 화면 보여주기");		
	}
	@RequestMapping("/employeeDetail.do")
	public void employeeDetail_get() {
		logger.info("사원상세보기 화면 보여주기");
	}
	@RequestMapping("/employeeDetailSerach.do")
	public void employeeDetailSerach() {
		logger.info("사원 상세검색 화면 보여주기");
	}
}
