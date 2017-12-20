package com.siszo.sisproj.employee.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.siszo.sisproj.common.FileuploadUtil;
import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.model.EmployeeService;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
	
	@Autowired
	private EmployeeService employeeService;
	
	@Autowired
	private FileuploadUtil fileUtil;
	
	@Autowired
	private DeptService deptService;
	
	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.GET)
	public String employeeRegister_get() {
		logger.info("사원등록 화면 보여주기");	
		
		return "employee/employeeRegister";
	}	
	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.POST)
	public String employeeRegister_post(HttpServletRequest request,@ModelAttribute EmployeeVO vo,
			@RequestParam String empHiredate1,Model model) {
		logger.info("사원 등록 , 파라미터 vo={}, empHiredate1={}",vo, empHiredate1);
		
		Timestamp hiredate =Timestamp.valueOf(empHiredate1+" 00:00:00");
		
		/*String email1 = vo.getEmail1();
		String email2 = vo.getEmail2();
		String email3 = vo.getEmail3();
		
		String tel1 = vo.getTel1();
		String tel2 = vo.getTel2();
		String tel3 = vo.getTel3();
		
		String jumin1 = vo.getJumin1();
		String jumin2 = vo.getJumin2();
		
		
		logger.info("사원 등록 , 파라미터 vo={}",vo);
		if(vo.getEmpEmail()!=null && !vo.getEmpEmail().isEmpty()) {
			if(email2.equals("etc") && email1!=null && !email1.isEmpty() && email3!=null && !email3.isEmpty()) {
				vo.setEmpEmail(email1+"@"+email3);
			}else if(email1!=null && !email1.isEmpty() && email2!=null && !email2.isEmpty()){
				vo.setEmpEmail(email1+"@"+email2);
			}
		}
		if(vo.getEmpTel()!=null && !vo.getEmpTel().isEmpty()) {
			if(tel1!=null && !tel1.isEmpty() && tel2!=null && !tel2.isEmpty() && tel3!=null && !tel3.isEmpty()) {
				vo.setEmpTel(tel1+"-"+tel2+"-"+tel3);
			}
		}
		if(vo.getEmpSsn()!=null && !vo.getEmpSsn().isEmpty()) {
			if(jumin1!=null && !jumin1.isEmpty() && jumin2!=null && !jumin2.isEmpty()) {
				vo.setEmpSsn(jumin1+"-"+jumin2);
			}
		}*/
		vo.setEmpHiredate(hiredate);
		List<Map<String, Object>> list=null;
		String empImg="";
		long empImgSize=0;
		try {
			list=fileUtil.fileupload(request);
			
			//파일 업로드 한 경우
			if(list!=null && !list.isEmpty()){
				for(Map<String, Object> map : list){
					empImg=(String)map.get("filename");		
					empImgSize=(Long)map.get("fileSize");
				}//for
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		
		//db작업
		vo.setEmpImg(empImg);
		vo.setEmpImgSize(empImgSize);
		
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
	@RequestMapping("/employeeDetail.do")
	public String employeeDetail(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원상세보기 화면 보여주기,파라미터 empNo={}",empNo);
		
		EmployeeVO vo = employeeService.selectEmployeeByNo(empNo);
		
		List<DeptVO> list = deptService.selectDeptName();
		
		logger.info("사원 상세 화면 보여주기 결과 vo={}",vo);
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);
		
		return "employee/employeeDetail";
	}
	//완료
	
	@RequestMapping(value="/employeeEdit.do",method=RequestMethod.GET)
	public String employeeEdit_get(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원수정 화면 보여주기, 파라미터 값 empNo={}",empNo);			
		EmployeeVO vo =  employeeService.selectEmployeeByNo(empNo);
		
		model.addAttribute("vo",vo);
		logger.info("회원 수정 화면 결과값  vo={}",vo);
		
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
	
}
