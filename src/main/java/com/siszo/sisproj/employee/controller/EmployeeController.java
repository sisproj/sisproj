package com.siszo.sisproj.employee.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	public String employeeRegister_post(@ModelAttribute EmployeeVO vo,
			@RequestParam String tel1,@RequestParam String tel2,@RequestParam String tel3,
			@RequestParam String email1,@RequestParam String email2,@RequestParam String email3,Model model) {
		logger.info("사원 등록 , 파라미터 vo={}",vo);
		
		if(tel2==null || tel2.isEmpty() || tel3==null || tel3.isEmpty()){
			vo.setEmpTel("");		
		}else {
			vo.setEmpTel(tel1+tel2+tel3);
		}
		
		if(email1==null || email1.isEmpty()) {
			vo.setEmpEmail("");				
		}else {
			if(email2.equals("etc")) {
				if(email3!=null && !email3.isEmpty()) {
					vo.setEmpEmail(email1+email3);
				}else if(email2!=null && !email2.isEmpty()) {
					vo.setEmpEmail(email1+email2);
				}
			}
		}	
		int cnt=employeeService.insertEmployee(vo);
		
		String msg="",url="/employee/employeeRegister.do";
		if(cnt>0){
			msg="사원 등록 완료!";
			url="/home.do";
		}else {
			msg="사원 등록 실패!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping(value="/employeeEdit.do",method=RequestMethod.GET)
	public String employeeEdit_get(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원수정 화면 보여주기");			
		EmployeeVO vo =  employeeService.selectEmployeeByNo(empNo);
		
		model.addAttribute("vo",vo);
		logger.info("회원 수정 화면 상세보기 결과값  vo={}",vo);
		
		return "employee/employeeEdit";
	}
	@RequestMapping(value="/employeeEdit.do",method=RequestMethod.POST)
	public String employeeEdit_post(@ModelAttribute EmployeeVO vo ,Model model) {
		logger.info("사원 수정 된 파라미터 vo={}",vo);			
		
		int cnt= employeeService.editEmployee(vo);
		String msg="",url="";
		if(cnt>0) {
			msg="사원 수정 성공!";
			url="/employee/employeeList.do";
		}else {
			msg="사원 수정 실패!";
			url="/employee/employeeEdit.do?empNo="+vo.getEmpNo();
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	
	@RequestMapping("/employeeList.do")
	public String employeeList(Model model) {
		logger.info("사원 리스트 화면 보여주기");	
		
		List<EmployeeVO> list = employeeService.selectAllEmployee();
		logger.info("사원 전체 조회 결과  list.Size()={}",list.size());
		
		model.addAttribute("list",list);
		
		return "employee/employeeList";
	}
	@RequestMapping(value="/employeeDetailSearch.do",method=RequestMethod.GET)
	public void employeeDetailSerach_get() {
		logger.info("사원 상세검색 화면 보여주기");
	}
	@RequestMapping(value="/employeeDetailSearch.do",method=RequestMethod.POST)
	public void employeeDetailSerach_post(@RequestParam String empName,
			@RequestParam String empPosition,Model model) {
		logger.info("사원 상세 검색 결과 보여주기 empName={},empPosition={}",empName,empPosition);
		
	}
	@RequestMapping("/employeeDetail.do")
	public String employeeDetail(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원상세보기 화면 보여주기,파라미터 empNo={}",empNo);
		
		EmployeeVO vo = employeeService.selectEmployeeByNo(empNo);
		logger.info("사원 상세 화면 보여주기 결과 vo={}",vo);
		model.addAttribute("vo",vo);
		
		return "employee/employeeDetail";
	}
}
