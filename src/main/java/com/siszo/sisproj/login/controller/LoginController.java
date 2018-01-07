package com.siszo.sisproj.login.controller;

import java.util.Random;

import javax.mail.MessagingException;
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

import com.siszo.sisproj.common.EmailSender;
import com.siszo.sisproj.commue.model.CommueService;
import com.siszo.sisproj.confirm.model.DocumentService;
import com.siszo.sisproj.confirm.model.DocumentVO;
import com.siszo.sisproj.employee.common.EmployeePwdLock;
import com.siszo.sisproj.employee.common.SHA256;
import com.siszo.sisproj.employee.model.EmployeeService;
import com.siszo.sisproj.employee.model.EmployeeVO;
import com.siszo.sisproj.login.model.LoginService;
import com.siszo.sisproj.message.model.MessageService;

@Controller
@RequestMapping("/login")
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private LoginService loginService;
	
	@Autowired
	private EmailSender emailSender;
	
	@Autowired
	private CommueService commueService;

	@Autowired
	private MessageService messageService;
	
	@Autowired
	private DocumentService docuService;

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
		
		String pwd = vo.getEmpPwd();
		String shaPwd = EmployeePwdLock.convertEncryption(pwd);
		vo.setEmpPwd(shaPwd);
		
		logger.info("암호화된 비밀번호 shaPwd={}",shaPwd);
		
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
		}else if(cnt==loginService.EMP_OUT){
			msg="퇴사직원은 로그인을 할 수 없습니다";
		}else {
			msg="로그인 실패!";
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
		EmployeeVO empVo = (EmployeeVO) session.getAttribute("empVo");
		logger.info("사원 간략정보 화면 보여주기 empVo={}",empVo);
				
		int resultIn=commueService.selectInChk(empVo.getEmpNo());
		logger.info("사원 출근을 하였었는지 체크하기 resultIn={}",resultIn);
		
		int resultOut=commueService.selectOutChk(empVo.getEmpNo());
		logger.info("사원 퇴근을 하였었는지 체크하기 resultOut={}",resultOut);
		
		DocumentVO dVo = new DocumentVO();
		dVo.setEmpNo(empVo.getEmpNo());
		dVo.setCfStatus(DocumentService.CONFIRM_AWAIT);
		int awaitCnt = docuService.selectSaveWaitAllCntThirdType(dVo);
		logger.info("결재대기함 문서 개수 조회 결과 awaitCnt={}",awaitCnt);
		
		model.addAttribute("resultOut",resultOut);
		model.addAttribute("resultIn",resultIn);
		
		int msgUnreadCnt = messageService.selectUnreadCount(empVo.getEmpNo());

		model.addAttribute("msgUnreadCnt", msgUnreadCnt);
		model.addAttribute("empVo",empVo);
		model.addAttribute("awaitCnt",awaitCnt);
		
		return "login/empInfo";
	}
	@RequestMapping(value="/searchPwd.do",method=RequestMethod.GET)
	public void searchpwd_get() {
		logger.info("비밀번호 찾기 화면 보여주기");
	}
	
	@RequestMapping(value="/searchPwd.do",method=RequestMethod.POST)
	public String searchPwd_post(@ModelAttribute EmployeeVO vo,Model model) {
		logger.info("비밀번호 찾기 파라미터 vo={}",vo);
		
		int result= loginService.searchPwd(vo.getEmpNo(), vo.getEmpName());
		
		EmployeeVO empVo = employeeService.selectEmployeeByNo(vo.getEmpNo());
		String msg="",url="";
		if(result==loginService.ID_NONE) {
			msg="사원번호가 일치하지않습니다";
		}else if(result==loginService.NAME_DISAGREE){
			msg="이름이 일치하지않습니다";
		}else if(result==loginService.SUSSCES_SEARCH) {
			StringBuffer ranPwd = new StringBuffer();
			Random rnd = new Random();
			for (int i = 0; i < 10; i++) {
			    int rIndex = rnd.nextInt(3);
			    switch (rIndex) {
			    case 0:
			        // a-z
			    	ranPwd.append((char) ((int) (rnd.nextInt(26)) + 97));
			        break;
			    case 1:
			        // A-Z
			    	ranPwd.append((char) ((int) (rnd.nextInt(26)) + 65));
			        break;
			    case 2:
			        // 0-9
			    	ranPwd.append((rnd.nextInt(10)));
			        break;
			    }
			}
			
			String ranPwd2 = ranPwd.toString();	
			logger.info("변경된 비밀번호 ranPwd2={}",ranPwd2);
					
			String subject="비밀번호 찾기에 대한 이메일입니다";		
			String content="변경된 비밀번호는 "+ranPwd2+" 입니다";	
			String receiver =empVo.getEmpEmail();			
			String sender="admin@herbmall.com";
			
			try {
				emailSender.sendEmail(subject, content, receiver, sender);
				logger.info("이메일 발송 성공!");
			}catch (MessagingException e) {
				logger.info("이메일 발송 실패!");
				e.printStackTrace();
			}
						
			String shaPwd=EmployeePwdLock.convertEncryption(ranPwd2);	
			logger.info("변경된 비밀번호 shaPwd={}",shaPwd);			
			
			empVo.setEmpPwd(shaPwd);
			
			logger.info("변경되어 수정된 비밀번호 shaPwd={}",shaPwd);
			int cnt = employeeService.employeeEditPwd(empVo);
			
			logger.info("이메일이 발송됨과 동시에 랜던값이 비밀번호에 셋팅됨 파라미터 ranPwd={},empVo={}",ranPwd,empVo);
		}
		model.addAttribute("msg",msg);
		
		return "common/message";
	}
}
