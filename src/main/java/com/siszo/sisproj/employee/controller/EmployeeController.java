package com.siszo.sisproj.employee.controller;

import java.io.File;
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

import com.siszo.sisproj.common.FileUploadUtil;
import com.siszo.sisproj.common.PaginationInfo;
import com.siszo.sisproj.common.SearchVO;
import com.siszo.sisproj.common.Utility;
import com.siszo.sisproj.dept.model.DeptService;
import com.siszo.sisproj.dept.model.DeptVO;
import com.siszo.sisproj.employee.common.EmployeePwdLock;
import com.siszo.sisproj.employee.model.EmployeeListVO;
import com.siszo.sisproj.employee.model.EmployeeService;
import com.siszo.sisproj.employee.model.EmployeeVO;

@Controller
@RequestMapping("/employee")
public class EmployeeController {
	private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);

	@Autowired
	private EmployeeService employeeService;

	@Autowired
	private FileUploadUtil fileUtil;

	@Autowired
	private DeptService deptService;

	@RequestMapping(value="/adm/adminEmployeeRegister.do",method=RequestMethod.GET)
	public String adminEmployeeRegister_get() {
		logger.info("사원등록 화면 보여주기");	

		return "employee/adminEmployeeRegister";
	}	
	@RequestMapping(value="/adm/adminEmployeeRegister.do",method=RequestMethod.POST)
	public String adminEmployeeRegister_post(@ModelAttribute EmployeeVO vo,
			@RequestParam String empHiredate1,HttpServletRequest request,Model model) {
		logger.info("사원 등록 , 파라미터 vo={}, empHiredate1={}",vo, empHiredate1);

		Timestamp hiredate =Timestamp.valueOf(empHiredate1+" 00:00:00");

		vo.setEmpHiredate(hiredate);

		List<Map<String, Object>> list=null;
		String empImg="";
		try {
			list=fileUtil.fileupload(request,FileUploadUtil.EMP_IMAGE_UPLOAD);			
			//파일 업로드 한 경우
			if(list!=null && !list.isEmpty()){
				for(Map<String, Object> map : list){
					empImg=(String)map.get("fileName");		
				}//for
			}
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}		
		logger.info("vo.getEmpImg={}",vo.getEmpImg());
		//db작업
		vo.setEmpImg(empImg);
		
		String pwd = vo.getEmpPwd();
		String shaPwd=EmployeePwdLock.convertEncryption(pwd);
		vo.setEmpPwd(shaPwd);
		
		int cnt=employeeService.insertEmployee(vo);

		String msg="",url="/employee/adm/adminEmployeeRegister.do";
		if(cnt>0){
			msg="사원 등록 완료!";
			url="/employee/adm/adminEmployeeList.do";
		}else {
			msg="사원 등록 실패!";
		}
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/adm/adminEmployeeDetail.do")
	public String adminEmployeeDetail(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원상세보기 화면 보여주기,파라미터 empNo={}",empNo);

		EmployeeVO vo = employeeService.selectEmployeeByNo(empNo);

		logger.info("사원 상세 화면 보여주기 결과 vo={}",vo);
		model.addAttribute("vo",vo);
		
		return "employee/adminEmployeeDetail";
	}

	@RequestMapping(value="/adm/adminEmployeeEdit.do",method=RequestMethod.GET)
	public String adminEdminEmployeeEdit_get(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원수정 화면 보여주기, 파라미터 값 empNo={}",empNo);			
		
		EmployeeVO vo =  employeeService.selectEmployeeByNo(empNo);

		List<DeptVO> list= deptService.selectDeptName();
		
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);

		logger.info("회원 수정 화면 결과값  vo={}",vo);	

		return "employee/adminEmployeeEdit";
	}
	
	@RequestMapping(value="/adm/adminEmployeeEdit.do",method=RequestMethod.POST)
	public String adminEmployeeEdit_post(@ModelAttribute EmployeeVO vo
			,@RequestParam String empHiredate1,@RequestParam String oldFileName 
			,HttpServletRequest request,Model model) {
		logger.info("사원 수정 된 파라미터 vo={},empHiredate1={}",vo,empHiredate1);
		logger.info("사원 수정 된 파라미터 oldFileName={}",oldFileName);

		Timestamp hiredate =Timestamp.valueOf(empHiredate1+" 00:00:00");

		vo.setEmpHiredate(hiredate);

		List<Map<String, Object>> list=null;
		String empImg="";
		if(vo.getEmpImg()!=null && !vo.getEmpImg().isEmpty()) {
			try {
				list=fileUtil.fileupload(request,FileUploadUtil.EMP_IMAGE_UPLOAD);			
				if(list!=null && !list.isEmpty()){
					for(Map<String, Object> map : list){
						empImg=(String)map.get("fileName");	

						vo.setEmpImg(empImg);
					}
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}		
			logger.info("vo.getEmpImg={}",vo.getEmpImg());
		}	
		//db작업

		int cnt= employeeService.editEmployee(vo);
		logger.info("수정 결과 cnt={}",cnt);
		String msg="",url="";

		if(cnt>0) {
			msg="사원 수정 성공!";
			url="/employee/adm/adminEmployeeDetail.do?empNo="+vo.getEmpNo();

			if(empImg!=null && !empImg.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String path=fileUtil.getUploadPath(request, FileUploadUtil.EMP_IMAGE_UPLOAD);
					File delFile = new File(path, oldFileName);
					if(delFile.exists()) {
						boolean bool=delFile.delete();
						logger.info("기존 파일 삭제여부 bool={}", bool);
					}
				}
			}
		}else {
			msg="사원 수정 실패!";
			url="/employee/adm/adminEmployeeEdit.do?empNo="+vo.getEmpNo();
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/adm/employeeOut.do")
	public String adminEmployeeOut(@ModelAttribute EmployeeListVO vo,Model model) {
		logger.info("퇴사시킬 사원 ,파라미터 vo={}",vo);
		int count=0;
		int cnt=0;		
		
		String msg="",url="/employee/adm/adminEmployeeList.do";
		List<EmployeeVO> list = vo.getEmpItems();
		for(EmployeeVO emVo : list) {
			emVo.getEmpNo();
			logger.info("사원 번호  emVo.getEmpNo={}",emVo.getEmpNo());
			count=employeeService.employeeOutCheck(emVo.getEmpNo());
		}
		if(count==employeeService.OUT_NONE) {
			 cnt=employeeService.employeeOut(list);
			logger.info("선택한 사원 퇴사 결과, cnt={}",cnt);		
			msg="사원 퇴사 완료";
		}else {
			msg="이미 퇴사한 사원입니다";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/adm/employeeCome.do")
	public String adminEmployeeCome(@ModelAttribute EmployeeListVO vo,Model model) {
		logger.info("복직시킬 사원 ,파라미터 vo={}",vo);
		int count=0;
		int cnt=0;		
		List<EmployeeVO> list = vo.getEmpItems();
		for(EmployeeVO emVo : list) {
			emVo.getEmpNo();
			logger.info("사원 번호  emVo.getEmpNo={}",emVo.getEmpNo());
			count=employeeService.employeeOutCheck(emVo.getEmpNo());
		}
		
		String msg="",url="/employee/adm/adminEmployeeList.do";
		if(count==employeeService.OUT_OK) {
			 cnt=employeeService.employeeCome(list);
			logger.info("선택한 사원 복직 결과, cnt={}",cnt);		
			msg="사원 복직 완료";
		}else {
			msg="재직중인 사원입니다";			
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/adm/employeeUpdateMaster.do")
	public String adminEmployeeUpdateMaster(@ModelAttribute EmployeeListVO vo,Model model) {
		logger.info("관리자로 올릴 사원 , 파라미터 vo={}",vo);
		int count=0;
		int cnt=0;
		List<EmployeeVO> list = vo.getEmpItems();
		String msg="",url="/employee/adm/adminEmployeeList.do";
		for(EmployeeVO emVo : list) {
			emVo.getEmpNo();
			logger.info("사원 번호  emVo.getEmpNo={}",emVo.getEmpNo());
			count=employeeService.employeeMasterCheck(emVo.getEmpNo());
		}
		
		logger.info("관리자로 직급 변환 결과 조회 컨트롤러 count={}",count);
		if(count==employeeService.MASTER_NONE) {
			cnt = employeeService.employeeUpdateMaster(list);
			logger.info("선택한 관리자로 변경  결과, cnt={}",cnt);	
			msg="사원 관리자로 올리기 완료";
		}else {
			msg="사원 관리자로 올리기  실패";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/adm/employeeUpdateTeam.do")
	public String adminEmployeeUpdateTeam(@ModelAttribute EmployeeListVO vo,Model model) {
		logger.info("팀장으로 권한을 준 사원, 파라미터 vo={}",vo);
		List<EmployeeVO> list = vo.getEmpItems();
		int count=0;
		int cnt=0;
		
		for(EmployeeVO emVo : list) {
			emVo.getEmpNo();
			logger.info("사원 번호  emVo.getEmpNo={}",emVo.getEmpNo());
			count=employeeService.employeeTeamCheck(emVo.getEmpNo());
		}
		logger.info("팀장으로 직급 변환 결과 count={}",count);
		
		String msg="",url="/employee/adm/adminEmployeeList.do";
		if(count==employeeService.TEAM_NONE) {
			cnt = employeeService.employeeUpdateTeam(list);
			logger.info("선택한 팀장으로 변경  결과, cnt={}",cnt);	
			msg="사원 팀장으로 변경 완료";
		}else {
			msg="사원 팀장으로 변경 실패";
		}
		
		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/adm/adminEmployeeList.do")
	public String adminEmployeeList(@ModelAttribute SearchVO seVo,Model model) {
		logger.info("사원 리스트 화면 보여주기 seVo={}",seVo );	
		
		PaginationInfo pagingInfo = new PaginationInfo();
		pagingInfo.setBlockSize(Utility.BLOCK_SIZE);
		pagingInfo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		pagingInfo.setCurrentPage(seVo.getCurrentPage());
		
		//SearchVo에 값 셋팅
		seVo.setRecordCountPerPage(Utility.RECORD_COUNT_PER_PAGE);
		seVo.setFirstRecordIndex(pagingInfo.getFirstRecordIndex());
		logger.info("searchVo 최종값 : {}", seVo);

		List<EmployeeVO> list =employeeService.selectAllEmployee(seVo);
		
		logger.info("사원수 결과, list.size()={}", list.size());

		int totalRecord = employeeService.selectTotalRecordCount(seVo);
		logger.info("사원 전체 인원 조회 결과, totalRecord={}", totalRecord);			

		pagingInfo.setTotalRecord(totalRecord);		
		
		model.addAttribute("list", list);
		model.addAttribute("pagingInfo", pagingInfo);
		
		return "employee/adminEmployeeList";
	}
	
	/*사원 컨트롤러*/
	@RequestMapping(value="/employeeEdit.do",method=RequestMethod.POST)
	public String employeeEdit_post(@ModelAttribute EmployeeVO vo
			,@RequestParam String empHiredate1,@RequestParam String oldFileName 
			,HttpServletRequest request,Model model) {
		logger.info("사원 수정 된 파라미터 vo={},empHiredate1={}",vo,empHiredate1);
		logger.info("사원 수정 된 파라미터 oldFileName={}",oldFileName);
		
		Timestamp hiredate =Timestamp.valueOf(empHiredate1+" 00:00:00");
		
		vo.setEmpHiredate(hiredate);
		
		List<Map<String, Object>> list=null;
		String empImg="";
		if(vo.getEmpImg()!=null && !vo.getEmpImg().isEmpty()) {
			try {
				list=fileUtil.fileupload(request,FileUploadUtil.EMP_IMAGE_UPLOAD);			
				if(list!=null && !list.isEmpty()){
					for(Map<String, Object> map : list){
						empImg=(String)map.get("fileName");	

						vo.setEmpImg(empImg);
					}
				}
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}		
			logger.info("vo.getEmpImg={}",vo.getEmpImg());
		}	
		//db작업

		String shaPwd=EmployeePwdLock.convertEncryption(vo.getEmpPwd());	
		logger.info("변경된 비밀번호 shaPwd={}",shaPwd);			
		
		vo.setEmpPwd(shaPwd);
		
		logger.info("변경되어 수정된 비밀번호 shaPwd={}",shaPwd);
		
		int cnt= employeeService.editEmployeeEmp(vo);

		logger.info("수정 결과 cnt={}",cnt);
		String msg="",url="";

		if(cnt>0) {
			msg="사원 수정 성공!";
			url="/employee/employeeDetail.do?empNo="+vo.getEmpNo();

			if(empImg!=null && !empImg.isEmpty()) {
				if(oldFileName!=null && !oldFileName.isEmpty()) {
					String path=fileUtil.getUploadPath(request, FileUploadUtil.EMP_IMAGE_UPLOAD);
					File delFile = new File(path, oldFileName);
					if(delFile.exists()) {
						boolean bool=delFile.delete();
						logger.info("기존 파일 삭제여부 bool={}", bool);
					}
				}
			}
		}else {
			msg="사원 수정 실패!";
			url="/employee/employeeEdit.do?empNo="+vo.getEmpNo();
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping(value="/employeeEdit.do",method=RequestMethod.GET)
	public String employeeEdit_get(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원수정 화면 보여주기, 파라미터 값 empNo={}",empNo);			
		
		EmployeeVO vo =  employeeService.selectEmployeeByNo(empNo);

		List<DeptVO> list= deptService.selectDeptName();
		
		model.addAttribute("vo",vo);
		model.addAttribute("list",list);

		logger.info("회원 수정 화면 결과값  vo={}",vo);	

		return "employee/employeeEdit";
	}
	@RequestMapping("/employeeDetail.do")
	public String employeeDetail2(@RequestParam(defaultValue="0") int empNo,Model model) {
		logger.info("사원상세보기 화면 보여주기,파라미터 empNo={}",empNo);

		EmployeeVO vo = employeeService.selectEmployeeByNo(empNo);

		logger.info("사원 상세 화면 보여주기 결과 vo={}",vo);
		model.addAttribute("vo",vo);
		
		return "employee/employeeDetail";
	}
}
