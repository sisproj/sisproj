package com.siszo.sisproj.employee.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@RequestMapping("/employeeRegister.do")
	public void employeeRegister() {
		logger.info("사원가입 화면 보여주기");		
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
			
}
