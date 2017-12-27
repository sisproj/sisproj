package com.siszo.sisproj.login.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
import com.siszo.sisproj.login.model.LoginService;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private LoginService loginService;

	@RequestMapping(value="/login.do",method=RequestMethod.GET)
	public void login_get() {
		logger.info("로그인 화면 보여주기");
	}
	
	@RequestMapping(value="/login.do",method=RequestMethod.POST)
	public String login_post(@ModelAttribute EmployeeVO vo,
			@RequestParam(required=false) String saveId,
			HttpServletRequest request, HttpServletResponse response,
			Model model) {
		logger.info("로그인 하기 파라미터 vo={},chkSaveId={}",vo,saveId);

		int cnt = loginService.loginCheck(vo.getEmpNo(), vo.getEmpPwd());

		String msg="",url="/login/login.do";
		if(cnt==loginService.LOGIN_OK) {
			EmployeeVO empVo = employeeService.selectEmployeeByNo(vo.getEmpNo());
			logger.info("로그인 후 파라미터 empVo={}",empVo);
			
			HttpSession session =request.getSession();
			session.setAttribute("empVo",empVo);
					
			String empNo = Integer.toString(empVo.getEmpNo());
			Cookie ck = new Cookie("ck_empNo",empNo);
			ck.setPath("/");			
			if(saveId!=null) {
				ck.setMaxAge(1000*24*60*60);
				response.addCookie(ck);
			}else {
				ck.setMaxAge(0);
				response.addCookie(ck);
			}
			msg=empVo.getEmpName() +"님 로그인되었습니다.";
			url="/home.do";
		}else if(cnt==loginService.ID_NONE) {
			msg="사원번호가 일치하지않습니다.";
		}else if(cnt==loginService.PWD_DISAGREE) {
			msg="비밀번호가 일치하지 않습니다.";
		}else {
			msg="로그인 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);
		
		return "common/message";
	}
	@RequestMapping("/logout.do")
	public String logout(HttpSession session,Model model) {
		logger.info("로그 아웃");
		
		session.removeAttribute("empNo");
		session.removeAttribute("empName");
		session.removeAttribute("empLev");
		
		model.addAttribute("msg","로그아웃 되셨습니다");
		model.addAttribute("url","/login/login.do");
		
		return "common/message";
	}
	@RequestMapping("/empInfo.do")
	public String detailEmployee(HttpSession session,Model model) {
		logger.info("사원  간략정보 화면 보여주기");
		
		/*		String empName = (String)session.getAttribute("empName");
		String empLev = (String)session.getAttribute("empLev");*/
		
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
	
		
		model.addAttribute("empVo",empVo);
		
		return "login/empInfo";
	}
}
