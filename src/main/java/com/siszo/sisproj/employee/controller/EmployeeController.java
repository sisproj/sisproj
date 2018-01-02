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

	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.GET)
	public String employeeRegister_get() {
		logger.info("사원등록 화면 보여주기");	

		return "employee/employeeRegister";
	}	
	@RequestMapping(value="/employeeRegister.do",method=RequestMethod.POST)
	public String employeeRegister_post(@ModelAttribute EmployeeVO vo,
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

		logger.info("사원 상세 화면 보여주기 결과 vo={}",vo);
		model.addAttribute("vo",vo);

		return "employee/employeeDetail";
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

		int cnt= employeeService.editEmployee(vo);
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
	@RequestMapping("/employeeOut.do")
	public String employeeOut(@ModelAttribute EmployeeListVO vo,Model model) {
		logger.info("퇴사시킬 사원 ,파라미터 vo={}",vo);
		
		List<EmployeeVO> list = vo.getEmpItems();
		for(EmployeeVO emVo : list) {
			emVo.getEmpNo();
			logger.info("사원 번호  emVo.getEmpNo={}",emVo.getEmpNo());
		}
		int cnt=employeeService.employeeOut(list);
		logger.info("선택한 사원 퇴사 결과, cnt={}",cnt);		

		String msg="",url="/employee/employeeList.do";

		if(cnt>0) {
			msg="사원 퇴사 완료";
		}else {
			msg="사원 퇴사 실패";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	@RequestMapping("/employeeCome.do")
	public String employeeCome(@ModelAttribute EmployeeListVO vo,Model model) {
		logger.info("복직시킬 사원 ,파라미터 vo={}",vo);
		
		List<EmployeeVO> list = vo.getEmpItems();
		for(EmployeeVO emVo : list) {
			emVo.getEmpNo();
			logger.info("사원 번호  emVo.getEmpNo={}",emVo.getEmpNo());
		}
		int cnt=employeeService.employeeCome(list);
		logger.info("선택한 사원 복직 결과, cnt={}",cnt);		

		String msg="",url="/employee/employeeList.do";

		if(cnt>0) {
			msg="사원 복직 완료";
		}else {
			msg="사원 복직 실패";
		}

		model.addAttribute("msg",msg);
		model.addAttribute("url",url);

		return "common/message";
	}
	//완료

	@RequestMapping("/employeeList.do")
	public String employeeList(@ModelAttribute SearchVO seVo,Model model) {
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
		
		return "employee/employeeList";
	}

	@RequestMapping(value="/employeeDetailSearch.do",method=RequestMethod.POST)
	public void employeeDetailSerach_post(@RequestParam String empName,
			@RequestParam String posName,Model model) {
		logger.info("사원 상세 검색 결과 보여주기 empName={},posName={}",empName,posName);
	}

}
